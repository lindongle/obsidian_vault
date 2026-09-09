---
title: 安装TC基础报错，首选项无法导入
updated: 2026-06-05T23:17
created: 2021-05-12T23:51:34
tags:
  - TC安装部署
---

Command line login fail! Error code = 515209 (POM_rdbms_error)

The following error has been encountered: 515209 - The operation failed due to an unexpected Database Management System error.
The report file is located at "C:\Siemens\Teamcenter11\logs\2105111515\preferences_manager_202151115194.log".
command_exit=1
Exit Status 1, elapsed time 0:00:11
An error occurred during execution. Stack trace follows…

针对已经打了补丁的环境，新安装服务器，需要倒着安装：
1、复制intall文件到补丁介质；
2、从补丁介质运行tem.bat；
3、tem中选择初始版本介质路径；
