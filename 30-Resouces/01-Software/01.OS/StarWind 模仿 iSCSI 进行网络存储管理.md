---
title: StarWind 模仿 iSCSI 进行网络存储管理
updated: 2026-06-06T10:05
created: 2018-06-06T23:18:54
---

iSCSI Software Target 是一个可选的Windows 服务组件，在存储区域网络 (SAN)中提供中心化、基于软件和硬件独立的 iSCSI 磁盘子系统。iSCSI设备是通过普通的TCP/IP网络访问共享存储。官方提供的 iSCSI Software Target 支持 Windows Server 2008 R2 和 Windows Server 2008 R2 SP1（[下载地址](http://www.microsoft.com/en-us/download/details.aspx?id=19867)），iSCSI 的客户端连接工具为SCSI Software Initiator（iSCSI 发起程序），Windows Server 2008 默认已安装，若没有安装，请点击[这里下载](http://www.microsoft.com/en-us/download/details.aspx?id=18986)，SCSI Software Initiator 安装程序适应较多Windows系统版本。

<span style='background: white'>iSCSI Software Target 在一些 window 2008 上不可安装，因此才寻找它的替代品——</span><span style='font-weight:bold;background:white'>StarWind</span><span style='background:white'>,StarWind 能够虚拟网络硬盘并进行管理.</span>
<span style='color:#4F4F4F;background: white'>官方下载地址 :</span>[<span style='background:white'>StarWind Virtual SAN® Free</span>](https://www.starwindsoftware.com/starwind-virtual-san-free)
<span style='font-size:12.0pt;color:#4F4F4F;background:white'>官网需要填写资料，也可到这里下载：</span>[<span style='font-size:10.5pt;background:white'>starwind.exe</span>](http://download.csdn.net/detail/kk185800961/8806409)

<span style='font-weight: bold;background:white'>安装步骤不说明，一步步点击即可。</span>

<span style='font-weight: bold;background:white'>现在在虚拟机添加硬盘测试：</span>
<span style='background: white'>本测试服务器为域控制器（也是DNS服务器），双网卡。</span>
<span style='font-weight: bold;background:white'>网卡1：</span>
<span style='background: white'>IP地址：192.168.2.9</span>
<span style='background: white'>DNS服务器：192.168.2.1</span>

<span style='font-weight: bold;background:white'>网卡2：</span>
<span style='background: white'>IP地址：192.168.1.9</span>
<span style='background: white'>网关：192.168.1.1</span>

<span style='background: white'>添加一块硬盘，将作为网络存储的硬盘：</span>
![image1](85d686b607a945048d9f0c63c7200b12.png)

<span style='background: white'>打开</span><span style='font-weight:bold;background:white'>磁盘管理器</span><span style='background:white'>，</span><span style='font-weight:bold;background:white'>转换到动态磁盘</span><span style='background:white'>，并创建</span><span style='font-weight:bold; background:white'>简单卷</span><span style='background:white'>并格式化，如下图：</span>
![image2](d167552c896e405c8bfcc2a709f42c09.png)
<span style='background: white'>格式化后，硬盘正常使用，在该盘创建一个文件夹</span><span style='font-weight:bold; background:white'>DiskImage</span><span style='background:white'>，稍后使用：</span>
![image3](7db83cd0edd64c54a1c7b3197ba7b0d6.png)
<span style='color:#4F4F4F;background: white'>打开StarWind 软件，进入管理中心，</span><span style='font-weight:bold; color:#4F4F4F;background:white'>增加连接（Add Connection Inc）。</span><span style='font-weight:bold;color:red;background:white'>连接用户和密码均为 “test”</span>
![image4](61e10a51f18c4f7cab3049b8cf0d652e.png)

<span style='background: white'>输入本机IP ：192.168.1.9</span>
![image5](720ad5d860454d23b25396c3ce3c67d6.png)

<span style='background: white'>增加设备（Add Device…）</span>
![image6](89e48595bea4471288af2efa388ba31d.png)

![image7](601bfdff041d4ce6972c3f5c2b363819.png)

![image8](8b761f4aeaa5448683f4454f1b26571c.png)
<span style='background: white'>这将划分一个硬盘，设置其硬盘大小，保存为1个系统文件（E:\DiskImage\AebiterDisk.mg）。</span>
![image9](4885e89bd4a84ac8bb9799c6a09b5bfd.png)

![image10](65cdcd79c9ef4f49816cfaddffafb64d.png)

![image11](3d47a355616e40fb8889441d6be52783.png)

![image12](515047873a49478ba7b3a1c9a1e53ec6.png)

![image13](d4bf63bcf5ec42d6bffb805e6d56df01.png)

<span style='background: white'>重复创建3个盘（arbiterdisk，msdtcdisk，dbdisk），创建完成后</span>
![image14](b83e54b407c6453fbc2b73a529e2fc07.png)

![image15](4c587e8ba39c42cabb33c7ad41962e5e.png)
<span style='background: white'>划分的3镜像硬盘，若空间不足，可以随时增加。右键某个硬盘 ，</span><span style='font-weight:bold; background:white'>扩展大小（Extend Size）</span>
![image16](84cd6f4de7464b48ae9ed99fddef411d.png)

<span style='background: white'>若中心服务器上原来挂载的硬盘（逻辑 E 盘）空间不足，只要外接硬盘，还可以进行扩展。同样可以做其他磁盘阵列</span>
<span style='color:#4F4F4F;background: white'>（参考</span>[<span style='background:white'>Windows 动态磁盘卷：简单卷、跨区卷 、带区卷 、镜像卷 、RAID5卷 相关配置操作</span>](http://blog.csdn.net/kk185800961/article/details/46289255)<span style='color:#4F4F4F;background:white'>）</span>
![image17](fc3e5da6ca80420c8b9854b235d003f8.png)

<span style='background: white'>管理中心已经划分了3个目标镜像盘，这里基本操作完成，现在登录到客户端。</span>
<span style='background: white'>客户端为Windows server 2008 sp2，默认安装了组件 【iSCSI 发起程序】</span>

<span style='background: white'>注：这是同一个域中的计算机</span>

<span style='background: white'>点击 开始——程序——管理工具——iSCSI 发起程序</span>
<span style='background: white'>（如果做windows集群，各个节点都需要连接到存储服务器，磁盘则可作为集群磁盘）</span>
![image18](5b913869c1d742afa74ba3a8fb057673.png)
<span style='background: white'>打开了</span><span style='font-weight:bold;background:white'>iSCSI 发起程序属性</span><span style='background:white'>，可能提示启动</span><span style='font-weight: bold;background:white'>iSCSI</span><span style='background:white'>服务和让服务通过防火墙。</span>
<span style='background: white'>点击</span><span style='font-weight:bold;background:white'>发现</span><span style='background:white'>选项，在</span><span style='font-weight:bold; background:white'>目标门户</span><span style='background:white'>中点击</span><span style='font-weight:bold;background:white'>添加门户</span><span style='background:white'>。</span>
<span style='background: white'>输入存储服务器的IP地址或者DNS（如192.168.1.9 或者 192.168.2.1 ），默认端口3260，如果防火墙打开，允许端口通过。</span>
![image19](fa6503a521df45ca8e39c8076c998c88.png)
<span style='background: white'>看到3个目标处于</span><span style='font-weight:bold;background:white'>不活的</span><span style='background:white'>状态，点击</span><span style='font-weight:bold; background:white'>目标</span><span style='background:white'>选项 ，选中每个目标名称，点击</span><span style='font-weight:bold;background:white'>登录</span><span style='background: white'>：</span>
![image20](424fd266adce47be88c305c62b872a2f.png)
<span style='background: white'>在</span><span style='font-weight:bold;background:white'>登录到目标</span><span style='background:white'>的对话框中，勾选</span><span style='font-weight:bold; background:white'>计算机启动时自动还原次连接(R)</span>
![image21](9a90c6673b184cb8841b4d96f312ef32.png)
<span style='background: white'>此时 在选项卡</span><span style='font-weight:bold;background:white'>收藏的目标</span><span style='background:white'>中可以看到设置为自动连接的目标。</span>
![image22](9e3391a1ad3542ba91e157b36108975e.png)

<span style='background: white'>回到 StarWind管理中心，可以看到每个镜像盘下都有1个连接过来的服务器信息</span>
![image23](3adfddbcf2734f9ca7404b932a589275.png)
<span style='background: white'>（若设置为集群共享磁盘：集群各节点只要连接到存储服务器就行，以下只在主节点中操作）</span>
<span style='background: white'>回到客户端，打开磁盘管理器，可以看到3块硬盘！</span>
![image24](db84903f018045c6a654124cdf3726c2.png)
<span style='background: white'>将3块硬盘进行</span><span style='font-weight:bold;background:white'>联机</span><span style='background:white'>并</span><span style='font-weight:bold;background:white'>初始化磁盘</span><span style='background:white'>，可像正常的基本磁盘一样</span><span style='font-weight:bold; background:white'>创建简单逻辑卷</span><span style='background:white'>并进行格式化。</span>
<span style='background: white'>格式化完成后，本地将有3个可用的逻辑盘，相当于本机硬盘一样使用。</span>
![image25](3f959cae1a204b709160ccfba9d5ab28.png)

![image26](0e362e40b2f543a59d91c90eb59e0e38.png)

<span style='background: white'>至此，配置完成。</span>
<span style='background: white'>但是 iSCSI 基于TCP/IP 的网络访问，受限于网络传输的影响。</span>
<span style='background: white'>同样可将网络存储磁盘用于Windows集群中，使其可做磁盘故障转移。</span>

*来自 \< <https://blog.csdn.net/kk185800961/article/details/46496915>\>*

