---
title: 快速修改TC脚本登录多个帐号
updated: 2026-06-06T10:08
created: 2019-10-26T00:27:11
tags:
  - TC
---

快速修改TC脚本登录多个帐号
2019年10月26日
0:27

## <span style='color:#2E75B5'>快速修改TC脚本登录多个帐号 </span>
![image1](4433e0904885427383e1d339255bf785.jpg)
<span style='color:white'>**作者：吴明敏 审校：夏春飞**</span>
**适用版本：TC11**
<span style='color:#59C3F9'>“</span>
在Teamcenter二层客户端配置使用的过程中，管理员经常会有登录多个TC帐号以便快速进行操作测试的需求
<span style='color:#59C3F9'>”</span>
但是TC二层客户端默认情况下只能登录一个帐号，管理员进行测试时非常不方便。一般我们通过配置环境管理器去实现这个功能需求，如下图1，此处不对此方法做过多累述。
![image2](7c33a35bd03b419b8700a6c68f897bac.png)
**图1**
<span style='color:black'>这里给大家介绍一种方法，通过修改TC脚本快速实现登录多个帐号需求。</span>
![image3](11f0d5df8c264fe39402a5558a18c58d.png)
找到“TC_ROOT”目录下“iiopservers”文件夹中的start_imr.bat文件和tcserver.xml文件，如图2
![image4](a4e0ec9237f5498fa07d1523d3a9b218.jpg)
**图2**
![image3](11f0d5df8c264fe39402a5558a18c58d.png)
编辑start_imr.bat文件，找到并编辑语句：  
set TCSERVER_ACTIVATION_MODE= PER_CLIENT，如图3
![image5](af7047731120447da43bad43e751bba3.jpg)
**图3**
![image3](11f0d5df8c264fe39402a5558a18c58d.png)
编辑tcserver.xml文件，找到并编辑语句：  
activation_mode="PER_CLIENT"，如图4
![image6](5e58dafed2694f838ac915427f851d4a.jpg)
**图4**
这两条语句设置了TC服务器的激活模式，默认为“NORMAL”，只为第一个胖客户端启动服务器实例，我们将其修改为“PER_CLIENT”，为每个胖客户端启动一个新的服务器实例。
进行多帐号登录，发现登录成功，图5。
![image7](e9784631a32d46c2a7effd73bcc2ddf0.jpg)
**图5**
通过这种方式，就可以快速实现客户端多账号登录的需求，无需配置环境管理器。
![image8](e367c1de883e44a4b8c86a47bab041bb.jpg)
![image9](96b40ce7750141f7a2cb758e212cabc6.jpg)
阅读
在看
已同步到看一看[写下你的想法](javascript:;)
前往“发现”-“看一看”浏览“朋友在看”
![image10](5f067c2e0ffb497497b51b61640cec55.png)
前往看一看
**看一看入口已关闭**
在“设置”-“通用”-“发现页管理”打开“看一看”入口
[我知道了](javascript:;)
已发送
取消
#### *<span style='color:#5B9BD5'>发布到看一看 </span>*
发送
最多200字，当前共字
发送中

微信扫一扫  
关注该公众号

微信扫一扫  
使用小程序
[取消](javascript:void(0);) [允许](javascript:void(0);)
[取消](javascript:void(0);) [允许](javascript:void(0);)
[知道了](javascript:;)
[确定](javascript:void(0);)
[\<From: http://mp.weixin.qq.com/s?\_\_biz=MzAwMTAxMTY1NQ==&mid=2655038295&idx=4&sn=40013148dd5f4ae36a9edbc41936b375&chksm=815431ffb623b8e97cbe211ba8b0e84c3d7b47d06dccb036f2bc6ff40d7d4992fc22c5c26b21&mpshare=1&scene=1&srcid=1026G6vocu8rNkoMiedqeLBS&sharer_sharetime=1572020828051&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd\>](http://mp.weixin.qq.com/s?__biz=MzAwMTAxMTY1NQ==&mid=2655038295&idx=4&sn=40013148dd5f4ae36a9edbc41936b375&chksm=815431ffb623b8e97cbe211ba8b0e84c3d7b47d06dccb036f2bc6ff40d7d4992fc22c5c26b21&mpshare=1&scene=1&srcid=1026G6vocu8rNkoMiedqeLBS&sharer_sharetime=1572020828051&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd)
