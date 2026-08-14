---
title: 多pool池配置
updated: 2026-08-14T10:56:24
created: 2026-07-05T17:04:39
tags:
  - TC安装部署
---

修改poolmananger下面的C:\Siemens\Teamcenter11\pool_manager\confs\POOLA2\TreeCacheTCP.xml
![image1](f0bc51ebaed344a6b6aa0c234813265f.png)

[TreeCacheTCP.xml](49969d8aba0744f2a0007bbbef84e297.xml)

![image2](95d68df2b4ad4ce1a2f96d066d6b07bb.png)
修改webtier参数需要重新安装解决方案，并删除已部署的tc.war，重新安装及部署启动。

以下，多个Pool多个web，将所有web均加到了前面\[17810\]

![image3](c8e86b4f720a4213b20ffcecf9127bd6.png)

