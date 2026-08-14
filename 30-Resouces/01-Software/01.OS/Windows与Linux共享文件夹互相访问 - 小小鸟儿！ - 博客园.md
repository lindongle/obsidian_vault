---
title: Windows与Linux共享文件夹互相访问 - 小小鸟儿！ - 博客园
updated: 2026-06-06T10:05:34
created: 2026-07-05T17:04:53
---

Windows与Linux共享文件夹互相访问 - 小小鸟儿！ - 博客园
星期日, 十月 14, 2018
8:05 下午
已剪辑自: <https://www.cnblogs.com/wxmdevelop/p/5757261.html>
\[[原文](http://blog.csdn.net/xiaoxinghehe/article/details/8294717)\]

首先安装并配置软件samba  
安装以下RPM
下载网址：https://pkgs.org/
![image1](a1e0544ae06d42d6bb5eee9ff48c3030.png)
**\[html\]**[view plain](http://blog.csdn.net/xiaoxinghehe/article/details/8294717)[copy](http://blog.csdn.net/xiaoxinghehe/article/details/8294717)
1.  sudoyuminstallsambasamba-client
2.  vim/etc/samba/smb.conf
3.  
4.  找到security这行并将#注释符号去掉改成
5.  security=share#共享模式
6.  
7.  添加如下代码：
8.  
9.  \[share\]
10. comment=share
11. path=/home/test#设置共享文件夹目录
12. browseable=yes
13. guestok=yes
14. writable=yes
15. 
16. servicesmbstart
17. servicesmbdstart(ubuntu)

（1）在windows下访问linux共享：
直接在windows运行里输入\\192.168.16.128即可访问linux共享资源，并且不需要密码。

（2）在linux下访问windows共享：  

smbclient -L 192.168.16.1 -U xiaoxing //查看共享了那些目录，由此知道主机名为XIAOXING-PC  

smbclient //192.168.16.1/Users -U xiaoxing 输入windows密码即可进入  

  
//直接挂载windows共享目录  

sudo mount -t smbfs -o username=xiaoxing,password=123456 //XIAOXING-PC/system /mnt/win/
或者：
sudo mount -t smbfs -o username=xiaoxing,password=123456 //192.168.16.1/system /mnt/win/
或者：  
sudo mount -t smbfs -o username=xiaoxing,password=123456,ip=192.168.16.1 //XIAOXING-PC/system /mnt/win/  

注意：  

如果出现如下错误：  

mount: unknown filesystem type ’smbfs’
说明系统已经不能识别smbfs文件系统了，查资料说RHE5的kernel已经不再支持smbfs，而改用Common Internet File Systemcifs(cifs)取代了原有的smbfs，所以命令就改为:  
sudo mount -t cifs -o username=xiaoxing,password=123456 //192.168.16.1/system /mnt/win/  

解开挂载  
断开刚才挂载在linux /mnt/win/路径上的winodws共享文件夹。  
sudo umount /mnt/win/
