---
title: 解决：
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:08:54
tags:
  - TC
aliases:
  - 解决：
linter-yaml-title-alias: 解决：
---

[源网页](https://mp.weixin.qq.com/s?__biz=MzUyMzg4Njc4MA==&mid=2247484975&idx=1&sn=9ec05afeb5d4d23b74ce6ecc15a036f8&chksm=fba0b06a31bcf4b5f0baeb530c559c56c7aa93041792312596921cf9e0b7855c06b08e82c1d3&mpshare=1&scene=1&srcid=1225MpnCSmKbdVXzLB21Llx8&sharer_shareinfo=5b9e9212ed86bb6587fd1918b7c830e4&sharer_shareinfo_first=5b9e9212ed86bb6587fd1918b7c830e4#rd)
**网页内容：**
公众号名称：PLM有个号
作者名称：许连波
发布时间：2025-09-15 23:06
**问题：**
项目中需要做TC2412和NX2412集成，在虚拟机搭建的环境里安装NX2412打开后报错“General Fault Exception”。
![image1](c0623e26206a41358668f4bc14df42da.png)
日志如下：
CONT_MGR: Failed to download repository_info.xml Error \[1020001 - File not found\]\*\*\* EXCEPTION: O/S ERROR: signal 11 in line 2977 of o:\nx2412\ip1700\src\syss\error\ind\error.cxx +++ General Fault ExceptionLoaded module c:\windows\system32\vm3dglhelper64.dll 7ffd711f0000 51000 4d58f196-4e1d7287-df1b45ba-95740211-1 version = 9.17.8.9Loaded module c:\windows\system32\vm3dgl64.dll 7ffd71250000 2bee000 6e190719-4f4ff9e1-e8cc5696-3d49e2fa-1 version = 3.6.0.0Loaded module c:\windows\system32\appxdeploymentclient.dll 7ffdb58d0000 11a000 c5e473a6-bf779b9f-b2f45dbc-ebc7daaf-1 version = 10.0.20348.2520
**分析：**
又尝试了安装nx2406、nx2506版本，均打开报同样错误，在另外一台winserver2016的虚拟机中安装nx并打开成功。将winserver2022虚拟机里jdk和.net版本与安装成功的服务器保持一致，并更新了操作系统的补丁。再安装nx2406仍然报一样错误，将VMWare Tools卸载掉后，nx可以正常打开了，但有“图形配置错误”的提示。
![image2](f96ef605f0b340408ea2c9d391a7a87d.png)
确定是显卡驱动导致的问题，再次安装VMWare Tools，但不安装显卡驱动，发现nx仍然可以正常打开。
![image3](8882a16f56394e958c4d5667cdbcd616.png)
# 解决：
因为虚拟机里VMWare Tools带的显卡驱动版本问题导致nx无法打开，将VMWare Tools版本从12.5.0换为12.3.5后问题解决。
**总结：**
在虚拟机环境中，一些对显卡有一定要求的软件遇到问题时候，可以分析下是否显卡驱动问题导致。
![image4](bd0f0e859827422e8992938a0bef195f.jpg)

![image5](e07267608ff44b2da8c98604500f919a.jpg)
原创 许连波 PLM有个号 
继续滑动看下一个 
![image6](efcae38e88f34de2a90a92332794f4d0.png)
PLM有个号 
向上滑动看下一个 
**网页截图：**
[Webpage.html](7d1a983c77604c9fa278772bec273b82.html)
