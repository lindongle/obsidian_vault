---
title: 根据PID查询system日志
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:04:52
tags:
  - TC
---

## Teamcenter 技术技巧 
***1. 如何根据PID 查找对应的tcserver syslog？***
问题：
多个ServerManager 运行有大量的warm 进程，此时某个特定进程，难以找到其对应的tcserver syslog。
如何通过进程的PID 找到对应的tcserver syslog 呢？
解决办法：
在任务管理中，找到PID
![image1](440ff3e2bb6847468a2a05bbaa5fa7e2.png)
使用十进制到十六进制转换器，转换十进制数5028 为对应的十六进制数
![image2](684375230c40457f9304fc17335af428.png)
使用该十六进制数，从PM_PROCESS_LIST 表中执行查询，以SQLServer 2014 为例；
select \* from PM_PROCESS_LIST where pm_key like '%13a4%'
![image3](7024fa2b39bd4e1c9fac0dfbbbc47732.png)

***2. FSC Service failed to start due to LookupAccountName: 1332***
问题：
当用TEM 对Teamcenter 进行更新时，弹出下面的错误：
FSC Service failed to start due to LookupAccountName: 1332
install_updater 日志中显示Teamcenter 试图给infodb 账号授权，但是实际的账号是infodba。
软件配置：
Product: TEAMCENTER
Application: INSTALL_CONFIG
Version: V11.2.0
Solution：
可以通过修改TC_ROOT\installa\configuration.xml 来更正用户名称，需要确认installingUser 和OSUser 信息。
样例：
\<installingUser value="user1" /\>
AND
\<OSUser\>
\<password value="PASSWORD" /\>
\<user value="infodb.srv" /\>
\</OSUser\>

阅读
在看
已同步到看一看[写下你的想法](javascript:;)
前往“发现”-“看一看”浏览“朋友在看”
![image4](d9e49ff0ad044b21a2b14518c513819f.png)
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
[\<From: http://mp.weixin.qq.com/s?\_\_biz=MzAwMjUyOTUwMw==&mid=2649882645&idx=1&sn=98c823a77ebec085f104697c5ba44a69&chksm=82cfa1a5b5b828b3a406400f5221899de355fa880d6fd9385347b3e00d15769c381abe59fe68&mpshare=1&scene=1&srcid=&sharer_sharetime=1575641180857&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd\>](http://mp.weixin.qq.com/s?__biz=MzAwMjUyOTUwMw==&mid=2649882645&idx=1&sn=98c823a77ebec085f104697c5ba44a69&chksm=82cfa1a5b5b828b3a406400f5221899de355fa880d6fd9385347b3e00d15769c381abe59fe68&mpshare=1&scene=1&srcid=&sharer_sharetime=1575641180857&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd)
