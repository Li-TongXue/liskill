#!/usr/bin/env python3
from pathlib import Path
import json
import re

root = Path(__file__).resolve().parent.parent
version = (root / "VERSION").read_text(encoding="utf-8").strip()

if not re.fullmatch(r"\d+\.\d+\.\d+", version):
    raise SystemExit(f"invalid VERSION: {version!r}")

skills = sorted((root / "skills").glob("*/SKILL.md"))
names = {skill.parent.name for skill in skills}
if "li" not in names or len(names) < 2:
    raise SystemExit(f"invalid public skill set: {sorted(names)}")

for skill_md in skills:
    text = skill_md.read_text(encoding="utf-8")
    match = re.match(r"^---\n(.*?)\n---\n", text, re.S)
    if not match:
        raise SystemExit(f"missing YAML frontmatter: {skill_md}")
    name_match = re.search(r"^name:\s*([^\n]+)$", match.group(1), re.M)
    if not name_match or name_match.group(1).strip() != skill_md.parent.name:
        raise SystemExit(f"folder/name mismatch: {skill_md}")

readme = (root / "README.md").read_text(encoding="utf-8")
if f"v{version}" not in readme:
    raise SystemExit(f"README does not mention v{version}")

marketplace = json.loads(
    (root / ".claude-plugin" / "marketplace.json").read_text(encoding="utf-8")
)
published = {
    Path(path).name
    for plugin in marketplace["plugins"]
    for path in plugin.get("skills", [])
}
if published != names:
    raise SystemExit("marketplace skill list does not match public skills")

if marketplace["metadata"]["version"] != version:
    raise SystemExit("marketplace metadata version mismatch")
if any(plugin["version"] != version for plugin in marketplace["plugins"]):
    raise SystemExit("marketplace plugin version mismatch")

for name in names - {"li"}:
    if f"./skills/{name}" not in marketplace["plugins"][0]["skills"]:
        raise SystemExit(f"public skill missing from metadata: {name}")

print(f"validated {len(skills)} public skills for v{version}")
