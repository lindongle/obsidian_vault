---
title: 调优JVM参数以优化TC客户端性能
updated: 2026-06-13T22:08:30
created: 2026-07-05T17:04:53
tags:
  - TC
---

## <span style='color:#2E75B5'>调优JVM参数以优化TC客户端性能 </span>
![image1](fd8dd36960d04a34aad79f98b2af64ea.gif)
«span style='font-weight:bold;background: \#59C3F9'»作者：恽君达 审校：倪洁«/span»
**适用版本：TC10.1.7**
![image2](6247212a14684e75bd67285c1d085861.png)
<span style='color:black'>参考西门子官方《优化Teamcenter客户端性能手册》,在OOTB的设置中可以通过调优JVM参数来优化TC客户端性能。</span>

TC8.3-9.x的版本可以通过编辑在\<tc_root\> \\ portal中找到的teamcenter.ini文件来优化,从TC10.1开始，不再使用teamcenter.ini文件,添加到teamcenter.ini文件的任何更改或参数都将被忽略,取而代之是在portal.bat文件中指定所有JVM参数。
用户登录到TC，点击菜单栏à帮助à关于，可以简明地看到JVM的可用内存和空闲内存大小，如图1。
![image3](06c7cbe2d74f43e6b5f3b9c3bc3d2304.jpg)
**图1**
找到\<tc_root\> \\ portal中的portal.bat文件，系统默认的JVM参数如图2。
![image4](22931aaf7254489dbfbdb72861fd5461.png)
**图2**
参考《优化Teamcenter客户端性能手册》中给出的推荐配置：
set VM_XMX=1024m 下面添加一行 set VM_XMS=1024m
-Xmx指定java程序的最大堆内存, -Xms 指定最小堆内存, 通常设置成跟最大堆内存一样，减少GC。
-vmargs -Xmx%VM_XMX%替换为-vmargs -Xmx1024m -Xms1024m -Xverify:none-XX:SurvivorRatio=6-XX:+UseParallelGCXX:+DisableExplicitGC，如图3。
![image5](e33c6bc456614e13a28ebd5f3aea3acb.png)
**图3**
设置完成后再次登陆TC，在关于Teamcenter界面可以看到JVM可用内存增加，如图4。
![image6](8920b92b66324c13b866de5475b4d6e6.jpg)
**图4**
通过OTW安装的四层客户端同样可以通过修改\<Teamcenter\OTW10\>\rac中的otwportal.bat文件来实现。
以上对JVM参数的调优可以实现对TC客户端性能的优化，JVM内存的增加可以防止内存溢出的发生。
![image7](3320efdebe4e4f35a68b0e22d68431fe.jpg)
![image8](08473f9bef3f4f5c9f55d98b1808b1c8.jpg)
阅读
在看
**已同步到看一看**
[取消](javascript:;) [发送](javascript:;)
[我知道了](javascript:;)
#### *<span style='color:#5B9BD5'>朋友会在“发现-看一看”看到你“在看”的内容 </span>*
确定
![image9](b395084facff4b168c191d1d610f267a.png)
已同步到看一看[写下你的想法](javascript:;)
最多200字，当前共字 发送
已发送
#### *<span style='color:#5B9BD5'>朋友将在看一看看到 </span>*
确定
写下你的想法...
取消
#### *<span style='color:#5B9BD5'>发布到看一看 </span>*
确定
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
[\<From: http://mp.weixin.qq.com/s?\_\_biz=MzAwMTAxMTY1NQ==&mid=2655038816&idx=4&sn=a5848c00c85490848fff4f8cb6eccf16&chksm=815437c8b623bede8a0e8e5e85aae079c9306afab7b7150f4077b4c36abdd2b8aeae786f5ffc&mpshare=1&scene=1&srcid=0912UxOKUram7sImAJX5kHs5&sharer_sharetime=1568253924141&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd\>](http://mp.weixin.qq.com/s?__biz=MzAwMTAxMTY1NQ==&mid=2655038816&idx=4&sn=a5848c00c85490848fff4f8cb6eccf16&chksm=815437c8b623bede8a0e8e5e85aae079c9306afab7b7150f4077b4c36abdd2b8aeae786f5ffc&mpshare=1&scene=1&srcid=0912UxOKUram7sImAJX5kHs5&sharer_sharetime=1568253924141&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd)
