---
title: 调优JVM参数以优化TC客户端性能
updated: 2026-06-13T22:08:30
created: 2026-07-05T17:04:53
tags:
  - TC
---

## <span style='color:#2E75B5'>调优JVM参数以优化TC客户端性能 </span>
![image1](23ff47902255493c9e1309fe9dae6bae.gif)
«span style='font-weight:bold;background: \#59C3F9'»作者：恽君达 审校：倪洁«/span»
**适用版本：TC10.1.7**
![image2](01b2837cd0314a319c7344e7498f36a2.png)
<span style='color:black'>参考西门子官方《优化Teamcenter客户端性能手册》,在OOTB的设置中可以通过调优JVM参数来优化TC客户端性能。</span>

TC8.3-9.x的版本可以通过编辑在\<tc_root\> \\ portal中找到的teamcenter.ini文件来优化,从TC10.1开始，不再使用teamcenter.ini文件,添加到teamcenter.ini文件的任何更改或参数都将被忽略,取而代之是在portal.bat文件中指定所有JVM参数。
用户登录到TC，点击菜单栏à帮助à关于，可以简明地看到JVM的可用内存和空闲内存大小，如图1。
![image3](258431c3c808457d8b312a9d6852f278.jpg)
**图1**
找到\<tc_root\> \\ portal中的portal.bat文件，系统默认的JVM参数如图2。
![image4](a9d50bad98f648dbac5afd857d03d6c8.png)
**图2**
参考《优化Teamcenter客户端性能手册》中给出的推荐配置：
set VM_XMX=1024m 下面添加一行 set VM_XMS=1024m
-Xmx指定java程序的最大堆内存, -Xms 指定最小堆内存, 通常设置成跟最大堆内存一样，减少GC。
-vmargs -Xmx%VM_XMX%替换为-vmargs -Xmx1024m -Xms1024m -Xverify:none-XX:SurvivorRatio=6-XX:+UseParallelGCXX:+DisableExplicitGC，如图3。
![image5](cb822e6427b346beac305dfea7bdce40.png)
**图3**
设置完成后再次登陆TC，在关于Teamcenter界面可以看到JVM可用内存增加，如图4。
![image6](5805f9e34b05441c91024fd4963ab462.jpg)
**图4**
通过OTW安装的四层客户端同样可以通过修改\<Teamcenter\OTW10\>\rac中的otwportal.bat文件来实现。
以上对JVM参数的调优可以实现对TC客户端性能的优化，JVM内存的增加可以防止内存溢出的发生。
![image7](3c1aa5a331ec457dabdf3a2623fd6ceb.jpg)
![image8](bb9040cb4b4346a0b3b4b04e515460cc.jpg)
阅读
在看
已同步到看一看[写下你的想法](javascript:;)
前往“发现”-“看一看”浏览“朋友在看”
![image9](d393b0fe43194447bb91e0021cf29a83.png)
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
[\<From: http://mp.weixin.qq.com/s?\_\_biz=MzAwMTAxMTY1NQ==&mid=2655038816&idx=4&sn=a5848c00c85490848fff4f8cb6eccf16&chksm=815437c8b623bede8a0e8e5e85aae079c9306afab7b7150f4077b4c36abdd2b8aeae786f5ffc&mpshare=1&scene=1&srcid=1126VphbQBFqUBaOzxSU6fzC&sharer_sharetime=1574781930455&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd\>](http://mp.weixin.qq.com/s?__biz=MzAwMTAxMTY1NQ==&mid=2655038816&idx=4&sn=a5848c00c85490848fff4f8cb6eccf16&chksm=815437c8b623bede8a0e8e5e85aae079c9306afab7b7150f4077b4c36abdd2b8aeae786f5ffc&mpshare=1&scene=1&srcid=1126VphbQBFqUBaOzxSU6fzC&sharer_sharetime=1574781930455&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd)
