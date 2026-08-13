---
title: 修改win10 默认字体
updated: 2026-06-06T00:22
created: 2018-11-27T19:26:14
---

Win 10 、Win 8 系统的默认字体比较模糊，如何改为美观清晰的宋体呢，修改注册表就可以做到，方法如下：
方法/步骤
Win 10 字体改为宋体方法：
新建一个文本文档txt,将如下代码复制进去：
Windows Registry Editor Version 5.00
\[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts\]
"Microsoft YaHei & Microsoft YaHei UI (TrueType)"="simsun.ttc"
\[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontSubstitutes\]
"Microsoft YaHei"="SimSun"
"Microsoft YaHei UI"="SimSun"
保存，将文本文档txt的后缀名txt改为reg,双击或用注册表编辑器打开，确认后重启生效。
Win 10 系统字体还原为默认字体的方法：
新建一个文本文档txt,将如下代码复制进去：
Windows Registry Editor Version 5.00
\[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts\]
"Microsoft YaHei & Microsoft YaHei UI (TrueType)"="msyh.ttc"
\[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontSubstitutes\]
"Microsoft YaHei"=-
"Microsoft YaHei UI"=-
保存，将文本文档txt的后缀名txt改为reg,双击或用注册表编辑器打开，确认后重启生效。
