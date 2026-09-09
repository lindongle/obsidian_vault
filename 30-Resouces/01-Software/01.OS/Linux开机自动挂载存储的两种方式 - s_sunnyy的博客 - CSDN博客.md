---
title: Linux开机自动挂载存储的两种方式 - s_sunnyy的博客 - CSDN博客
updated: 2026-06-06T00:28
created: 2018-10-22T18:22:16
---

上午
已剪辑自: <https://blog.csdn.net/s_sunnyy/article/details/78912154>
原文： [http://blog.csdn.net/huangjin0507/article/details/46004241<u>  
</u>](http://blog.csdn.net/huangjin0507/article/details/46004241)
有两种办法：
1：把mount 的命令放到/etc/rc.d/rc.local 里面去，vi /etc/rc.d/rc.local ，然后把 mount -t nfs dl1:/home/users /home/users 这个命令写进去。保存退出就好了。

2：修改/etc/fstab文档
\[root@node12 ~\]# cat /etc/fstab
\#  
\# /etc/fstab  
\# Created by anaconda on Sat Oct 8 02:22:52 2016  
\#  
\# Accessible filesystems, by reference, are maintained under '/dev/disk'  
\# See man pages fstab(5), findfs(8), mount(8) and/or blkid(8) for more info  
\#  
UUID=8ae8f9c6-4ca9-4412-ac5b-d0d577ebfa9d /            xfs   defaults    0 0  
UUID=26c66df8-b4fd-47f3-9b1d-f9898fc44b94 /boot          xfs   defaults    0 0  
UUID=546cfd46-10d6-412d-8c4e-94ee22285a2e swap          swap  defaults    0 0  
把要挂载的盘信息加到里面吧：
UUID=8ae8f9c6-4ca9-4412-ac5b-d0d577ebfa9d /            xfs   defaults    0 0  
UUID=26c66df8-b4fd-47f3-9b1d-f9898fc44b94 /boot          xfs   defaults    0 0  
UUID=546cfd46-10d6-412d-8c4e-94ee22285a2e swap          swap  defaults    0 0  
192.168.100.101:/home  /home  nfs   defaults    0    0  

保存退出，等重启服务器就可以生效了。

关于linux开机之后自动加载挂载的分区，这块，涉及到的文件是/etc/fstab文件  
关于这个文件的描述说明如下:  
要求：  
1）根目录/必须载入，而且要先于其他载入点被载入  
2）其他载入点必须为已建立的目录  
3）若进行卸载，必须先将工作目录移到载入点及其子目录之外
/etc/fstab里面每列大概意思为：
第一列为设备号或该设备的卷标，即需要挂载的文件系统或存储设备；  
第二列为挂载点  
第三列为文件系统或分区的类型  
第四列为文件系统参数，即挂载选项，详细参考man mount.命令，defaults就没有问题，除非你有特殊需求；  
第五列为dump选项，设置是否让备份程序dump备份文件系统。0：不备份，1：备份，2：备份(但比1重要性小)。设置了该参数后，Linux中使用dump命令备份系统的时候就可以备份相应设置的挂载点了。  
第六列为是否在系统启动的时候，用fsck检验分区,告诉fsck程序以什么顺序检查文件系统。因为有些挂载点是不需要检验的，比如：虚拟内存swap、/proc等。0：不检验，1：要检验，2要检验(但比1晚检验)，一般根目录设置为1，其他设置为2就可以了。

