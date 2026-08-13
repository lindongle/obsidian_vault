---
title: AWC  OAuth2.0单点登录实现2025-08-04T154356.386Z
updated: 2026-07-31T10:03:14+08:00
created: 2025-08-04T15:44:18
tags:
  - TC
---

AWC OAuth2.0单点登录实现2025-08-04T15:43:56.386Z

源网页：https://mp.weixin.qq.com/s?\_\_biz=MzkwOTY4NDQ3NA==&mid=2247483769&idx=1&sn=9fc5ef81d8597a7e6397d66ee6bbe2bc&chksm=c0a3368ff6ebd9d3439f4bde1f69e1e5aaf3fbedc1ade3d2f80cdfa0baa3e86a6370fe23e80f&mpshare=1&scene=1&srcid=0804dHy5Dmbif8oAalxunucG&sharer_shareinfo=b367eba091ee023321e85dd45af21f45&sharer_shareinfo_first=b367eba091ee023321e85dd45af21f45#rd
**网页内容：**
公众号名称：PLM開発従業員
作者名称：YAOSH
发布时间：2024-11-25 12:06
传统TC项目，“假的单点登录”做过很多，常用2种手法。
1.公共账号自动登录
2.记住密码自动登录
上述的做法是不符合OAuth 认证要求的，仅完成了免密码登录。
下图为OAuth2.0认证交互过程图：

![image1](9c1f08bb7a2648e1a98a25dbbdf6beaa.png)

![image2](fda979b1ecca49d29fadd284c9e6d2ff.png)
1.用户访问应用系统地址浏览器重定向请求到SSO的认证地址，并且提供相应的参.
2.OAuth完成用户认证，并为app提供token code。
3.浏览器跳转到app并提供code参数。
4.在获取code后，应用通过oauth2.0/accessToken用code换取访问token。
5.用户在获取访问token后，通过调用接口获取认证用户信息。
6.应用获取用户信息，认证完成，用户正常访问app。

二开AWC需要做到
1.自定义服务，给统一认证平台回调

![image3](53e1d138c1f44da9a6dda6ae214e3752.png)

2.修改AWC源码，禁止首页直接登录，首页需跳转自定义服务再重定向到统一认证平台做认证
**网页截图：**
[Webpage.html](bcb089203f9242f58da0e53883df9c92.html)
