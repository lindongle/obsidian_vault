---
title: Vmware创建共享磁盘详细步骤_学霸学习网
updated: 2026-06-06T00:32
created: 2018-06-07T01:28:02
---

Vmware创建共享磁盘详细步骤_学霸学习网
星期三, 六月 6, 2018
5:28 下午

已剪辑自: <http://www.tceic.com/k210ghg28762iggkjj33j4h8.html>
Vmware 创建共享磁盘详细步骤  
一、实验环境  
虚拟机：Vmware8.0 操作系统：windows2003 32 位 主机系统：windows 7 64 位 操作人：牛角书生 Q Q：450641072  

二、实验目的  
为了实现在 windows2003 环境下，安装双机软件 RoseHA 8.9，加载共享磁盘及应用服 务，验证双机切换功能，需要在 VMware 环境下创建共享磁盘，这里我们不介绍安装配置 RoseHA 8.9.  

三、实验步骤 1，在将 vmware 安装的文件夹下创建 sharedisks 文件夹：  

2,运行—CMD， 打开 DOS 窗口， 切换至 Vmware 安装的目录， 然后执行  
F:\Virtual Machines\>vmware-vdiskmanager.exe Machines\sharedisks sharedisk-1.vmdk” -c -s 100M -a lslogic -t 2“F:\Virtual  

3， 在我们之前新建的目录 sharedisks 可看到新生成的两个文 件  

4，配置虚拟机  
选择我们要设置的虚拟机 win2003-1，  

然后右击，选择 settings  

选择 Hard Disk,然后选择 Add..  

选择 Next  

选择 Use an exiting virtual disk,然后点击 Next  

点击 Browse …,选择我们设置好的共享磁盘  

点击 Finish  

这里我们选择 Keep Exiting Format ,如果有需要，可以选择 Convert 进行格式转换  

选中我们刚建好的磁盘，然后点击 Advanced…  

选择 SCSI 1：1 不和系统磁盘在一个通道上面  

点击 OK 即可完成本台设备 win2003-1 的磁盘添加。 同样操作为 win2003-2 添加同一块共享磁盘  

5，更改 win2003-1.vmx 和 win2003-2.vmx 配置  
找到配置文件位置  

打开，并添加 disk.locking="FALSE" scsi1:1.SharedBus="Virtual"

挂载后出现“pxe-mof:exiting intel pxe rom operating system not found”的错误，则须要在虚拟机BIOS中又一次设置系统的引导磁盘。操作步骤：在步骤5找到的\*.vmx文件里追加bios.forceSetupOnce = "TRUE"，这样开机系统进入BIOS页面。在BIOS的boot中又一次设置系统引导磁盘便可正常启动系统。

*来自 \<<https://www.cnblogs.com/lytwajue/p/7110252.html>\>*

6，打开 win2003-1 和 win2003-2 操作系统进行磁盘初始化  
右击我的电脑-管理-磁盘管理，首次打开，系统会对识别的新磁盘进行初始化操作  

点击下一步  

选择我们要初始化的磁盘，并点击下一步  

这里需要选择要转化的动态磁盘，我们这里不需要转化为动态磁盘，不需要选择，点击下一 步即可  

点击完成  

可发现我们新增加的 100M 共享磁盘。  

7，磁盘分区  
右击未 100MB 指派区域，  

选择新建磁盘分区  

点击下一步  

这里我们选择主磁盘分区，点击下一步  

选择分区大小，这里我们使用全部空间，并只划分一次分区，点击下一步即可。  

选择磁盘驱动器号，这里我们选择 F，驱动器号可因需要选择  

点击下一步  

格式化分区，这里我们选择 NTFS 文件系统，执行快速格式化操作， 。  

点击下一步  

点击完成  

可看到新增分区 F 盘。 同样操作初始化 win2003-2 新增磁盘，不要分配分区，这里不要同时打开磁盘进行写操作，  

会操作磁盘不一致。 到这里，Vmware 创建共享磁盘就完成了！  

  

