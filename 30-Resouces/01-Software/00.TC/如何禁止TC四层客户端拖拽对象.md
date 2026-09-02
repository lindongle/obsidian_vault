---
title: 如何禁止TC四层客户端拖拽对象
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:04:52
tags:
  - TC
---

## 如何禁止TC四层客户端拖拽对象 
收录于话题
![image1](be07353d20ae49a2a9fe212c3387f177.gif)
作者：陆云龙 审校：唐栋
**适用版本：Teamcenter11.5.0**

用户在使用四层客户端工作时，经常会因为误点击workspace中的对象进行拖拽，导致用户在不知情的情况下，将某个对象拖拽到了其他对象下，导致后续使用开发寻找对象时报错，甚至有些客户因为没明白teamcenter中的删除含义，直接将拖拽后的对象进行了删除，导致原本数据也被删除了，大大影响了用户的工作效率与操作体验。所以建议将teamcenter的四层客户端中的拖拽功能禁用，如图1。

![image2](e98eb462e44c44e88c1bdb6ce2a429c8.png)
**图1**
首先找到portal.properties这个文件，这个文件在D:\Siemens\Teamcenter\OTW11\rac\plugins\configuration_11000.2.0路径的文件夹下，如图2。
![image3](1acc31f01ba64f6b88e4886733d98b54.png)
**图2**
打开该文件，找到“enableDragAndDrop=true”语句。这条语句是用来决定在Teamcenter中是否允许使用拖拽的功能，默认值为true，表示允许使用拖拽功能，如图3。
![image4](2e147ab9ca544b91a21b98011c1ba431.png)
**图3**
我们将true改为false，并使用D:\Siemens\Teamcenter\OTW11\rac\registry路径下的genregxml.bat文件进行注册我们所做的修改操作，如图4。
![image5](27c6c84d2311482bb46ab862b94023be.png)
**图4**
最后我们登陆四层teamcenter客户端，查看修改配置后的结果，可以发现我们选中workspace下的对象，已经没办法进行拖拽移动，但是复制功能还是存在，所以在不影响用户使用复制功能的情况下，成功禁止了拖拽复制的功能，解决客户的困扰。
**关注我们**  

![image6](49fa8f7f76614fe096e2d63b13cdeafa.png)
![image7](1be8525698d84b7092c25d2b91b0db6f.jpg)
预览时标签不可点
收录于话题 \#
个
上一篇 下一篇
阅读
分享 收藏
赞 在看
已同步到看一看[写下你的想法](javascript:;)
前往“发现”-“看一看”浏览“朋友在看”
![image8](b08e131ee9a34f7a8b55e2e9242f6cdb.png)
前往看一看
**看一看入口已关闭**
在“设置”-“通用”-“发现页管理”打开“看一看”入口
[我知道了](javascript:;)
已发送
取消
#### *发送到看一看 *
发送
如何禁止TC四层客户端拖拽对象
最多200字，当前共字
发送中
喜欢此内容的人还喜欢

微信扫一扫  
关注该公众号

微信扫一扫  
使用小程序
[取消](javascript:void(0);) [允许](javascript:void(0);)
[取消](javascript:void(0);) [允许](javascript:void(0);)
**微信版本过低**
当前微信版本不支持该功能，请升级至最新版本。
[我知道了](javascript:void(0);) [前往更新](javascript:void(0);)
确定删除回复吗？
[取消](javascript:;) [删除](javascript:;)
[知道了](javascript:;)
**长按识别前往小程序**

[\<From: https://mp.weixin.qq.com/s/7w6n_yz3WNJ2Oa083hu2Bw\>](https://mp.weixin.qq.com/s/7w6n_yz3WNJ2Oa083hu2Bw)
