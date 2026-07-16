#!/usr/bin/env bash
set -euo pipefail

TAG="${1:?usage: publish-gitee-release.sh <tag> <asset>}"
ASSET="${2:?usage: publish-gitee-release.sh <tag> <asset>}"
OWNER="${GITEE_OWNER:-LTX12}"
REPO="${GITEE_REPO:-liskill}"
TOKEN="${GITEE_ACCESS_TOKEN:?GITEE_ACCESS_TOKEN is required}"
API="https://gitee.com/api/v5/repos/${OWNER}/${REPO}"

if [[ ! -f "$ASSET" ]]; then
  echo "asset not found: $ASSET" >&2
  exit 1
fi

RESPONSE="$(mktemp)"
trap 'rm -f "$RESPONSE"' EXIT

STATUS="$(curl -sS -o "$RESPONSE" -w '%{http_code}' \
  -H "Authorization: token ${TOKEN}" \
  "${API}/releases/tags/${TAG}")"

if [[ "$STATUS" == "200" ]] && jq -e 'type == "object" and .id != null' "$RESPONSE" >/dev/null; then
  RELEASE_ID="$(jq -r '.id' "$RESPONSE")"
  ASSET_NAME="$(basename "$ASSET")"
  if jq -e --arg name "$ASSET_NAME" \
    '(.assets // [])[] | select(.name == $name)' "$RESPONSE" >/dev/null; then
    echo "Gitee release ${TAG} already contains ${ASSET_NAME}"
    exit 0
  fi
elif [[ "$STATUS" == "404" || "$STATUS" == "200" ]]; then
  STATUS="$(curl -sS -o "$RESPONSE" -w '%{http_code}' \
    -X POST \
    -H "Authorization: token ${TOKEN}" \
    -F "tag_name=${TAG}" \
    -F "name=${TAG}" \
    -F "body=liskill ${TAG} 国内镜像安装包。完整版本说明见 GitHub Release。" \
    -F "prerelease=false" \
    -F "target_commitish=${TAG}" \
    "${API}/releases")"
  if [[ "$STATUS" != "201" ]]; then
    echo "failed to create Gitee release (HTTP ${STATUS})" >&2
    jq -r '.message // empty' "$RESPONSE" >&2 || true
    exit 1
  fi
  RELEASE_ID="$(jq -r '.id' "$RESPONSE")"
else
  echo "failed to query Gitee release (HTTP ${STATUS})" >&2
  jq -r '.message // empty' "$RESPONSE" >&2 || true
  exit 1
fi

STATUS="$(curl -sS -o "$RESPONSE" -w '%{http_code}' \
  -X POST \
  -H "Authorization: token ${TOKEN}" \
  -F "file=@${ASSET}" \
  "${API}/releases/${RELEASE_ID}/attach_files")"

if [[ "$STATUS" != "201" ]]; then
  echo "failed to upload Gitee release asset (HTTP ${STATUS})" >&2
  jq -r '.message // empty' "$RESPONSE" >&2 || true
  exit 1
fi

ASSET_NAME="$(basename "$ASSET")"
echo "published ${ASSET_NAME} to Gitee release ${TAG}"
