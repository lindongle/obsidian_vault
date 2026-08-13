---
author: 胡桃小孩儿
source: 微信公众号
url: https://mp.weixin.qq.com/s?__biz=MzIzMTY1NjA3OA==&mid=2247489990&idx=1&sn=cdc72717065c8426d0910cd8059b809c&chksm=e9a7851ce49764782aa4281ffd7fb4591ff311571eec93d8eee34eff357a4b428e6c6fc95230&mpshare=1&scene=1&srcid=07148kpVvnbDgiBDDZy66JiW&sharer_shareinfo=c4fe74668b4a669be18ffd87fdd39a99&sharer_shareinfo_first=c4fe74668b4a669be18ffd87fdd39a99#rd
Created: 2026-07-14 12:35:45
tags:
  - 笔记同步助手
id: 6d498f6f-d31c-4ccb-a188-8fb7142229d7
title: 为什么需要 PinkBin？
created: 2026-07-14T13:28:51+08:00
updated: 2026-07-15T10:25:19+08:00
---

公众号名称：胡桃小院

作者名称：胡桃小孩儿

发布时间：2026-06-16 11:30

> **PinkBin** 是一个 MIT 开源的 Windows 磁盘扫描与清理工具，主打"**扫盘 · 看懂 · 一条一条删干净**"三步流程，把 AI 能力注入到磁盘清理中，让你告别"不敢删、不会删、删错后悔"的困境。

# 为什么需要 PinkBin？

相信每个用过 Windows 的人都经历过这样的场景：

-   • 💾 C 盘又红了，但不知道哪些文件夹能删
    
-   • 🗑️ 下载了一个"清理工具"，结果把重要文件一起打包删了
    
-   • 😵 看到 `AppData`、`LocalLow`、`ServiceProfiles` 一脸懵，怕删错系统崩了
    
-   • ⏱️ 想手动清理又太费时间，一个个右键查看属性太痛苦
    

传统清理工具的痛点：**盲目扫描、批量删除、无法解释"为什么"和"删了会怎样"**。

PinkBin 的解题思路完全不同 —— **先可视化、再 AI 解读、最后按 scope 逐条删**。

![[99-Assets/d4b0cca553253e4fe4e463ca7d5fba51_MD5.png]]

# 核心特色

## 🎨 1. 秒扫整盘，Treemap 一目了然

PinkBin 可以在 **2-5 秒**内扫描整块磁盘，生成**彩色 Treemap（树状图）**。每个方块代表一个文件夹，大小对应该文件夹占用空间，**一眼就能看到"空间都去哪了"**。

## 🤖 2. AI 解读陌生文件夹

遇到不认识的大文件夹？直接 **拖给 AI**，它会告诉你：

-   • 这个文件夹**是什么**（属于哪个软件 / 系统组件）
    
-   -   **能不能删**（安全 / 风险 / 绝对不要动）
-   • 删了会**丢什么**（缓存、历史记录、配置……）
    

工作流示例:

1.  1\. 看到 `C:\Users\xxx\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_xxxx` 占了好几个 G
    
2.  2\. 把这个文件夹拖进 AI 对话框
    
3.  3\. AI 回复：这是 Windows 自带的"内容交付管理器"缓存，可以安全删除
    
4.  4\. 放心删除，回收几 GB 空间
    

## 🧩 3. Scaffold TOML 模板系统

PinkBin 内置了一组 `scaffolds/<id>.toml` 模板文件，**每份模板描述一个常用软件的清理目标**，包括：

-   • 缓存目录
    
-   • 日志文件
    
-   • 可选的历史记录
    

这种设计的妙处在于：**清理规则是数据，不是代码**。社区可以轻松贡献新模板，覆盖更多软件（Chrome、Steam、Docker、VS Code……）。

## 🎯 4. 按 Scope 逐条删，绝不批量误删

和传统工具的"一键清理"不同，PinkBin 严格按 **scope（作用域）** 逐项处理。**没有"一键全删"按钮**，每一步都让你看清楚再动手。

![[99-Assets/6fa5cea39b37ec9a3eeb3cce50980dfe_MD5.png]]

# 技术架构

| 层级 | 技术 | 说明 |
| --- | --- | --- |
| **前端** | React | 现代化 UI，快速响应 |
| **后端** | Rust | 高性能扫描，内存安全 |
| **框架** | Tauri 2 | 比 Electron 更轻量，体积小、启动快 |
| **规则** | TOML | 清理目标用结构化文件描述，易扩展 |

  

# 快速上手

## 第一步：下载安装

前往 Releases 页面 下载安装包，双击安装。

Windows SmartScreen 拦截 : PinkBin 目前**未做代码签名**（独立开源项目，签名证书需要后续 sponsor）。Windows SmartScreen 会拦截首次运行。

正确流程：**双击安装包 → 点"更多信息" → "仍要运行"**。

## 第二步：配置 AI

打开应用 → 右上角 ⚙ → 填入你的 LLM API Key（支持任意兼容 OpenAI API 协议的服务）。

## 第三步：扫描

顶部"选择磁盘或文件夹" → 点扫描 → **2-5 秒**后看到 treemap + 树形目录。

## 第四步：AI 解读 + 清理

遇到陌生大文件夹 → 拖给 AI → 收到解读 → 按 scope 逐项放心删。

# 注意事项

-   • ⚠️ **平台**：目前主要面向 **Windows** 用户
    
-   • ⚠️ **代码签名**：首次运行需要手动通过 SmartScreen 拦截
    
-   • ⚠️ **AI 成本**：调用 LLM API 会产生少量费用，建议使用便宜的模型（如 GPT-4o-mini、DeepSeek 等）
    
-   • ⚠️ **谨慎删除**：虽然有 AI 辅助，但 **系统关键文件（`Windows`、`Program Files`）请勿删除**
    

**![[99-Assets/ed0b596be996c70c733f271ca406603b_MD5.jpg]]**

# 总结

PinkBin 用一种**克制而聪明**的方式重新定义了磁盘清理工具：

| 维度 | 传统清理工具 | PinkBin |
| --- | --- | --- |
| 扫描速度 | 慢，全盘 IO 风暴 | **2-5 秒**出图 |
| 可视化 | 列表 / 饼图 | **彩色 Treemap** |
| 决策依据 | 黑盒规则 | **AI 解释 + Scope 透明** |
| 删除方式 | 一键批量 | **逐条确认** |
| 扩展性 | 闭源 | **TOML 模板，社区可贡献** |
| 体积 | 几十～几百 MB | **Tauri 构建，更轻量** |

如果Github打开失败，可以直接下载：

链接：https://pan.quark.cn/s/a189ace329cc

# 相关链接

-   • 🔗 GitHub 仓库：https://github.com/cccyd2003-qwq/pinkbin
    
-   • 📦 Releases：https://github.com/cccyd2003-qwq/pinkbin/releases
    

#开源工具 #磁盘清理 #AI #Tauri #Rust

  

---

内容效果不满意？[点此反馈](https://feedback.notebooksyncer.com/feedback/8dfb804b_1784003743009?u=https%3A%2F%2Fmp.weixin.qq.com%2Fs%3F__biz%3DMzIzMTY1NjA3OA%3D%3D%26mid%3D2247489990%26idx%3D1%26sn%3Dcdc72717065c8426d0910cd8059b809c%26chksm%3De9a7851ce49764782aa4281ffd7fb4591ff311571eec93d8eee34eff357a4b428e6c6fc95230%26mpshare%3D1%26scene%3D1%26srcid%3D07148kpVvnbDgiBDDZy66JiW%26sharer_shareinfo%3Dc4fe74668b4a669be18ffd87fdd39a99%26sharer_shareinfo_first%3Dc4fe74668b4a669be18ffd87fdd39a99%23rd&s=obsidian)