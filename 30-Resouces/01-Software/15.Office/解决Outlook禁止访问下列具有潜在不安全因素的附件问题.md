---
title: 解决Outlook禁止访问下列具有潜在不安全因素的附件问题
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:04:56
---

«span style='font-family:"Microsoft YaHei";background:#F1F5F8'»解决«/span»Outlook2010«span style='font-family:"Microsoft YaHei";background:#F1F5F8'»禁止访问下列具有潜在不安全因素的附件问题«/span»
系统：windows 7 x64
   MS Office 2010 64bit
运行regedit，打开注册表，依次展开HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\Security项，然后右键  新建“字符串值”，名称为“Level1Remove”数值数据为".exe"，完成后关闭。如其它特殊文件格式遇相似报错信息，则将文件后缀添加进“数值数据”项即可。例：.exe .crt（两不同后缀间需有一空格分开）
重新打开outlool 2010即可。

*来自 \< <http://bjibm1188.blog.sohu.com/248102085.html>\>*
