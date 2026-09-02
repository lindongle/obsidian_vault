---
title: 设置tcserver不共享 sharesession=false
updated: 2026-09-02T16:30:04
created: 2026-07-05T17:04:39
tags:
  - TC安装部署
---

关于停止共享tcserver进程的设置的方法如下：
在TCDOS窗口执行
Clearlocks -drop_all_sst_locks -u=infodba -p=«span style='font-family:微软雅黑;color:#1F497D'»Qwe@123«/span» -g=dba
如果还不行的话，尝试
找到plugins\configuration\_\*下面的site_specific.properties文件。
用文本编辑器编译一下，设置
# sharesession=true
改为
sharesession=false
保存
修改完properties文件后需要运行%TPR%\registry\genregxml.bat

删除%TEMP%\V1000\*
删除%userprofile%\Teamcenter

OTW客户端需要将D:\Siemens\Teamcenter\OTW11\rac\templates\site_specific.properties做同样修改及更新
