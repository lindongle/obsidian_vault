---
title: 【Window】英文系统显示中文乱码 - CSDN博客
updated: 2026-06-06T00:22
created: 2018-08-01T17:09:30
---

【Window】英文系统显示中文乱码 - CSDN博客
星期三, 八月 1, 2018
9:09 上午

已剪辑自: <https://blog.csdn.net/dongle_74/article/details/77758195>
   有没有遇到过英文系统下显示中文乱码问题，明明自己的电脑上输入法可以输出中文，为什么有些程序界面显示中文的时候仍旧是乱码呢？那是因为英文系统下选中的系统区域不在中国，导致系统不识别中文，有些程序对于对于乱码问题都有做处理，然而仍旧存在很多老版本软件不支持英文系统显示中文，所以我们需要将电脑的系统区域更换成中国区就OK了。操作步骤如下：
   打开控制面板：control.exe

   选择Clock，Language，and Region

   进入之后，选择Region下面的Change location
   在Location中找到并选择China，经验证，这个不影响不大，主要是后面的步骤。

   换到Administrative，点击Change system location

   找到Chinese（Simplified,China）,并选中

   点击OK命令，系统会提示重启系统

  
   点击Restart now，重新进入系统，程序显示中文就不乱码了。

