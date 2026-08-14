---
title: 登录AWC空白，F12提示以下错误
updated: 2026-06-13T22:12:00
created: 2026-07-05T17:04:39
tags:
  - TC安装部署
---

可以将C:\Siemens\Teamcenter11\aws2\stage\out\site拷过来
file_repository文件夹中无site文件夹
runtime~main.js:1 GET <https://192.168.0.186:3000/assets1624240435897/bundles/bundle.lib.jqueryui-1.12~a701176e.js> net::ERR_ABORTED 404 (Not Found)
u.e @ runtime~main.js:1
(anonymous) @ bundle.main~d0ae3f07.js:1
u @ runtime~main.js:1
(anonymous) @ bundle.main~d0ae3f07.js:1
u @ runtime~main.js:1
c @ runtime~main.js:1
n @ runtime~main.js:1
(anonymous) @ runtime~main.js:1
(anonymous) @ runtime~main.js:1
runtime~main.js:1 GET <https://192.168.0.186:3000/assets1624240435897/bundles/bundle.5.js> net::ERR_ABORTED 404 (Not Found)
u.e @ runtime~main.js:1
(anonymous) @ bundle.main~d0ae3f07.js:1
u @ runtime~main.js:1
(anonymous) @ bundle.main~d0ae3f07.js:1
u @ runtime~main.js:1
c @ runtime~main.js:1
n @ runtime~main.js:1
(anonymous) @ runtime~main.js:1
(anonymous) @ runtime~main.js:1
runtime~main.js:1 GET <https://192.168.0.186:3000/assets1624240435897/bundles/bundle.58.js> net::ERR_ABORTED 404 (Not Found)

原因：其他服务器也装了文件存储服务导致，卸载所有服务器上的文件存储服务，卸载AWC客户端，重新在一台服务器上安装文件存储服务，重新安装AWC客户端即可。
确保C:\Siemens\Teamcenter11\file_repository下包含下面两个文件夹，如果不一致，可以从C:\Siemens\Teamcenter11\aws2\stage\out\拷贝后重命名
![image1](f80e2469b9534a88ad246c9ca4a7721e.png)
