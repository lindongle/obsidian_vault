---
title: WIN10激活系统提示运行在非核心的windows版本 - 技术大厅 - 网吧三国 -
updated: 2026-06-06T10:05:33
created: 2026-07-05T17:04:53
---

WIN10激活系统提示运行在非核心的windows版本 - 技术大厅 - 网吧三国 -
Saturday, September 29, 2018
3:51 PM
Clipped from: <http://www.583go.com/thread-24364-1-1.html>
问题现象：  
做了WIN10的系统，激活的时候出现激活失败的报错。更换了小马，KMS等各种激活工具，折腾了很久最后发现是注册表的问题。  

![image1](a4aa36e2dc7c462a85b1a706a6ea76c5.png)
解决办法：  

1、打开“注册表编辑器”；（Windows + R然后输入 Regedit）  

2、修改SkipRearm 的值为1；（在HKEY_LOCAL_MACHINE–》SOFTWARE–》Microsoft–》Windows NT–》CurrentVersion–》SoftwareProtectionPlatform里面，将SkipRearm的值修改为1）重启电脑。  

3、以管理员身份启动cmd，输入SLMGR -REARM，根据提示，再次重启电脑！  

否则，所有激活工具都失效。。。  

  

  

