---
title: Tomcat启动后中文乱码，怎么解决这个问题 - WaterStream - 博客园
updated: 2026-06-06T10:05
created: 2020-12-21T23:44:34
---

Tomcat启动后中文乱码，怎么解决这个问题 - WaterStream - 博客园
星期一, 十二月 21, 2020
3:44 下午
已剪辑自: <https://www.cnblogs.com/ws0316/p/11849316.html>
![image1](f8925ab53457478383bcffa33d02ddda.png)

今天很疑惑这个问题，于是去网上找了答案，结果是需要修改Tomcat根目录下面的"logging.properties"文件，把所有的encoding=UTF-8的改成encodng=GBK，保存之后，重启Tomcat服务器，就能解决乱码问题，下面贴出我解决步骤的截图:
1.先找到Tomcat根目录
![image2](3af2cd42cda64951b90736908cef5781.png)

2.右击用记事本打开或者Notapad++打开.Ctrl+F点击“替换”。替换之后ctrl+s进行及时保存。

![image3](64181ebaf1564fb2ac289de35549d7ea.png)
3.保存完后，重启一下Tomcat服务器，救能看到中文乱码的问题给解决了。
![image4](14f2168ef1ea445ba2bb4e2595383403.png)

