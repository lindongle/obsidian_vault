---
title: VMWare如何防止虚拟机更新其日期和时间 - VoidCC
updated: 2026-06-06T00:32:31
created: 2026-07-05T17:04:55
---

VMWare如何防止虚拟机更新其日期和时间 - VoidCC
2021年5月19日
5:01

已剪辑自: <http://cn.voidcc.com/question/p-artgitvt-boe.html>
您还需要通知虚拟机禁用时钟同步。 Brian Keller撰写了一篇关于如何使用Microsoft Virtual PC完成此操作的博客文章。但是，我需要在VMWare Fusion上找到它。幸运的是，来自VMWare的以下PDF出现在我的救援中（ <http://www.vmware.com/pdf/vmware_timekeeping.pdf）。该文件是有点痛苦读通过，但基本上所有你需要做的是在TextEdit中打开.vmx文件，并添加以下条目>：
tools.syncTime = "FALSE"  
time.synchronize.continue = FALSE  
time.synchronize.restore = FALSE  
time.synchronize.resume.disk = FALSE  
time.synchronize.shrink = FALSE  
time.synchronize.tools.startup = FALSE
<span style='color:#FA0000'>需先关掉虚拟机修改，不能修改后再重启虚拟机。</span>
其中两个给我造成了问题，首先tool.syncTime已被设置为false（可能是因为我转换的Virtual PC映像已禁用时间同步）。接下来是“time.synchronize.tools.startup = FALSE”。这会阻止VMWare工具在启动时在OS上设置客户操作系统时间，并且从我在线看到的关于处理此问题的所有其他帖子中都没有找到。
