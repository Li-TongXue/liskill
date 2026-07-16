# liskill

liskill 是一套面向老板、创业者、实体门店和内容创作者的中文 Skills，覆盖内容创作与创业经营，把真实素材和经营事实整理成可以执行、验证和复用的方法。

普通模型往往只是把信息写得“像答案”。liskill 更重视先确认真实素材或经营事实，区分事实与判断，再给出可以执行和验证的结果。当前能力按“内容创作”和“创业经营”分区展示。

**当前版本：v1.0.1**

**本次更新：** 创业小团队岗位诊断现已上线：从具体事件出发，判清员工的真实岗位、责任阶段、当前主矛盾、最低标准和授权边界。

> [!IMPORTANT]
> **仅限非商业使用。** liskill 采用 CC BY-NC 4.0 许可证。未经作者另行书面授权，不得收费销售、付费分发、打包售卖本项目或其改编版本，也不得将其作为收费产品或收费服务的核心组成部分。

## 安装

支持 Skills 的 Agent 可运行：

```bash
npx -y skills add Li-TongXue/liskill -g --all
```

GitHub 访问不稳定时，可使用 Gitee：

```bash
npx -y skills add https://gitee.com/LTX12/liskill.git -g --all
```

安装后新建一个 Agent 对话，输入 `/li`。

## Skill 列表

### 内容创作

当前暂无 Skill。

### 创业经营

| 中文名称 | 能解决什么问题 | 怎么使用 |
|---|---|---|
| 创业小团队岗位诊断 | 判断员工的真实岗位、责任阶段、当前主矛盾、最低标准和授权边界，并按需生成岗位使用说明书。 | 输入 `/li`，描述最近一次让你困扰的员工或岗位事件。 |

英文 Skill 名只用于系统内部调用，用户不需要记忆。每次版本更新，本页都会同步更新 Skill 分类、简介和使用方式。

## 使用边界

- 只根据用户提供的真实素材和事实形成判断，不凭空编造经历、数据或人物动机。
- 具体 Skill 的适用场景和专业边界优先；法律、财税、医疗等问题不由通用 Skill 替代专业意见。
- 安装包、README 和 `/li` 总入口中的能力清单保持一致。

## 作者

liskill 由拥有 7 年自媒体经验的李同学（Li-TongXue）整理，累计服务过 1 万多名学员。

[小红书：进击的李同学（重庆小班）](https://xhslink.com/m/3FfGKJ9Fk4u) · [抖音：李同学](https://v.douyin.com/sFtpVEJWCgs/) · [GitHub：Li-TongXue](https://github.com/Li-TongXue)

## 许可证

本项目采用 [CC BY-NC 4.0](https://creativecommons.org/licenses/by-nc/4.0/) 许可证，仅允许非商业使用。完整条款以 [LICENSE](LICENSE) 为准。
