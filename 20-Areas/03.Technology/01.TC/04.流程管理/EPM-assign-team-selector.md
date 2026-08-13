---
title: EPM-assign-team-selector
updated: 2026-06-06T00:09
created: 2018-03-11T12:13:42
---

将整个工作流程中的所有 m select-signoff-team 任务指派给工作流程中的指定用户、
人员、发起者（所有者）或资源池。只可定义一个参数；所有参数相互之间都互斥。
-assignee
user: 用户
person: 人员
\$USER：将当前用户添加到签发成员列表
\$PROCESS_OWNER：将工作流程所有者添加到签发成员列表
\$TARGET_OWNER \[type\]：将指定类型的第一个目标的所有者添加到签发成员列表。此 类型 值为可选值。如果未指定，将使用第一个目标。
\$GROUP：当前用户的当前组
\$ROLE：当前用户的当前角色。
\$TARGET_GROUP \[type\]：指定类型的第一个目标对象的所有权组。此 类型 值为可选值。如果未指定，将使用第一个目标。
\$PROCESS_GROUP：工作流程的所有权组
