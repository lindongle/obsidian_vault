---
title: 初始化BGS
updated: 2026-09-02T16:30:05
created: 2026-07-05T17:04:48
---

管理员身份运行D:\Siemens\AIG22\bgs_root\bgs\bin64\initpassword.exe，输入密码infodba，确认密码后，在1分中内启动D:\Siemens\AIG22\bgs_root\bgs\bin64\restart.exe
![image1](86d195d6cc38430e8ff39d77ec04341a.png)

![image2](7a999d5a019f4dbb86751ce56d54afd5.png)
启动会，窗口会自动关闭，且任务管理器出现T4X进程，则启动成功；--2406，自动关闭后无法启动BGS
![image3](43786edf55af4d48ba0cb4f5478af638.png)
安装vc++运行库（VC++运行库2024.zip，必须安装这个），重启服务器。
在相应的BGS停止后，您可以重新开始初始化BGS：
1.  使用文本编辑器打开\<BGS_ROOT\>/var/conf/uuid，并记住其中的旧 UUID。后续步骤将需要它。
2.  从操作系统密码管理器中删除条目**Siemens_PL4x\_\<uuid\>/internal/token**和**Siemens_PL4x\_\<uuid\>/internal/InitialKey**。
3.  删除BGS目录下的\<«span style='font-weight:bold;background: \#F2F2F2'»BGS_ROOT«/span»\>/var/conf/uuid和\<BGS_ROOT\>/var/db/structured_secrets.db文件。

*来自 \< <https://docs.sw.siemens.com/documentation/external/PL20240419524974315/en-US/T4S4_sc/xid1340292/pph1713789091450/xid1753643.html>\>*

![image4](6e89651c3eb84e4b8762c5be2ddbcf96.png)
未出现自动关闭后无法启动BGS的问题，忽略以上。
![image5](204f24834a5146b2baef1693eb719dcd.png)
输入地址：https://tc:11320
![image6](28f96ac4e2f24098a3fb053eae745c5d.png)
用户名：t4adm，密码为initpassword.exe输入的密码
![image7](f07f035447284103b032ad941f4d95b1.png)

