---
title: 特点--treecache换成了数据库
updated: 2026-08-27T15:14:02
created: 2026-07-05T17:09:09
tags:
  - TC安装部署
---

TC12.3提供了single server manager解决方案在单个数据库中存储和管理Teamcenter服务器信息和服务器分配数据。single server manager使用数据库而不是TreeCache实用程序，它替代了Teamcenter早期版本中提供的基于Java EE的服务器管理器和基于.NET的服务器管理器。在安装时，Teamcenter安装工具在数据库中创建一个单独的表空间，该表空间以最小的存储空间存储临时服务器分配数据。
![image1](167d1238cbab4f908a694242f1d7e639.png)

组织模块，不能进行组、角色、用户的创建及卷、许可证等创建或修改

两层不再支持IIOP，需使用TCCS客户端通信系统进行登录，TAO窗口换成了CMD的exe，且关闭TC时会自动关闭。

无四层瘦客户端了
