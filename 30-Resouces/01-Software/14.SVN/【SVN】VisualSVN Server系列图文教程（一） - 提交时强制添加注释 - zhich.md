---
title: 【SVN】VisualSVN Server系列图文教程（一） - 提交时强制添加注释 - zhich...
updated: 2026-06-06T10:05:35
created: 2026-07-05T17:04:55
---

【SVN】VisualSVN Server系列图文教程（一） - 提交时强制添加注释 - zhichaosong的博客 - CSDN博客
已剪辑自: <https://blog.csdn.net/zhichaosong/article/details/86578448>
## <span style='color:#2E75B5'>1. 打开项目设置</span>
注意每个项目都是要单独设置的  
项目名称右键 -\> Properties -\> Hooks标签 -\> 编辑Pre-commit hook
![image1](1ca34b85bf14414483bfd12ac7118902.png)

## <span style='color:#2E75B5'>2. 编辑 Pre-commit hook 内容</span>
脚本如下，其中 “…” 中点点的个数表示强制限制提交的字数，本文这里是 10 个字，否则拒绝提交
@echo off  
::  
:: Stops commits that have empty log messages.  
::  

@echo off  

setlocal  

rem Subversion sends through the path to the repository and transaction id  
set REPOS=%1  
set TXN=%2  

rem check for an empty log message  
svnlook log %REPOS% -t %TXN% \| findstr ".........." \> nul  
if %errorlevel% gtr 0 (goto err) else exit 0  

:err  
echo. 1\>&2  
echo 抱歉,由于您没有正确填写Log或者Log字数过少,系统拒绝提交！ 1\>&2  
echo Log格式: 新增/修改/删除: 提交内容 1\>&2  
echo 请详细描述提交内容,然后再提交. -- 谢谢！ 1\>&2  
exit 1
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
- 17
- 18
- 19
- 20
- 21
- 22
- 23

## <span style='color:#2E75B5'>3. 测试效果</span>
保存后立即生效，如果提交少于 10 个字就会提示错误，提示语可以再 echo 后面改

## <span style='color:#2E75B5'>4. 后续修改</span>
有个很重要的问题，如果提交完发现注释写的不完整需要修改怎么办，且听下回分解：[【SVN】VisualSVN Server系列图文教程（二） - 提交后修改注释](https://blog.csdn.net/zhichaosong/article/details/86578473) <https://blog.csdn.net/zhichaosong/article/details/86578473>
2019年7月27日
6:49
