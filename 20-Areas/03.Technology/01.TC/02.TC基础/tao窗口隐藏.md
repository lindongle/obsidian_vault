---
title: tao窗口隐藏
updated: 2026-06-06T10:05
created: 2018-08-29T14:52:53
---

tao 窗口隐藏
1.  新建记事本，输入如下文件
set ws=WScript.CreateObject("WScript.Shell")
ws.Run "C:\UGS\TEAMCE~1\Tc2007\iiopservers\start_imr.bat",0
路径为TC客户端安装路径。
2.  将记事本文件名改为tao.vbs，将其复制到TC客户端安装路径下。
3.  修改客户端安装目录下portal.bat文档，调用tao.vbs。同时将系统原来启动TC服务的语句去掉。
![image1](387ef74cd9d048c4943de580134e2f75.png)

