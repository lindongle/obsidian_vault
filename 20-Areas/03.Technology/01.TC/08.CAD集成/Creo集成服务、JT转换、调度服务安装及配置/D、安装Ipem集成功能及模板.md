---
title: D、安装Ipem集成功能及模板
updated: 2026-06-06T10:05
created: 2018-03-11T13:11:06
---

1、管理员身份运行TEM，选择配置管理器，点击下一步。
![image1](0481980e4dd141df999475817906ea5b.png)
2、选择维护现有配置，点击下一步。
![image2](0ae42184f505407e9f4f27bfb53b1b8a.png)
3、点击下一步。
![image3](fb230cb293124d4f9b89ea98e61d7ced.png)
4、默认，下一步。
![image4](26449915dd61433aa09dee7fe1773cb0.png)
5、点击浏览按钮，选择ipem功能路径D:\apps\ipem\iPEM_BMIDE_Package11\feature_ipem.xml。
![image5](374f2d44b05d4f06bb54849d473248b8.png)
6、在扩展中会新增一项Integration for Creo，勾选点击下一步。
![image6](be3627989c2b4646988f52371d95d712.png)
7、弹出服务停止的提示信息，直接点击OK。
![image7](ace05049300345159fa390f6f8a2ba83.png)
8、输入infodba密码，点击下一步。
![image8](b1192c0709a6458097d44c604e25c332.png)
9、会自动安装ipem模板文件，默认点击下一步。
![image9](7735696f58bf41d7b07d6ce71f8b6242.png)
10、点击开始，进行安装。
![image10](c972e1296ab84322a2107eed94917131.png)
11、安装完成后点击关闭。
![image11](3b0f7eda83c74eec9457b2c09b36a84a.png)

<span style='color:#DF402A'>注：如果是两层客户端，还需要配置IIOP配置，以实现可以同一电脑登录两个TC账号。</span>
<span style='color:#DF402A'>配置如下：如果配置时提示端口号1572被使用，退出Teamcenter客户端、检查oracle相关服务是否关闭，关闭后即可。</span>
1、管理员身份运行TEM。
2、配置管理器--维护现有配置--选择配置对应配置（默认即可）--修改两层服务设置。点击下一步。
![image12](126b5a85a8364a70b6a1fbe1ec086160.png)
点击高级按钮，在弹出的界面，将服务器激活模式从Nomal改为PER_CLIENT。
![image13](2c159b1c937240fc8e9998c4e7438518.png)

![image14](dc9e0a9a6d414ac18ba8e27a2919361b.png)
点击确定，下一步，开始，直至完成安装。
