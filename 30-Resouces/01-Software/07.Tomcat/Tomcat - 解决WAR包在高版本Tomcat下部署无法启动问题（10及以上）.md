---
title: Tomcat - 解决WAR包在高版本Tomcat下部署无法启动问题（10及以上）
updated: 2026-06-06T10:05:35
created: 2026-07-05T17:04:55
---

Clipped from: <https://www.hangge.com/blog/cache/detail_3302.html>
2023-07-21 发布：hangge 阅读：561
### <span style='color:#5B9BD5'>1，问题描述 </span>
（1）最近需要使用使用 Tomcat 部署一个 Java EE 系统，在服务器安装了 Tomcat 10.1.9 最新的稳定版本后，我依照以往操作将系统 WAR 包放到 Tomcat 的 webapps 文件夹中。
（2）然后启动 Tomcat，发现系统无法正常运行，使用浏览器访问报 404 错误。
![image1](22cccf681718409ab25c5ed90d3dca8c.jpg)

### <span style='color:#5B9BD5'>2，问题原因</span>
  Apache Tomcat 10.0.5 开始的版本都是针对 Jakarta EE 规范，而 Tomcat 9 和更早的版本实现了作为 Java EE 的一部分开发的规范。因此，为 Tomcat 9 及更早版本开发的应用程序将无法在 Tomcat 10 上运行。

### <span style='color:#5B9BD5'>3，解决办法</span>
（1）一种办法就是使用Tomcat 9 或更早的版本。
（2）如果一定要使用 Tomcat 10 以及之后的版本，我们可以在 Tomcat 目录下创建一个 webapps-javaee 目录，然后将 WAR 包放在 webapps-javaee 目录中，当 Tomcat 启动后会自动将它们转换为 Jakarta EE 并复制到 webapps 目录下，保证项目可以正常运行。
