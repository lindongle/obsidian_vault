---
title: Creo使用集成功能时，导致Creo自带的撤销功能为灰色，不起作用
updated: 2026-06-06T00:15
created: 2019-10-12T20:01:28
---

修改ipem.properties
registernew.enable = never
pe.checkout.reminder = false

设置后，会导致新建零件时，不会提示tc中管理模型及登录TC，在保存或另存为时才会登录。
