---
title: 如何使用handler检测附件版本对象是否存在数据集
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:04:52
tags:
  - TC
---

## 如何使用handler检测附件版本对象是否存在数据集 

![image1](b5ea00264bd842979debf1fee201aa0a.gif)
**作者：李达 审校：刘宓放**
**测试版本：Teamcenter10**
在实际的应用中，一般配置流程都有必要配置检查数据的handler, 用于检查item版本是否存在数据集，以下配置流程实例。

![image2](6e72d1db24de4db8befee490cd37d455.png)
如图1流程，选中流程任务根任务节点，点击处理程序，选择开始节点，规则处理程序选择TCRS-has-target-drawing。  

![image3](7b89dda6a16a4f9faa57e001a475b051.png)
**图1**

![image2](6e72d1db24de4db8befee490cd37d455.png)
编辑好流程，点击阶段设为可用，再点击是。

![image4](fd337aa8f08d4eccb6b2bb1c259180e8.png)
**图2**

![image2](6e72d1db24de4db8befee490cd37d455.png)
验证，TC中有如图数据，版本下有catia图纸数据的。

![image5](ec2d740eaf4c4463b02b9018333c7203.png)
**图3**

![image2](6e72d1db24de4db8befee490cd37d455.png)
选中该版本数据，同时按下Ctrl+P键创建流程，选中配置的流程模板，点击确定。

![image6](e4cbeb7e9cda4dc493788269e6021baa.png)
**图4**

![image2](6e72d1db24de4db8befee490cd37d455.png)
如图所示，流程目前在进行中。

![image7](f1ee863cf8684e76a63502d9dbd48baf.png)
**图5**

![image2](6e72d1db24de4db8befee490cd37d455.png)
把该版本数据集删除了，重新对该版本提流程。可见流程报错，提示没事指定类型附件。

![image8](bed4a39fc54b4ebe9d5bc98d53dfb2db.png)
**图6**
![image9](8636d59c02f944ed86c9b0a7c9b4e56c.png)
**图7**

![image10](176edf18d73244a4a7f6d9cd98505d77.jpg)
![image11](caf80d6b6da940dc876437e42e28bc3b.jpg)
阅读
在看
已同步到看一看[写下你的想法](javascript:;)
前往“发现”-“看一看”浏览“朋友在看”
![image12](0d2ced73697649d3b093449adcb530f8.png)
前往看一看
**看一看入口已关闭**
在“设置”-“通用”-“发现页管理”打开“看一看”入口
[我知道了](javascript:;)
已发送
取消
#### *发布到看一看 *
发送
最多200字，当前共字
发送中
相关阅读
[更多文章](javascript:;)

微信扫一扫  
关注该公众号

微信扫一扫  
使用小程序
[取消](javascript:void(0);) [允许](javascript:void(0);)
[取消](javascript:void(0);) [允许](javascript:void(0);)
[知道了](javascript:;)
[确定](javascript:void(0);)
[\<From: http://mp.weixin.qq.com/s?\_\_biz=MzAwMTAxMTY1NQ==&mid=2655042401&idx=6&sn=d8ba81a13b51c70dfbeb07512298653f&chksm=815421c9b623a8df696f19c4913d2f552843152a5abab0a8c47460f710969ee5dc2ffe2c8a33&mpshare=1&scene=1&srcid=1206Rcgaas9WTIciIIQkM8Fn&sharer_sharetime=1575641807420&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd\>](http://mp.weixin.qq.com/s?__biz=MzAwMTAxMTY1NQ==&mid=2655042401&idx=6&sn=d8ba81a13b51c70dfbeb07512298653f&chksm=815421c9b623a8df696f19c4913d2f552843152a5abab0a8c47460f710969ee5dc2ffe2c8a33&mpshare=1&scene=1&srcid=1206Rcgaas9WTIciIIQkM8Fn&sharer_sharetime=1575641807420&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd)
