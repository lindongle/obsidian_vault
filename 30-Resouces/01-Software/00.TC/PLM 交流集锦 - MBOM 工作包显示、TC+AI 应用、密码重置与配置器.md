---
author: PLM Club玩家
source: 微信公众号
url: https://mp.weixin.qq.com/s?__biz=MzkwNTI5MDY0OQ==&mid=2247487387&idx=1&sn=78dd448888b1238667c9a1f5d39630e7&chksm=c1e0642408e99da43e81287e5155ae1d4ecf352b588b91ebdcc1c8315efeef0250dbfbef28e7&mpshare=1&scene=1&srcid=0714Q7wkxya2Yit7OwvTIhq1&sharer_shareinfo=3694c9510fc4b9bcc7b38b45068523b8&sharer_shareinfo_first=3694c9510fc4b9bcc7b38b45068523b8#rd
Created: 2026-07-14 08:36:02
tags:
  - 系统配置
  - EasyPLan
id: 2d23b367-d500-44bb-88ac-d7cdc2ec307b
title: PLM 交流集锦 | MBOM 工作包显示、TC+AI 应用、密码重置与配置器
created: 2026-07-14T13:28:51+08:00
updated: 2026-07-14T14:44:05+08:00
---

公众号名称：PLM之友

作者名称：PLM Club玩家

发布时间：2026-07-12 09:29

# PLM 交流集锦 | MBOM 工作包显示、TC+AI 应用、密码重置与配置器

在 PLM 实施与运维中，不少细节问题往往困扰着一线工程师。本期集锦整理了近期社区交流中的 4 个高频话题，涉及 Teamcenter MBOM 工作包关联显示、TC 与 AI 的结合方向、管理控制台密码找回，以及默认配置器的使用场景。

以下内容来源于 PLM 社区群组交流，经整理编辑后发布，供同行参考。

## 话题一：MBOM 对象汇总页如何显示关联的工作包

Q：在 MBOM 对象汇总页显示关联的工作包，有老师试过吗？

A（@陈辉）：可以实现。通过修改渲染配置，在 MBOM 对象汇总页中增加对关联工作包的显示。以下是具体的配置方法和效果展示。

在 Teamcenter 中，MBOM 对象汇总页默认只展示物料清单的基本信息，如果需要在该页面同时看到关联的工作包（Working Package），需要通过修改渲染配置来实现。

![[99-Assets/da7dd2724aef7c10117fe12033833854_MD5.png]]

MBOM 对象汇总页中的工作包

修改代码如下：

![[99-Assets/e713935077f6c363afb6da3e238f2c1f_MD5.png]]

objectSetSection 渲染配置代码示例

<objectSetSection titleKey="MEProcess"  
source="GRMS2P(IMAN\_StructureContent,StructureContext)  
.GRMS2P(IMAN\_CCContext,MECollaborationContext)"  
sortby="object\_string"  
defaultdisplay="listDisplay">  
<tableDisplay>

这段 XML 配置中，titleKey 指定了模块标题为工艺相关标识，source 属性定义了数据来源。sortby 参数按对象字符串排序，defaultdisplay 指定默认以列表形式展示。

实际操作时，建议先在开发环境中测试渲染效果，确认无误后再部署到生产环境。

## 话题二：Teamcenter 与 AI 结合可以做哪些事

Q：目前 TC 做 AI 可以做哪些方面的内容？

A（@永全）：目前 Teamcenter 与 AI 的结合已经从基础问答走向了更深入的应用场景，具体可归纳为两大方向：

## 1\. 基础智能问答

这是目前较为成熟的落地场景。通过将 Teamcenter 的知识库、文档库与 AI 模型对接，用户可以直接用自然语言查询系统功能、配置方法、故障排查等，降低了对文档检索的依赖，尤其对新员工的上手帮助较大。

## 2\. BOM 智能处理

在 Teamcenter 2512 版本中，Teamcenter 已经内置了多项 AI 增强能力，包括：

BOM 对比、BOM构建、EBOM 到 MBOM 的转化与同步等功能

如需了解更多 TC+AI 的详细功能和路线图，可以查阅 Siemens 官方发布的技术白皮书。

## 话题三：Teamcenter 管理控制台密码忘记了怎么办

Q：mgmt/console 密码忘记了怎么办？有人知道吗？

A（@兴海）：这是一个常见但容易被忽视的问题。以下是完整的密码重置步骤：

Teamcenter Management Console 的默认账号密码为 admin/admin。首次登录后通常会被要求修改密码。如果不慎忘记，可以通过以下方法重置：

步骤 1：停止管理控制台服务

确保trun.bat 进程已关闭

步骤 2：进入安全配置目录

路径为%TC\_ROOT%\\mgmt\_console\\container\\security\\partitions

步骤 3：重命名安全数据目录

将JETIManagement 文件夹重命名为 JETIManagement.old

步骤 4：重启管理控制台

正常启动trun.bat

步骤 5：使用默认密码登录

输入小写的admin/admin，系统会提示重置密码

以上方法适用于 Windows 平台的 Teamcenter 部署环境，不同版本可能略有差异，操作前建议备份安全配置目录。

## 话题四：默认配置器与顶层附加配置器的使用场景

Q：默认配置器和顶层 BOM 附加配置器分别用于什么场景？两者之间是什么关系？

A（@永全）：这是 Teamcenter 变体配置中的一个核心概念，理解两者的定位和协作机制，对于避免配置混乱非常关键。

默认配置器：车型通用标准配置规则

它定义的是全局性的、通用的配置规则。例如，某车型的标准配置组合、必选项和互斥关系等。所有 BOM 默认都遵循这套规则，相当于一个统一基准线。

顶层 BOM 附加配置器：单份 BOM 临时特殊规则

它允许对某一特定 BOM 设置特殊的配置规则，用于覆盖默认配置器中的通用规则。比如某一批次的订单需要特殊配置组合，就可以通过附加配置器临时覆盖默认规则，而不影响其他 BOM。

如果不设置默认配置器，所有 BOM 都需要手动绑定配置规则，不仅工作量大，还极易出现配置不一致的情况。建议始终维护一套合理的默认配置器作为基准。

## 写在最后

以上 4 个话题，从界面配置到 AI 应用，从运维技巧到架构理解，基本覆盖了 PLM 日常工作中常见的几个维度。如果你在 Teamcenter 的使用过程中也遇到了类似问题，欢迎在评论区交流讨论。

持续关注本公众号，后续会不定期分享 PLM 领域的技术实践与行业动态。

本期内容整理自 PLM 社区群组交流，

特别感谢以下老师的解答与分享：

@陈辉——MBOM 对象汇总页工作包关联显示的配置方法

@永全——TC+AI 应用方向梳理、默认配置器与顶层附加配置器的使用场景

@兴海——Teamcenter 管理控制台密码重置的完整步骤

感谢以上各位老师在社区中的无私分享，正是你们的经验沉淀，让 PLM 从业者们少走了许多弯路。

本文内容由 AI 辅助创作，经人工审核编辑后发布。

---

内容效果不满意？[点此反馈](https://feedback.notebooksyncer.com/feedback/f7cd3fc2_1783989361085?u=https%3A%2F%2Fmp.weixin.qq.com%2Fs%3F__biz%3DMzkwNTI5MDY0OQ%3D%3D%26mid%3D2247487387%26idx%3D1%26sn%3D78dd448888b1238667c9a1f5d39630e7%26chksm%3Dc1e0642408e99da43e81287e5155ae1d4ecf352b588b91ebdcc1c8315efeef0250dbfbef28e7%26mpshare%3D1%26scene%3D1%26srcid%3D0714Q7wkxya2Yit7OwvTIhq1%26sharer_shareinfo%3D3694c9510fc4b9bcc7b38b45068523b8%26sharer_shareinfo_first%3D3694c9510fc4b9bcc7b38b45068523b8%23rd&s=obsidian)