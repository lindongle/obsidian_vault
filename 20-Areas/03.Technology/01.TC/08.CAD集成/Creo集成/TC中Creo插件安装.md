---
title: TC中Creo插件安装
updated: 2026-06-06T10:05
created: 2018-03-11T13:05:10
---

1、必须先安装Creo端的集成功能。
2、运行TEM，选择配置管理器--维护现有配置--选择配置对应配置（默认即可）--添加移除功能部件--浏览，找到ipem的BMIDE模板路径下的功能配置文件。
![image1](49db75383de74693895a5c27faba178a.png)

![image2](b9e856be5e5842bc94f3007357926ffc.png)
3、选择后，在下面的功能列表中勾选Creo集成。
![image3](9bfe7a3cdcb140839ac63de20c7b6dab.png)
4、点击下一步，会提示关闭Teamcenter服务，关闭服务后，点击确定。
5、输入infodba密码，点击下一步。继续点击下一步、开始，直至安装完成。

<span style='color:#DF402A'>注：如果是两层客户端，还需要配置IIOP配置，以实现可以同一电脑登录两个TC账号。</span>
<span style='color:#DF402A'>配置如下：如果配置时提示端口号1572被使用，退出Teamcenter客户端、检查oracle相关服务是否关闭，关闭后即可。</span>
1、管理员身份运行TEM。
2、配置管理器--维护现有配置--选择配置对应配置（默认即可）--修改两层服务设置。点击下一步。
![image4](a03d7be6596546fa8f8d7b501913ca61.png)
点击高级按钮，在弹出的界面，将服务器激活模式从Nomal改为PER_CLIENT。
![image5](cb1ff678a2e643d3bde2a2cc7647ef7e.png)

![image6](efa3b25fa136417d9e0227b67674ef27.png)
点击确定，下一步，开始，直至完成安装。
