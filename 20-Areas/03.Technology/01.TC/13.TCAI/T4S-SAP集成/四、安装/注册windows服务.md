---
title: 注册windows服务
updated: 2026-06-05T23:29
created: 2019-05-14T15:52:03
---

cmd运行
sc create T4x_BGS binPath="E:\PLM\Siemens\T4S_BGS_ROOT\bin64\t4xservice.exe 123" start=auto
sc create T4x_GS binPath="E:\PLM\Siemens\T4S\bin64\t4xservice.exe 123" start=auto

注册服务后，经常会导致无法启动SAPUI。直接用restart.exe启动即可。
