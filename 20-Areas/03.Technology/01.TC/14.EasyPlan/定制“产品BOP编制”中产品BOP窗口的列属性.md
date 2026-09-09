---
title: 定制“产品BOP编制”中产品BOP窗口的列属性
updated: 2026-06-06T10:09
created: 2025-12-05T10:55:28
---

1.配置首选项EP_BopBreakdownAssemblyTreeColumnConfiguration保护范围设为【站点】
2.中添加需要的行属性，例：BOPLine.bl_sequence_no.200.false.300
false：代表显示在行中
100/200/300为排列顺序（排序后自动刷新）
---前提属性存在于BOMline中

![image1](90fa2093e62b40aaaf26efb387a1b5a2.png)

效果：
![image2](600d89c1b8be420ab00b3e25ee682925.png)
