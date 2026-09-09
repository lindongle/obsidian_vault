---
title: Windows11恢复Windows10右键菜单样式 - 知乎
updated: 2026-06-06T00:19
created: 2022-03-16T17:42:24
---

Windows11恢复Windows10右键菜单样式 - 知乎
星期三, 三月 16, 2022
9:42 上午

已剪辑自: <https://zhuanlan.zhihu.com/p/417591763>
Windows11正式版发布后，很多第一时间安装了这个最新微软操作系统的网友发现，除了开始菜单、设置界面大变样之外，还存在很多体验非常不好的地方，比如桌面右键菜单的折叠显示就是其中之一。本来很多常用的右键功能，反而需要额外多一次点击才能选中。所以很多网友需要将Win11的右键菜单替换成Win10那种直接显示所有命令的方式，以下就是操作方法：
切换到旧版右键菜单：
reg add "HKCU\Software\Classes\CLSID\\86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
恢复回Win11右键菜单：
reg delete "HKCU\Software\Classes\CLSID\\86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
重启Windows资源管理器生效：
taskkill /f /im explorer.exe & start explorer.exe
方式一：右键开始按钮-Windows终端（管理员）-粘贴上面的命令
方式二：Win+R-输入cmd-粘贴上面的命令
方式三：将上面的命令粘贴到记事本，重命名为123.cmd，右键以管理员身份运行
