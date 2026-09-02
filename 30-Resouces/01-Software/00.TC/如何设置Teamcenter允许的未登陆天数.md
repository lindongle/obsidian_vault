---
title: 如何设置Teamcenter允许的未登陆天数
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:04:52
tags:
  - TC
---

如何设置Teamcenter允许的未登陆天数
2019年10月26日
0:13

## 如何设置Teamcenter允许的未登陆天数 
![image1](539919328b114b34b7305fa8f1f634ad.jpg)
«span style='font-weight:bold;background: \#59C3F9'»作者：殷启帆  审校：许孝文«/span»
**适用版本：Teamcenter10**
Teamcenter会记录用户的上次登陆时间和登陆间隔时间，我们可以通过配置首选项“TC_days_non_login_timeout”，设置Teamcenter所允许的最大未登录天数。如果用户超过设定的天数未上线，系统会限制其无法登陆Teamcenter客户端。

打开Teamcenter，“编辑”-“选项...”
![image2](31a427635042425181bac7636402a0e8.jpg)
**图1**

在“选项”对话框点击“过滤器”页，搜索选中首选项“TC_days_non_login_timeout”，点击编辑按钮
![image3](f71efb4572824547bd94279a13064141.jpg)
**图2**
该首选项用于禁用活动用户。值系统默认是0时，则表示无论什么情况，都容许活动用户登录。如图3，我们将其设置为2，表示未登录天数超过两天的用户则无法登入系统，点击保存。
![image4](53cc6c8dd00849ceb0844286f206e0d0.jpg)
**图3**

验证：找到一个不常登陆的用户登陆Teamcenter系统，由于首选项设置了登录间隔超过两天就无法登录，该用户距离上一次登陆的时间间隔天数为6天，超过最大间隔时间，即提示报错信息，无法登陆客户端，如图4。
![image5](de8de46cb651428180063f33944a927f.jpg)
**图4**
对于被已停用的用户，管理员该如何将其解冻继续使用呢？具体操作如下：
使用管理员账户登陆Teamcenter，在组织中查找该用户，并点击“最近的系统访问时间”后的重置按钮。该用户即可重新进登陆。如图5：
![image6](0a2c9c0de83b4c30ad572ae03e58057f.jpeg)
«span style='color:#FF2941;text-align:center'»**图5  **
«/span»
使用该首选项可以限制长时间未登录的用户无法登录系统。
![image7](1945088d29794a29a66625341f56fb30.jpg)
![image8](058b1017869845839dbe4e49a468475b.jpg)
阅读
在看
已同步到看一看[写下你的想法](javascript:;)
前往“发现”-“看一看”浏览“朋友在看”
![image9](931a712f383349adbecb6e509a4d31f4.png)
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

微信扫一扫  
关注该公众号

微信扫一扫  
使用小程序
[取消](javascript:void(0);) [允许](javascript:void(0);)
[取消](javascript:void(0);) [允许](javascript:void(0);)
[知道了](javascript:;)
[确定](javascript:void(0);)
[\<From: http://mp.weixin.qq.com/s?\_\_biz=MzAwMTAxMTY1NQ==&mid=2655036590&idx=4&sn=d00c5e636a3bd94bd5d82b1d7ecf65b8&chksm=81543e06b623b7103ff56e498703bb782be8d3bd1933e3e5900ca1540293df418b17629d1be7&mpshare=1&scene=1&srcid=1026eIgZ7HnOZFiv9vMpGf3Y&sharer_sharetime=1572020030214&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd\>](http://mp.weixin.qq.com/s?__biz=MzAwMTAxMTY1NQ==&mid=2655036590&idx=4&sn=d00c5e636a3bd94bd5d82b1d7ecf65b8&chksm=81543e06b623b7103ff56e498703bb782be8d3bd1933e3e5900ca1540293df418b17629d1be7&mpshare=1&scene=1&srcid=1026eIgZ7HnOZFiv9vMpGf3Y&sharer_sharetime=1572020030214&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd)
