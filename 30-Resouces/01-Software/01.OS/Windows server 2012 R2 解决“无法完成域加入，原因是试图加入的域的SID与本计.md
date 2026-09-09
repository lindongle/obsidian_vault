---
title: Windows server 2012 R2 解决“无法完成域加入，原因是试图加入的域的SID与本计...
updated: 2026-06-06T10:05
created: 2018-06-07T05:30:35
---

Windows server 2012 R2 解决“无法完成域加入，原因是试图加入的域的SID与本计算机的SID相同。” - CSDN博客
已剪辑自: <https://blog.csdn.net/duanchuanttao/article/details/53467060>
﻿﻿
## <span style='color:#2E75B5'>Windows server 2012 R2 解决“无法完成域加入，原因是试图加入的域的SID与本计算机的SID相同。”</span>
使用克隆的系统时，加域是出现如下问题。“无法完成域加入，原因是试图加入的域的SID与本计算机的SID相同。”
![image1](0e049073cea84410b90633108d5d9511.png)
- 问题原因；
Windows使用SID来表示所有的安全对象（security principals）。安全对象包括主机，域计算机账户，用户和安全组。名字Name是用来代表SID的一个方法，可以允许用户改名儿无需更新ACL（access control list）。SID是一串数字代码包含了架构版本数字，一个48位的ID权威值，一个32位的子全位置或者RID值。权威值识别颁发出SID的代理，这个代理一般是windows 本地系统或者域。子权威值识别颁发权威的委派，RID则是Windows用来创建唯一SID用到的一个普通SID。
相同SID在单机使用过程中可能没有什么问题。但是在Windows内部，每个账号具有一个惟一的Security ID，可以在HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion \ProfileList看到。
SID是用来识别账户的惟一标志，而不是通常以为的机器名\用户名。
而现有的克隆虚拟机是把整个安装好的系统分区直接克隆下来，这样多台机器就有了相同的SID，这样在你加入域的时候，会报错，工作不正常。

- 修改办法：打开克隆完的虚拟机：windows/System32/Sysprep/Sysprep.exe 勾选generalise选项即可。
![image2](2dc4119821304691b52c1212b4b29b1e.png)

![image3](02d6fd68997d4577ac6f535265e5785d.png)

- 确定之后需要执行如下命令：

2018年6月7日
5:30
