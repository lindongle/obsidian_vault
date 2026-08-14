---
title: 中望CAD2024封装集成 提示dwl文件问题
updated: 2026-06-06T10:08:51
created: 2026-07-05T17:04:41
---

![image1](bfedb050418548a0b24c364161b5b175.png)
修改注册表：
ZWCAD.Drawing.2024：计算机\HKEY_LOCAL_MACHINE\SOFTWARE\Classes\ZWCAD.Drawing.2024\shell\open\command
中ZwLauncher.exe改为ZWCAD.exe，但改完后，保存第二次时会被重置回去。
[ITM07-国鸿氢能-运维管理-操作手册-中望CAD安装操作指引_v1.1.pdf](f62456a677a6496abd1b3a2fbb21a12e.pdf)
在CAD安装目录下，找到ZWCAD.ini配置文件，使用记事本打开，并添加以下添加参数，保存。
\[Launcher\]
ExitDelay=-10

