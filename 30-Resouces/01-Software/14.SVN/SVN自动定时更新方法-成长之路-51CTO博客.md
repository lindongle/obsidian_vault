---
title: SVN自动定时更新方法-成长之路-51CTO博客
updated: 2026-06-06T00:24
created: 2019-07-26T21:20:59
---

SVN自动定时更新方法-成长之路-51CTO博客
星期五, 七月 26, 2019
1:20 下午

已剪辑自: <https://blog.51cto.com/leiwei/1888815>
每次人为更新SVN，比较容易遗忘，而且长期不更新会导致更新等待时间过长。
我们可以把这项工作设置成计划任务定时更新。
前提条件：安装了TortoiseSVN软件，并记住了用户名及验证密码。

**脚本代码：**
@echo off
@echo =========================
@echo author leiwei
@echo <email:wl62464@163.com>
@echo update:2016-12-30
@echo =========================
rem SVN安装目录
set svn_home=D:\Program Files\TortoiseSVN\bin
rem SVN工作目录
set svn_work=E:\SVN
rem SVN日志存放目录
set setup_path=D:\\
@echo 正在更新目录 %svn_work%
if exist %svn_work% GOTO :gengxin else GOTO :MK
:MK
@echo 请检查您的工作目录是否正确
echo & pause GOTO :END
@echo 更新完成退出
goto :END
:END
exit
:gengxin
if exist "%setup_path%"\autoUpdate.log (echo update: %date% %time% \>\> "%setup_path%"\autoUpdate.log) else echo create: %date% %time% \>"%setup_path%"\autoUpdate.log
"%svn_home%"\TortoiseProc.exe/command:update /path:"%svn_work%" /notempfile /closeonend:1
exit

**使用方法：**
1、新建txt文件并把脚本代码内容复制到txt文件中，文件另存为AutoSVN.bat文件。

2、 根据需要修改AutoSVN.bat文件里的SVN安装目录、SVN工作目录、SVN日志存放目录路径的属性。

3、 创建计划任务定时执行AutoSVN.bat脚本，进行SVN更新任务。更新次数、时间可以在windows计划任务按需设置。

