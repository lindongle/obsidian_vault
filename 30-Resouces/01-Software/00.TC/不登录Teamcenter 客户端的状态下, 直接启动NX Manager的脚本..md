---
title: 不登录Teamcenter 客户端的状态下, 直接启动NX Manager的脚本.
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:08:54
tags:
  - TC
---

不登录Teamcenter 客户端的状态下, 直接启动NX Manager的脚本.
2019年7月10日
0:40
## Teamcentet 技术技巧 
***1. 不登录Teamcenter 客户端的状态下, 直接启动NX Manager的脚本.***
问题/症状:
是否有办法直接登录NX Manager, 而不用启动Teamcenter 的客户端?
解决方法:
可以的, 有时候登录Teamcenter 会比较慢, 不输入密码也可以减少登录启动的时间, 请看下面的启动登录脚本, 用户可以根据自己的需要修改相应的内容:
@ECHO OFF
TITLE NX11 Manager Mode
«span style='background:#A5C8FF'»cd /D d:\\/span»
rem ====设置用户的环境变量=======
set NXPATH=d:\siemens\NX11
set UGII_ENABLE_TC_NAVIGATOR=1
set UGII_BASE_DIR=%NXPATH%
set UGII_ROOT_DIR=%UGII_BASE_DIR%\ugii
set TC_ROOT=C:\Teamcenter10
set FMS_HOME=C:\Teamcenter10\tccs
rem ======这是2 层的启动方式======
set TC_DATA=\\TcServer\tcdata
rem ======下面的是4 层的启动======
rem set UGII_UGMGR_COMMUNICATION=http
rem set UGII_UGMGR_HTTP_URL=http://webserver:8080/tc
rem ----直接登录, 不需要账号密码----
set vm_user=infodba
set vm_pawd=%vm_user%
%ugii_root_dir%\ugraf.exe -pim=yes -u=%vm_user% -p=%vm_pawd% -nx
pause
exit

***2. 如何解决升级过程中preferences_manager error 10004错误?***
问题:
升级到Teamcenter11.5的过程中可能会遇到如下问题：
Requested license could not be retrieved
Login with -pf option failed! Error code = 70105 (POM_inst_not_loaded)
preference_manager syslog显示下面的信息：
ERROR - 2018/07/05-23:12:35.000 UTC - NoId - -10004: error\_-10004 - Error -10004
asking number of AUTHOR licenses purchased: License Error, server not connected. -
Teamcenter.CoreModelGeneral.tc at
d:\workdir\tc115w0616_64\src\core\tc\check_license.cxx(5139)
ERROR - 2018/07/05-23:12:35.000 UTC - NoId - 5: Invalid file name. - No
teamcenter_admin license available - Teamcenter.CoreModelGeneral.tc at
d:\workdir\tc115w0616_64\src\core\tc\check_license.cxx(1613)
解决方法:
从许可证日志中找到了原因：
19:12:30 (ugslmd) Request denied: Client (11.15) newer than Vendor Daemon (11.13).
(Version of vendor daemon is too old. (-83,21049:10054 ""))
更新PLMLicenseServer, 运行：
Tc11.5 kit\additional_applications\SPLMLicenseServer_v9.0.0_win_setup.exe
重新运行TEM继续完成补丁安装。

***3. 自动指派BOMView, BOMView Revision到项目***
问题：
当指派一个零组件至项目时，如何将BOMView和BOMView Revision也自动指派给项目？
方法：
定义传播规则，如下：
自动指派BOMView
![image1](d3542f096cd14341a1caef6b2ffad3eb.jpg)
自动指派BOMView Revision  

![image2](9746a49fa5244519acb6b99e9aaa79fc.jpg)

阅读
分享 在看
**已同步到看一看**
[取消](javascript:;) [发送](javascript:;)
[我知道了](javascript:;)
#### *朋友会在“发现-看一看”看到你“在看”的内容 *
确定
![image3](e4ac7ec2e04f41109309936fea7e2c64.png)
已同步到看一看[写下你的想法](javascript:;)
最多200字，当前共字 发送
已发送
#### *朋友将在看一看看到 *
确定
写下你的想法...
取消
#### *发布到看一看 *
确定
最多200字，当前共字
发送中

微信扫一扫  
关注该公众号

微信扫一扫  
使用小程序
[取消](javascript:void(0);) [允许](javascript:void(0);)
即将打开一个新页面
[取消](javascript:void(0);) [允许](javascript:void(0);)
[\<From: http://mp.weixin.qq.com/s?\_\_biz=MzAwMjUyOTUwMw==&mid=2649882286&idx=1&sn=56c55055c0d5a5fb561ccca106109f87&chksm=82cc5f1eb5bbd608d04f2d2e54812845628f3172ca2042055af325478afe42bcbdb682238d22&mpshare=1&scene=1&srcid=#rd\>](http://mp.weixin.qq.com/s?__biz=MzAwMjUyOTUwMw==&mid=2649882286&idx=1&sn=56c55055c0d5a5fb561ccca106109f87&chksm=82cc5f1eb5bbd608d04f2d2e54812845628f3172ca2042055af325478afe42bcbdb682238d22&mpshare=1&scene=1&srcid=#rd)
