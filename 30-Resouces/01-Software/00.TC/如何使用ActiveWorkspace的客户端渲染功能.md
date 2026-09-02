---
title: 如何使用ActiveWorkspace的客户端渲染功能
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:04:52
tags:
  - TC
---

## 如何使用ActiveWorkspace的客户端渲染功能 
1ActiveWorkspace与传统瘦客户端的区别
在TC12中，已经没有早先的Web Client了，完全被AWC（ActiveWorkspace Client）所替代。在早先的Web Client中，用户需要在客户端计算机上安装java运行环境（JRE），然后安装Teamcenter Visualization用于查看三维。正因为需要安装额外的程序，所以早先的Web Client是不支持手机和平板电脑的。

在AWC中，三维浏览的计算可以完全在服务器端进行，客户端的浏览器只是接受渲染的结果。所以客户端只要有一个兼容的浏览器就可以了。目前最新的Windows 10、苹果手机、安卓手机上自带的浏览器就可以满足要求。因此AWC能够覆盖的硬件远大于Web Client，对客户端的硬件需求也远低于传统的Web Client。

# 2  AWC服务器端硬件需求的飙升
如果所有的渲染计算都在服务器上进行，那么对于服务器的要求肯定比以往更高了。比如有文档中写道，装AWC的服务器至少要有24GB的内存（相比之下，TC服务器只需要8GB的内存）。装有AWC的服务器必须有强大的显卡支持。即便如此，假如同时有100个客户端同时访问AWC服务器，并且要进行三维浏览，服务器也可能力不从心，会导致无法相应的情况。

如果将AWC服务部署在虚拟机上，虚拟机不太可能拥有一块强劲的显卡，那么三维渲染还能进行吗？如何来解决这个问题？

# 3 传统AWC的客户端解决方案
在早先的AWC服务器上，需要启动两个服务，一个是AWC的Vis Server Manager，用于管理各客户端的三维浏览请求，在安装时，已经确定好可以同时接受的请求数量。
![image1](7d995e596e35437199c0f44e7d788809.jpg)
第二个服务是，在服务器上启动一个浏览器，代替客户端对三维进行浏览，然后把浏览结果返回给客户端浏览器。  

这样做的结果是服务器很忙，而客户端很闲。目前的客户端计算机、手机越来越强大，可能也拥有一块强大的显卡，理应把客户端的显卡资源也利用起来。

# 4客户端渲染解决方案
方案很简单，在服务器上只需启动Vis Server Manager，不需要启动浏览器。这样的话，就不需要在服务器端进行三维渲染计算了，大大减轻了AWC服务器的工作量。

在客户端，用户在进行三维浏览时，点击3D浏览中的“显示设置”，然后在“Reader Location”中选择“客户端”，就可以利用客户端的硬件资源进行渲染了。
![image2](dab6fcd071a9490ca533935e6272c0c0.jpg)
通过这种方法，将AWC服务部署在虚拟机上也毫无压力。  

在客户端进行渲染可以比在服务器端渲染获得更好地渲染效果和更快地相应速度。

# 5总结
AWC默认使用服务器端渲染，应该鼓励用户在硬件许可的情况下改用客户端渲染，好处是减轻服务器的压力，提高渲染的质量和相应速度。

关注KigerPLM，更快更好地实施Teamcenter！

Kiger
您的支持，我的动力

人赞赏
上一页 [1](javascript:;)/3 下一页
长按二维码向我转账
您的支持，我的动力

受苹果公司新规定影响，微信 iOS 版的赞赏功能被关闭，可通过二维码转账支持公众号。
阅读
在看
已同步到看一看[写下你的想法](javascript:;)
前往“发现”-“看一看”浏览“朋友在看”
![image3](03290f702a4d436fb6a4abb6a7fbad94.png)
前往看一看
**看一看入口已关闭**
在“设置”-“通用”-“发现页管理”打开“看一看”入口
[我知道了](javascript:;)
已发送
取消
#### *发送到看一看 *
发送
如何使用ActiveWorkspace的客户端渲染功能
最多200字，当前共字
发送中
相关阅读
[更多文章](javascript:;)
[查看更多相关内容](javascript:;)
[更多文章](javascript:;)
[查看更多相关内容](javascript:;)
正在加载
以上推荐为优质及原创文章

微信扫一扫  
关注该公众号

微信扫一扫  
使用小程序
[取消](javascript:void(0);) [允许](javascript:void(0);)
[取消](javascript:void(0);) [允许](javascript:void(0);)
[知道了](javascript:;)
**长按识别前往小程序**

[\<From: http://mp.weixin.qq.com/s?\_\_biz=MzI4MDYyNDY1Mw==&mid=2247485236&idx=1&sn=2ce38b5da573545569275aa9adfd4acf&chksm=ebb4ec56dcc36540a1a63d811deb2c6bfa67444c97442236541c6cda3e9d0a8ace2318797a6b&mpshare=1&scene=1&srcid=&sharer_sharetime=1583134455687&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd\>](http://mp.weixin.qq.com/s?__biz=MzI4MDYyNDY1Mw==&mid=2247485236&idx=1&sn=2ce38b5da573545569275aa9adfd4acf&chksm=ebb4ec56dcc36540a1a63d811deb2c6bfa67444c97442236541c6cda3e9d0a8ace2318797a6b&mpshare=1&scene=1&srcid=&sharer_sharetime=1583134455687&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd)
