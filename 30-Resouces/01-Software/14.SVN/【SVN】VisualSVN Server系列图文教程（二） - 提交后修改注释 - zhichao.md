---
title: 【SVN】VisualSVN Server系列图文教程（二） - 提交后修改注释 - zhichao...
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:04:55
---

【SVN】VisualSVN Server系列图文教程（二） - 提交后修改注释 - zhichaosong的博客 - CSDN博客
2019年7月27日
6:47
已剪辑自: <https://blog.csdn.net/zhichaosong/article/details/86578473>
## 1. 打开项目设置
注意每个项目都是要单独设置的  
项目名称右键 -\> Properties -\> Hooks 标签 -\> 编辑 Pre-version property change hook
![image1](f5b538f01932465d9867182dcd5507d7.png)

## 2. 编辑 Pre-version property change hook 内容
脚本如下
setlocal  
set REPOS=%1  
set REV=%2  
set USER=%3  
set PROPNAME=%4  
set ACTION=%5  
if not "%ACTION%"=="M" goto refuse  
if not "%PROPNAME%"=="svn:log" goto refuse  
goto OK  
:refuse  
echo Cann't set %PROPNAME%/%ACTION%, only svn:log is allowed 1\>&2  
endlocal  
exit 1  
:OK  
endlocal  
exit 0
- 1
- 2
- 3
- 4
- 5
- 6
- 7
- 8
- 9
- 10
- 11
- 12
- 13
- 14
- 15
- 16

## 3. 测试效果
保存后立即生效，在 SVN log 界面，右键注释区域，点击 Edit log message，在弹出框修改注释即可

