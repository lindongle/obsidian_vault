---
title: 设置tcserver不共享 sharesession=false
updated: 2026-06-05T23:20
created: 2020-06-01T16:41:39
tags:
  - TC安装部署
---

关于停止共享tcserver进程的设置的方法如下：
<span style='color:black'>在TCDOS窗口执行</span>
<span style='font-family:Calibri;color:black'>Clearlocks -drop_all_sst_locks </span><span style='font-family:Calibri;color:#1F497D'>-u=infodba -p=</span>«span style='font-family:微软雅黑;color:#1F497D'»Qwe@123«/span»<span style='font-family: Calibri;color:#1F497D'> -g=dba</span>
<span style='color:#1F497D'>如果还不行的话，尝试</span>
<span style='color:#1F497D'>找到plugins\configuration\_\*下面的site_specific.properties文件。</span>
<span style='color:#1F497D'>用文本编辑器编译一下，设置</span>
<span style='color:#1F497D'># sharesession=true</span>
<span style='color:#1F497D'>改为</span>
<span style='color:#1F497D'>sharesession=false</span>
<span style='color:#1F497D'>保存</span>
<span style='color:black'>修改完properties文件后需要运行%TPR%\registry\genregxml.bat</span>
<span style='color:black'></span>
<span style='color:black'>删除%TEMP%\V1000\*</span>
<span style='color:black'>删除%userprofile%\Teamcenter</span>
<span style='color:black'></span>
OTW客户端需要将D:\Siemens\Teamcenter\OTW11\rac\templates\site_specific.properties做同样修改及更新
