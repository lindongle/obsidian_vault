---
title: SWIM13.0.3更新
updated: 2026-06-06T10:08
created: 2022-12-01T09:25:57
---

SWIM13.0.3更新
2022年12月1日
9:25
从版本 13.0.3 开始，如果在 Teamcenter 中配置了 Geography，则会出现 Geography 选择对话框。用户必须选择他们的当前工作地点，查看保密协议，然后选择继续以确认同意并完成登录。选择注销将停止登录。
![image1](115a624df0514c7da14ed7ef50c2b52c.png)
从版本 13.0.3 开始，如果在 Teamcenter 中配置了 GDPR 用户同意，则会出现用户同意对话框。用户必须 Agree 同意并完成登录，或 Sign Out 停止登录。
![image2](586b45f4839247ada27ebe650c518966.png)
**Checkin.require.unique.dataset 默认值已更改**
从版本 13.0.3 开始，OOTB 首选项 checkin.require.unique.dataset 默认值为 true。 true 的值防止用户在不同的项目下保存重复的数据集（相同的名称和类型）

“获取图纸” "仅提取"选项
A fetch 列已添加到获取图纸对话框中。打开图纸的决定可以在“获取图纸”对话框中做出。一次在 SOLIDWORKS® 中打开太多工程图会导致 SOLIDWORKS® 崩溃。
![image3](011124b0fb30464a95576dcdf78b7e60.png)
**装配体 JT 翻译 JT**
翻译任务可以从 Teamcenter 富客户端使用翻译菜单按需提交。对于程序集级别的 JT 按需翻译，下拉列表中提供了三个选项：
有关这三个选项的详细说明，请参阅 Dispatcher 安装指南。
从版本 13.0.3 开始，在保存到 Teamcenter 期间提交的装配体 JT 翻译任务将使用“仅此装配体”选项，因此翻译仅限于正在保存的每个装配体的顶层。这样做是为了优化 Dispatcher 翻译性能，同时仍然捕获装配级几何图形，例如装配特征和虚拟零件。
**附加到 SOLIDWORKS® 功能树的 Teamcenter 菜单中添加了几个命令：**
• 获取工程图 • 检出 • 取消检出 • 检出历史记录 • 更新属性• 更新模型 • 插入模型 • 替换模型
![image4](5a6271a38a074f1da076286f284a573d.png)
**使用更新模型识别现有的 Teamcenter 模型**
<span style='color:black'>在某些情况下，例如 ECAD/MCAD 数据交换和供应商协作，当前工作区可能包含不是从 Teamcenter 打开或保存到 Teamcenter 的模型。这通常是将文件从外部位置复制到工作区而没有 swim.txr 索引文件的结果。</span>
<span style='color:black'>部分或所有文件可能已作为 Teamcenter 管理的模型存在，但集成在执行保存之前不知道这一点。保存操作在 Teamcenter 中搜索其名称和类型和/或映射的关键属性值与现有 Teamcenter 管理模型相匹配的模型。如果找到匹配项，则本地模型可以保存为现有托管数据的新版本或修订版。</span>
<span style='color:black'>现在，此功能已扩展到更新模型操作，在会话中程序集上执行时。在以下示例中，所有文件都已复制到当前工作区，并且用户想要将现有的 Teamcenter 管理模型合并到他的会话中装配体中。 “更新模型”对话框指示在 Teamcenter 中找到了哪些模型，并自动选择它们进行更新，从而轻松地使本地装配体保持最新状态。</span>

**

