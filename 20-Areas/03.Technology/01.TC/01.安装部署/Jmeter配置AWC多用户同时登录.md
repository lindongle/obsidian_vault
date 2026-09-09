---
title: Jmeter配置AWC多用户同时登录
updated: 2026-06-06T10:09
created: 2025-08-08T16:24:37
tags:
  - TC安装部署
---

1.  下载Jemter，开源；
2.  在测试计划下添加线程组
![image1](022608328a684beab234b826c32b80cb.png)
3.  填写同时登录用户数
![image2](89e00d984b1f4d30a8e6062d21363a5c.png)
4.  添加请求默认值，设置默认值后，其他请求可以不用填写相同内容；
![image3](dea5760045fa44d180c8afaa4d0a4adb.png)
5.  填写地址和网关：
![image4](c38a9613f46a4a3ab7dd0a126b148ed9.png)
6.  添加信息头管理器：
![image5](5a79fd9120e9485c98e5846ba5cd408a.png)
7.  信息头管理器上添加参数：参数根据登录时浏览器F12中获取：
![image6](e0d52a242b934f5d908eac04dac87c11.png)

![image7](fea15c0b3b164c9eb3bd8803fce35b55.png)
8.  添加单用户登录测试的请求：添加-http请求
![image8](2a9d79d720c44a1887ccefe5647699ac.png)
9.  http请求填写以下部分：
![image9](8e3cccb414bd4d6a8c53f79692a21f59.png)
10. 上述内容也取自登录时的F12的跟踪：
![image10](d347bbd23c3a4862af5ef1e185d5ee11.png)

![image11](0b8c77159b18403f820c7469693dee0a.png)
11. 添加监听器-结果树测试登录并执行查看响应数据有无问题；
![image12](5aa89c178948436c82149e53514d47a6.png)

![image13](20e5778e5dc14c93a911b2f68f9f5301.png)
12. 上述成功后，配置多用户登录；
13. 整理一个txt，里面为用户名,密码，使用utf-8编码
![image14](6c869d0aa07748bc89405b8bd7046436.png)
14. 添加csv配置
![image15](558f68b285f042da8625055b275cf147.png)
15. 配置scv相关参数：文件名为上述txt文件，编码为utf-8，变量自己命名，用来代替报文中的用户名和密码
![image16](5d173a9f6b964bbcb4ceaf4ae0cd290f.png)
16. 新建另一个http请求，跟第一个一致，吧body中的用户名密码换成上述变量的方式；
![image17](8025fc95201c4e2f9da4b3d12f6f2e62.png)

