---
title: EPM-check-signoff-comments（流程注释必填）
updated: 2026-06-20T10:47:38+08:00
created: 2018-04-12T16:07:39
---

描述
要求用户在进行签发决定时键入注释。可指定是否要求在批准决定或拒绝决定中加入
注释。如果未指定任何决定，则需要注释才能完成任意一个签发决定。
语法
EPM-check-signoff-comments \[-decision= approve \| reject \]
参数
-decision
指定在对审核任务或认可任务进行签发决定时，需要在哪个签发决定中输入注释。
使用批准，则要求添加注释才能对审核任务选择批准，或者才能对认可任务选择认可。
使用拒绝，则要求加入注释才能拒绝签发审核任务。
如果不使用此参数，则任意决定都需要加入注释才能完成签发。
放置
放置在 perform-signoffs 任务的执行操作上。
限制
放置在 perform-signoffs 任务上。
示例
• 此示例要求用户键入注释才能拒绝签发：
参数值
-decision reject
