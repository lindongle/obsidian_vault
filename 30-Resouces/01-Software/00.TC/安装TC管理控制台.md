---
title: 安装TC管理控制台
updated: 2026-06-06T10:08
created: 2019-09-02T20:33:43
tags:
  - TC
---

## <span style='color:#2E75B5'>安装TC管理控制台 </span>

在11.2版本TC中官方加入了新的管理控制器，基于 JMX 的服务器管理器和 Web 层 HTML 适配器被替换为基于 Web 的 Teamcenter 管理控制台。这是一个安全控制台，可管理和监控服务器端组件，如 Java EE 服务器管理器和 Java EE Web 层。可以在四层Java EE 部署中使用控制台。这个新控制台通过支持 SSL 来满足安全要求。管理员可以使用新控制台，从单个页面访问许多 Teamcenter 管理任务。新控制台类似于 Web 应用 程序服务器控制台。它具有选项卡式页面，使管理员可以管理 Teamcenter 的不同方面。

![image1](4cb49fbaeab04d5e97614b8b69f193b1.png)
**图1**
<span style='color:#3F3F3F;text-align:center'>**安 装 步 骤**</span>
![image2](27db257c88fa467096f31f2b28b3416b.png)
双击打开环境管理器（需要在每台Pool服务器上均安装，且安装后均启动该服务）
![image3](0ab6e987de57438397ea2f8e51197916.png)
![image2](27db257c88fa467096f31f2b28b3416b.png)
选择配置管理器
![image4](03cfff2a6ea14262b61f8e806282ab86.jpg)
**图2**
![image2](27db257c88fa467096f31f2b28b3416b.png)
选择维护现有配置
![image5](7a195b20a07f4f9bb25b55387bf28eb6.jpg)
**图3**
![image2](27db257c88fa467096f31f2b28b3416b.png)
旧配置点击下一步
![image6](1860816630024dcbb263595b1a3ea2dd.jpg)
**图4**
![image2](27db257c88fa467096f31f2b28b3416b.png)
添加功能部件
![image7](a630c9d927e642fa98e967542e60435d.jpg)
**图5**
![image2](27db257c88fa467096f31f2b28b3416b.png)
勾选“服务器增强功能”里的Teamcenter Management Console
![image8](8886d1a1dbfa4a80a25daefe808993be.jpg)
**图6**
![image2](27db257c88fa467096f31f2b28b3416b.png)
点击下一步
![image9](3f691c5d0e444d8c810f434ec9ebce3f.jpg)
**图7**
![image2](27db257c88fa467096f31f2b28b3416b.png)
按下图输入配置值
![image10](6a3d1ca107974739b0b81c3591eae7c8.png)

![image11](a8e15074080143518e62561a78c66714.png)
**图8**
![image2](27db257c88fa467096f31f2b28b3416b.png)
输入Http端口8083
![image12](dd12fc50966949498c91f7191171855b.jpg)
**图9**
![image2](27db257c88fa467096f31f2b28b3416b.png)
配置完成，点击开始安装
![image13](2c2d97ce2db6490fbfd0d5b2dd17e0d2.jpg)
**图10**
![image2](27db257c88fa467096f31f2b28b3416b.png)
安装 Teamcenter 管理控制台后，运行以下命令启动 JETI 管理器：
![image14](5674e2b9f1994afe9e6198890497816e.png)
**图11**
![image15](c8add67b80ad43a7af8e13de21391298.png)
**图12**
![image2](27db257c88fa467096f31f2b28b3416b.png)
JETI 管理器后，使用此 URL 运行控制台：  

<http://hostname:8083/mgmt/console>
（初始账号与密码都是admin，需要重新设置）
![image16](0d8021e9109d40f08109746216e2d794.jpg)
**图13**
![image2](27db257c88fa467096f31f2b28b3416b.png)
下图是控制台的功能之一，踢除四层用户会话
![image17](1e6d56d68a3a42c38468846c8e7869cd.png)
**图14**
![image18](b5bcc7ab34d941a1a0bdf4e24255fa31.png)
