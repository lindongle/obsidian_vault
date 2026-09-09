---
title: 'FSC proxy error: "errorCode: -9101 and errorText =...'
updated: 2026-06-06T10:08
created: 2023-07-19T11:48:21
tags:
  - TC安装部署
---

还原的卷部分文件无读取权限；
重启fsc服务后，查看D:\PLM\Siemens\Teamcenter13\fsc\FSC_FDPLMTESTstdout.log文件，可以看到具体无权限的问题，可以通过以下脚本获取下权限；
[取得管理员权限.reg](66ab965c2168470984938c4a881cb6a8.reg)
c

