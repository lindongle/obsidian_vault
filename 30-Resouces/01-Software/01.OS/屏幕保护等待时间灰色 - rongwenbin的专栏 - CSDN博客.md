---
title: 屏幕保护等待时间灰色 - rongwenbin的专栏 - CSDN博客
updated: 2026-06-06T00:22
created: 2018-11-06T18:24:34
---

上午
已剪辑自: <https://blog.csdn.net/rongwenbin/article/details/42676873>
由于未知原因，我的机器不能自动锁屏了。原本，自动锁屏是通过屏幕保护程序配合激活时需要密码来进行的，但是现在屏幕保护的时间没的选了，灰色，固定为 60 分钟。
看到这里： <http://ibm.chick.blog.163.com/blog/static/144201610201331893840580/>
第1步：在注册表编辑器中展开HKEY-CURRENT-USER\Software\Policies\Microsoft\Windows\ControlPanel\Desktop子键。
第2步：在右侧窗口中找到或新建一个名为“ScreenSaveTimeOut”的字符串键值项，将其值设置为“0”，表示超时最少秒数;将其值设置为“900”，表示默认秒数;将其值设置为“599940”，表示最大超时秒数。
第3步：关闭注册表编辑器并重新启动win7系统，设置即可生效。
原文最后的重启，不是必要的。
另外有一种是改组策略的，在我这儿不奏效。
