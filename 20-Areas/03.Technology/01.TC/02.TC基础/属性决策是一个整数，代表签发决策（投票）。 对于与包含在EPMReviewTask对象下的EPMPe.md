---
title: 属性决策是一个整数，代表签发决策（投票）。 对于与包含在EPMReviewTask对象下的EPMPe...
updated: 2026-06-05T23:36:16
created: 2026-07-05T17:04:41
---

属性决策是一个整数，代表签发决策（投票）。 对于与包含在EPMReviewTask对象下的EPMPerformSignoffTask对象关联的Signoff对象，决策值为0 =无决策，78 =拒绝和89 =批准。 如果EPMPerformSignoffTask对象包含在EPMAcknowledgeTask对象下，则决策值为0 =无决策和89 =确认。 客户可以为每个与EPMTask对象关联的EPMTaskTemplate对象更改这些决策映射。 与EPMTask仲裁组合使用时，所有Signoff对象决策的最终结果是关联的EPMTask对象的总体task_result属性值。 不允许使用NULL值。

