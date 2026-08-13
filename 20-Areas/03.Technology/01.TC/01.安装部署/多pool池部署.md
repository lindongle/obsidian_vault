---
title: 多pool池部署
updated: 2026-06-06T10:08
created: 2019-08-27T14:05:46
tags:
  - TC安装部署
---

1、修改web层
![image1](3565584fb5624f7a9637576112cdc0d4.png)
172.1.1.136\[17800\],172.1.1.137\[17800\],172.1.1.138\[17800\],172.1.1.139\[17800\]
2、修改每个pool池配置文件：
C:\Siemens\Teamcenter11\pool_manager\confs\POOLB\TreeCacheTCP.xml  

![image2](581f18f2b97a4b1184fa4b0e4a5c2bd6.png)

以下为当前web层的17810+其他pool的17800和17810
![image3](985948f673e54f9eb0ea08a28421bd50.png)

![image4](14667aac779041329b7233b8b0d683c6.png)

