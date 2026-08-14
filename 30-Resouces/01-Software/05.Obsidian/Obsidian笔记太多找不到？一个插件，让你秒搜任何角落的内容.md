---
author: YouCore王世民
source: 微信公众号
url: https://mp.weixin.qq.com/s?__biz=MzY5MjI4NjA4Mg==&mid=2247484162&idx=1&sn=3762f155f3681a753990ef7b7bb088f5&chksm=f5ac5265eb2e47c7401222a649c2e782e29c03f53c2ed6b109e9767a18c5395c7549ea510d26&mpshare=1&scene=1&srcid=0715nouJIpYacXjgHWMniYzr&sharer_shareinfo=3942c0739c6115c44dd819516679230c&sharer_shareinfo_first=3942c0739c6115c44dd819516679230c#rd
Created: 2026-07-15 18:50:55
tags:
  - 笔记同步助手
id: 731a6663-ef9c-40a0-895b-6b6b1c9d0309
title: 模式一：Vault 搜索（全局搜索）
created: 2026-07-15T21:48:33
updated: 2026-07-15T22:04:31
---

公众号名称：YC思维与学习

作者名称：YouCore王世民

发布时间：2026-06-30 21:53

![[99-Assets/cd78bf9121b3b0c46706cd0999d42df6_MD5.gif]]

文 / 王世民

深圳尔雅总裁 | YouCore创始人  

著有《思维力》《学习力》《减法》

Obsidian 里攒了上千篇笔记，明明记得写过某个观点、记过某段摘录，但打开搜索框一搜，出来一堆不相关的结果，翻了三页还没找到。

最后只能凭记忆一层层点开文件夹手动翻，五分钟过去了，灵感早凉了。

更崩溃的是，你搜的是一个关键词，但 Obsidian 核心搜索只按字符匹配。你记错了词序、多打了一个空格、或者笔记里用的是近义词，它就当没看见。

这不是你的问题。

Obsidian 自带的搜索是精确匹配引擎，笔记少的时候够用，笔记一多，它的局限性就暴露了。

你可能会想：那我就把笔记整理得井井有条，不就行了？

确实可以。

但整理几千篇笔记要花多少时间？而且每次写新笔记都要先想好放哪、打什么标签。这本身就是一种认知负担。

**有没有一种方法：你只管写，搜索时随便打几个关键词，笔记就能自己跳出来？**

有。就是今天要说的 Omnisearch 插件。

01

这个插件做了什么？

Omnisearch 是 Obsidian 社区插件，2023 年 Obsidian 官方年度插件评选「最佳已有插件」获奖者。

功能一句话说清楚：**用智能算法替代精确匹配，你随便搜，它帮你找到最相关的那篇。**

安装之后，打开搜索（Ctrl+Shift+O），效果是这样的：

![[99-Assets/9068eb3b3256e31c551f7b43f5c12aae_MD5.gif]]

它和 Obsidian 核心搜索的区别，用一张表说清楚：

![[99-Assets/eaa47d11df582ae33a06a8d32c33b9e3_MD5.jpg]]

> 简单说：核心搜索是“你要精确告诉它找什么”，Omnisearch 是“你大概描述一下，它帮你找到最可能的那个”。
> 
> 对于笔记多、目录杂、记性差的用户，这完全是两种体验。

02

安装方法

安装极其简单，不需要任何命令行操作。

打开 Obsidian，进入 **设置 → 社区插件市场 → 浏览**，搜索 **“Omnisearch”**，点击安装，再点启用。完成。

> 注意：如果看不到“社区插件市场”选项，需要先在设置中关闭“安全模式”（安全模式会禁用所有第三方插件）。

整个过程不超过 30 秒。

> 中文用户注意：如果你的笔记以中文为主，建议额外安装 cm-chs-patch 插件来优化中文分词，安装后记得清除 Omnisearch 的搜索缓存。

03

三种搜索模式，总有一种适合你

Omnisearch 提供了两种搜索入口，覆盖不同的使用场景。

# 模式一：Vault 搜索（全局搜索）

通过命令面板或快捷键打开 "Omnisearch: Vault search“，输入关键词，插件会扫描整个知识库，把最相关的笔记排在前面。

相关性的计算基于 BM25 算法，综合考虑了：关键词在正文中出现的频率、文件名匹配度、标题匹配度、路径匹配度。

所以你不需要记笔记的全名，只要输入几个”想到什么打什么“的关键词，它大概率能猜中你要找的那篇。

# 模式二：文件内搜索（In-File Search）

在 Vault 搜索结果中按 `Tab` 键，可以切换到当前笔记的内部搜索，列出所有匹配位置。按回车直接跳转到对应段落。

也可以通过命令面板直接打开 "Omnisearch: In-file search”，在当前活动笔记中搜索。

> 注意：文件内搜索仅在 Markdown 笔记中可用，PDF 和图片不支持。

# 模式三：高级过滤语法

当你需要精确筛选时，Omnisearch 也支持几种过滤语法：![[99-Assets/e07401c7baacccac1c573215662d4f4c_MD5.png]]

> 大多数时候你不需要这些语法。这正是 Omnisearch 的核心价值。但当你需要精确筛选时，它们就在手边。

  

04

进阶：连 PDF 和图片里的文字也能搜

这是 Omnisearch 最让人惊喜的功能之一。

安装 Text Extractor 插件后，Omnisearch 可以索引 PDF、图片（OCR）、Word 文档和 Excel 表格中的文字内容。这意味着：

你往 Obsidian 里扔了一份 PDF 报告，不用打开它，直接在 Omnisearch 里搜报告里的关键词，它就能找到。

# 配置方法：

1、在社区插件市场安装 **Text Extractor** 插件并启用

2、打开 Omnisearch 设置，确保 PDF、图片等索引选项已开启

3、重启 Obsidian，等待首次索引完成

> 注意：首次索引 PDF 和图片可能需要较长时间（取决于文件数量），但结果会被缓存，下次启动就快了。
> 
> 如果你的 PDF 数量不多、或者不需要搜图片文字，可以不装 Text Extractor，Omnisearch 本身对 Markdown 的搜索已经足够好用。

05

行动指南：3分钟搞定智能搜索

现在，花 3 分钟把这件事解决掉。

**第一步（1分钟）**：打开 Obsidian 社区插件市场，搜索安装 Omnisearch。

**第二步（1分钟）**：用快捷键打开 Omnisearch（默认 Ctrl+Shift+O 或 Cmd+Shift+O），随便搜几个关键词，感受一下搜索结果和核心搜索的差异。

**第三步（1分钟）**：如果你有 PDF 或图片需要索引，顺手安装 Text Extractor 插件，在 Omnisearch 设置里开启对应选项，重启 Obsidian。

从此，你只管写笔记，搜的时候随便打几个关键词就行。

这不是什么高阶技巧，但恰恰是这种“小事”，决定了你是把时间花在翻文件夹上，还是花在思考和创造上。

让工具做工具该做的事，你只管写。

---

内容效果不满意？[点此反馈](https://feedback.notebooksyncer.com/feedback/cdfbd933_1784112653127?u=https%3A%2F%2Fmp.weixin.qq.com%2Fs%3F__biz%3DMzY5MjI4NjA4Mg%3D%3D%26mid%3D2247484162%26idx%3D1%26sn%3D3762f155f3681a753990ef7b7bb088f5%26chksm%3Df5ac5265eb2e47c7401222a649c2e782e29c03f53c2ed6b109e9767a18c5395c7549ea510d26%26mpshare%3D1%26scene%3D1%26srcid%3D0715nouJIpYacXjgHWMniYzr%26sharer_shareinfo%3D3942c0739c6115c44dd819516679230c%26sharer_shareinfo_first%3D3942c0739c6115c44dd819516679230c%23rd&s=obsidian)