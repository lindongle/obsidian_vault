---
author: PLM之友
source: 微信公众号
url: https://mp.weixin.qq.com/s?__biz=MzkwNTI5MDY0OQ==&mid=2247488086&idx=1&sn=a0952c51ecea1d2c350cd6da06119d75&chksm=c1864d15cea0140428a3ce589239fac43af42182007d716e27d4a1a2b4457e532dc006fe1475&mpshare=1&scene=1&srcid=112239hpmU6gs0SNkT27idEQ&sharer_shareinfo=2df133aa624b1643a15f57105384c85c&sharer_shareinfo_first=2df133aa624b1643a15f57105384c85c#rd
Created: 2026-11-22 15:33:00
tags:
  - 笔记同步助手
id: c119acde-1d20-4ecf-8f0e-d332b3abcbee
created: 2026-11-23T13:35:08
updated: 2026-11-23T13:35:21
---

公众号名称：PLM之友

作者名称：PLM之友

发布时间：2026-11-22 14:59

PLM 之友　·　TEAMCENTER 实战

# Teamcenter 流程任务的优先级怎么设？  
先分清 fnd0Priority 和 priority

> 群里被问到的一个问题：流程任务的优先级在哪里填、填完怎么排序？答案不在配置手册里，而在 BMIDE 里那两个同名的「优先级」属性上 —— 一个能填，一个只读。这篇讲清两者区别、胖客户端与 AWC 的几条填写路径，以及排序时会踩的坑。

## 01缘起

这周有朋友晚上在群里问：流程任务的优先级怎么设置？我原先也不知道，翻完资料把这件事理清楚了。

结论先给：**能填的是 fnd0Priority，priority 是只读的。**AWC 里做排序、做筛选，用的也都是前者。

## 02两个「优先级」，同名不同物

BMIDE 里搜索 EPMTask，切到「属性」页签用 Priority 过滤，会看到两个属性。差别看类型就够：

| 属性名 | 存储类型 | 说明 |
| --- | --- | --- |
| fnd0Priority | String\[128\] | 可编辑，AWC 排序与筛选使用它 |
| priority | Integer | 只读（Modifiable = Read），系统底层用 |

![[99-Assets/61b04eeaa7221bd477f3761576c47c5b_MD5.png]]

BMIDE 中 EPMTask 业务对象的 fnd0Priority 属性与本地化内容

「源」列显示两者都来自 EPMTask —— 这是出厂自带的 COTS 业务对象，不是谁二次开发加的，所以别去客户自己的扩展模型里找答案。

真正麻烦的是「属性本地化」：两个属性的 zh\_CN 内容都是「优先级」，en\_US 都是「Priority」。**中文界面上它们长得一模一样，光看名字分不出谁是谁**，这才是最容易卡住的地方。

![[99-Assets/2f329af81ea5f6410d9da827b22296f6_MD5.png]]

priority 的 zh\_CN 本地化同样是「优先级」，界面上与前者重名

区分办法有两个：看类型，String\[128\] 是 fnd0Priority、Integer 是 priority；或者看「属性常数」里的 Modifiable —— priority 取值是 **Read**，一个词就说明它不归用户管。

![[99-Assets/8eb4cef481747735491909186c96217c_MD5.png]]

priority 的属性常数：Modifiable 取值为 Read

## 03胖客户端：列表里直接填

胖客户端走 My Worklist → Tasks To Perform：单击 Apply 之后，直接在 Priority 字段里给每个需要排序的任务填值（接受字母数字值），填完点列标题切换升降序。

![[99-Assets/bee94586719d97a2ba77c519d8e693d6_MD5.png]]

胖客户端：Tasks To Perform 列表内直接编辑 Priority，再按列标题排序

注意「接受字母数字值」这句 —— 它和 String\[128\] 是对应的：**这个字段本质是字符串，不是数字**。这一点后面会变成坑。

## 04AWC：信息面板与表格视图两条路

官方文档给的是信息面板路径：

**1.**从 Launcher 进入 Inbox；入口不可用就搜索 Inbox，可从搜索结果固定到导航栏。

**2.**My Tasks 页未显示时，单击 My Tasks。

**3.**单击目标任务，再单击 Overview。

**4.**单击页级工具栏的铅笔图标打开 Information 面板，再单击 Edit。

**5.**填写优先级值后单击 Save；不想保存就直接关闭面板，会提示是否放弃未保存的编辑。

![[99-Assets/1b971aa46c4f2bd2d81c16b017c879d4_MD5.png]]

AWC 官方文档原文：Set the task priority

官方对「填什么值」的表述是「例如日期、影响级别或数值」。结合 String\[128\] 就说得通：**格式不限**，日期、高／中／低这类级别词、纯数字都填得进去。

![[99-Assets/0f819959c15e0e26b4a84cc23a8de647_MD5.png]]

Information 面板 Properties 区域中的 Priority 字段

还有一条更快的路：**任务箱的「我的任务」页签切到表格视图后，「优先级」列可以直接在行内改**，不必再进信息面板。截图里这条任务的优先级填的是「高优先级」，右侧详细信息面板的属性区同步显示同一个值 —— 说明改的就是 fnd0Priority 这一个字段。

![[99-Assets/9c786b24f3517f9a8184f587378e8815_MD5.png]]

任务箱「我的任务」表格视图：优先级列支持行内直接编辑

## 05填完只是第一步：排序与筛选

排序就是点 Priority 列标题切升降序。筛选更省事 —— AWC 的 Inbox 默认就把 fnd0Priority 放进了 Workflow 业务对象的筛选器清单，和 object\_type、due\_date、fnd0Assignee、fnd0WorkflowInitiator 并列。

![[99-Assets/4f2d1784c74a35f97db22d8232951a5a_MD5.png]]

Inbox 中 Workflow 业务对象默认可用的筛选属性

> 这里有个必须提前绕开的坑
> fnd0Priority 是字符串，排序按字典序走。填 1、2、10，升序结果是 **1、10、2**。想符合直觉就用等宽值：数字补零（01、02、10）或单字母（A、B、C）。High／Medium／Low 反而更乱，字典序会排成 High、Low、Medium。

## 06为什么 priority 要设成只读

把现象丢给 AI 解析，得到的判断是：priority（Integer）是 EPMTask 的底层属性，通常由工作流引擎或系统逻辑维护，而不由用户手动修改；fnd0Priority（String\[128\]）则是面向用户的显示属性。

![[99-Assets/57ec5e7436c0a6f2062b8c176fca9e8b_MD5.png]]

关于 priority 为何设为 Read 的解析结论

## 07小结：三句话记住

> **1**能填的是 fnd0Priority（String\[128\]），priority（Integer）只读，别在界面上找它。
> 
> **2**胖客户端在 My Worklist 的 Tasks To Perform 里填；AWC 可以进任务的 Information 面板 Edit，也可以切到任务箱表格视图直接改那一列。
> 
> **3**排序按字符串字典序，值要设计成等宽，否则 1、10、2 这种结果会让你怀疑人生。

问题来自 PLM 之友读者群的一次夜间提问，感谢提问的朋友。

#Teamcenter#PLM#AWC#BMIDE#工作流#EPMTask

  

---

内容效果不满意？[点此反馈](https://feedback.notebooksyncer.com/feedback/e5ee9a3f_1795332778692?u=https%3A%2F%2Fmp.weixin.qq.com%2Fs%3F__biz%3DMzkwNTI5MDY0OQ%3D%3D%26mid%3D2247488086%26idx%3D1%26sn%3Da0952c51ecea1d2c350cd6da06119d75%26chksm%3Dc1864d15cea0140428a3ce589239fac43af42182007d716e27d4a1a2b4457e532dc006fe1475%26mpshare%3D1%26scene%3D1%26srcid%3D112239hpmU6gs0SNkT27idEQ%26sharer_shareinfo%3D2df133aa624b1643a15f57105384c85c%26sharer_shareinfo_first%3D2df133aa624b1643a15f57105384c85c%23rd&s=obsidian)