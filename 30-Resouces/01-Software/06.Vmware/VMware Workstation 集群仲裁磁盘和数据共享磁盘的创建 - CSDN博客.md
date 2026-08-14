---
title: VMware Workstation 集群仲裁磁盘和数据共享磁盘的创建 - CSDN博客
updated: 2026-06-06T10:05:38
created: 2026-07-05T17:04:54
---

上午
已剪辑自: <https://blog.csdn.net/quwenzhe/article/details/41287355>
   最近项目需要对SQL Server建立集群服务，多个SQL Server数据库建立集群服务，对外提供唯一的URL访问地址。当主节点断电、断网后，通过心跳线将消息传递到备用节点，备用节点在3秒内接管数据库访问任务，实现双机热备。
 由于台式机过2天才能到位，所以就先在虚拟机上装了2套windows Server 2008 R2系统，模拟集群创建过程。关于SQL Server建立集群的文章，网上是众说纷纭，对于一个新手来说，可谓是不知所措。但集群中仲裁磁盘和共享磁盘的创建是每个集群所必须的，在此我把虚拟机集群仲裁磁盘和数据共享磁盘的创建过程和大家分享下，希望能帮助大家。
 1.在本地电脑创建文件夹ShareDisks，比如我的是：D:\ShareDisks，ShareDisks文件夹用来保存后面两个操作创建的虚拟仲裁磁盘和数据共享磁盘文件；
 2.创建仲裁磁盘。在DOS窗口进入VMwareWorkstation软件安装目录，比如我安装目录是：E:\VM，在DOS窗口输入如下命令：vmware-vdiskmanager.exe -c -s 500Mb -a lsilogic -t 4 "D:\ShareDisks"\Quorum.vmdk。效果图如下：

![image1](87a4588f333d434989f611c8329d7ad9.png)

 3.创建数据共享磁盘。在DOS窗口进入VMwareWorkstation软件安装目录，比如我安装目录是：E:\VM，在DOS窗口输入如下命令：vmware-vdiskmanager.exe -c -s 1Gb -a lsilogic -t 4 "D:\ShareDisks"\ShareDisk.vmdk。效果图如下：

![image2](79b59f8c3b4c464d91e7d313797b8e4b.png)

 4.验证共享磁盘是否成功创建，打开D盘下的ShareDisks文件夹，效果图如下：

![image3](48a873f7ca3e483b8c6565f753b0e804.png)

 5.附件仲裁磁盘和数据共享磁盘到虚拟机。找到节点1对应的虚拟系统安装目录(不是虚拟机软件安装目录)，比如我是E:\VM\Server2008R2-A,找到\*.vmx(VMware配置文件),用记事本打开,添加如下记录:
1.  disk.locking="false"
2.  diskLib.dataCacheMaxSize="0"
3.  scsi1.present="TRUE"
4.  scsi1.virtualDev="lsilogic"
5.  scsi1:5.present="TRUE"
6.  scsi1:5.fileName="D:\ShareDisks\Quorum.vmdk"
7.  scsi1:6.present="TRUE"
8.  scsi1:6.fileName="D:\ShareDisks\ShareDisk.vmdk"
 效果图如下：

![image4](406e759c77104dc3b659ef351f911c35.png)
 6.重启VMware Workstation，出现下图效果，则证明创建成功。

![image5](c5240a8a61894f6fbb7546f353bd470b.png)

 7.向虚拟机系统挂载新磁盘，可能会导致系统引导磁盘顺序的颠倒。如果挂载前系统可以正常启动，挂载后出现“pxe-mof:exiting intel pxe rom operating system not found”的错误，则需要在虚拟机BIOS中重新设置系统的引导磁盘。操作步骤：在步骤5找到的\*.vmx文件中追加bios.forceSetupOnce = "TRUE"，这样开机系统进入BIOS页面，在BIOS的boot中重新设置系统引导磁盘便可正常启动系统。
 到此，关于VMware Workstation 集群仲裁磁盘和数据共享磁盘的创建过程讲解完毕。不过虚拟机终归是虚拟机，很多地方无法模仿。等台式机到了，待搞过各种集群的沈工有空了，我就开始真刀真枪的到台式机上实验。
 希望大家能关注我关于集群创建的后续博客，谢谢。
