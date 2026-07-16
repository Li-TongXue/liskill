# liskill

> 面向老板、创业者、实体门店和内容创作者的中文 AI Skills。把真实的内容与经营问题交给 Agent，获得清晰判断和可以立即执行的下一步。

[![Version](https://img.shields.io/badge/version-1.0.1-111111.svg)](VERSION)
[![Skills](https://img.shields.io/badge/Skills-1-111111.svg)](#能力一览)
[![License](https://img.shields.io/badge/license-CC%20BY--NC%204.0-111111.svg)](LICENSE)

**支持：豆包 Agent、Codex、Claude Code，以及其他支持 Skills 的 Agent。**

liskill 由拥有 7 年自媒体经验的李同学（Li-TongXue）创建，方法来自长期的内容教学、客户服务和创业经营现场，累计服务过 1 万多名学员。

[快速开始](#快速开始) · [能力一览](#能力一览) · [安装](#安装) · [更新日志](https://github.com/Li-TongXue/liskill/releases)

本次更新（v1.0.1）：创业小团队岗位诊断现已上线：从具体事件出发，判清员工的真实岗位、责任阶段、当前主矛盾、最低标准和授权边界。

## liskill 解决什么问题

你不需要先研究 Skill 名称，也不需要把问题整理成标准格式。直接把最近发生的真实事情交给 `/li`，它会先确认事实、判断当前问题，再进入合适的处理流程。

| 真实处境 | 你会得到 |
|---|---|
| 员工总让你觉得累，但你说不清是能力、岗位接口还是授权边界的问题。 | 岗位诊断、三条最低标准、授权红线与下一步验证动作。 |

## 快速开始

安装完成后，直接在 Agent 中输入：

```text
/li 我的助理同时负责排期、采购和跨部门推进，但事情经常没有收口。我想判断这是能力问题、岗位接口问题，还是授权边界没定清。
```

`/li` 会根据你提供的事实开始处理。信息不足时，它会一次只追问一个最影响判断的问题；完成一轮后，你可以继续补充新的事实或反馈。

已经知道入口时，也可以直接调用：

```text
/li-startup-role-diagnosis 员工总让你觉得累，但你说不清是能力、岗位接口还是授权边界的问题。
```

## 能力一览

### 创业经营

| Skill | 主要入口 | 常见产出 |
|---|---|---|
| 创业小团队岗位诊断 | `/li-startup-role-diagnosis` | 岗位诊断、三条最低标准、授权红线与下一步验证动作。 |

英文 Skill 名只用于系统调用，日常使用记住 `/li` 即可。

## 安装

### Gitee 国内安装

```bash
npx -y skills add https://gitee.com/LTX12/liskill.git -g --all
```

### GitHub 安装

```bash
npx -y skills add Li-TongXue/liskill -g --all
```

安装完成后，新建一个 Agent 对话，输入 `/li`。

### 更新

重新运行对应安装命令即可更新。版本变化和安装包见 [GitHub Releases](https://github.com/Li-TongXue/liskill/releases)。

## liskill 怎样工作

```text
真实材料或经营事件
        ↓
/li 判断当前问题与适用入口
        ↓
一个 Skill 完成诊断或产出
        ↓
补充事实与反馈，再决定下一步
```

liskill 不会只根据一句情绪评价给人贴标签，也不会为了显得完整而凭空补造经历、数据或人物动机。涉及法律、财税、医疗等专业问题时，应以专业意见为准。

## 作者

作者：[李同学（Li-TongXue）](https://github.com/Li-TongXue)

[小红书：进击的李同学（重庆小班）](https://xhslink.com/m/3FfGKJ9Fk4u) · [抖音：李同学](https://v.douyin.com/sFtpVEJWCgs/)

## 许可证

本项目采用 [CC BY-NC 4.0](LICENSE) 许可证。

- 个人使用、学习、研究与非商业项目可以直接使用。
- 公开发布衍生作品时，请注明来源。
- 商业用途需要单独获得作者授权。
