---
title: Windows Server 2012 系统群集 - CSDN博客
updated: 2026-06-06T10:05:38
created: 2026-07-05T17:04:53
---

Windows Server 2012 系统群集 - CSDN博客
星期三, 六月 6, 2018
2:43 下午

已剪辑自: <https://blog.csdn.net/zy_27_ok/article/details/72654280>
Windows Server 2012系统群集
本次将测试Windows Server 2012 系统群集功能。
实验环境：
![image1](3ddeef7c26cc40fba06c23e62b1987ec.jpg)
4台服务器都为Windows Server 2012 DataCenter操作系统
SRV2012服务器安装iSCSI目标服务器角色并配置2块虚拟磁盘给两台群集服务器共享使用。
群集服务器安装群集功能，本次测试将Hyper-V角色一起安装了，为下次的Hyper-V高可用做准备。
操作步骤：
1.系统准备
按拓扑图配置群集服务器的IP地址，并调整网卡的优先顺序为：LAN\>Heart
将群集节点服务器加入contoso.com域，关闭系统防火墙。
关闭心跳网卡的DNS注册和NETBIOS。
![image2](6b1827b4fcfb4245b3504178d36f0b1c.jpg)
![image3](7be63f748d0a4a2baf13686fbb92f569.jpg)
2.群集节点服务器安装Hyper-V角色和故障转移群集功能
分别登录Node01和Node02两台群集节点服务器，打开服务器管理器—添加角色和功能
![image4](d5f5897b2aaf400d8daa062c31328e46.jpg)
点击“下一步”
![image5](bbbf8840615842b694c26f63d7f21d28.jpg)
点击“下一步”
![image6](9781c69e487947e68536d8a6fecef878.jpg)
点击“下一步”
![image7](8be0c692ebac460c832c6e1740ebc665.jpg)
选择Hyper-V，点击“添加功能”添加Hyper-V所必需的功能，点击“下一步”
![image8](af51e66724194ed2b09e79d5a25ab84c.jpg)
![image9](a5b1bea6dd9a4c318340d1eee8f1cea0.jpg)
选择故障转移群集，点击“添加功能”添加故障转移群集所必需的功能，点击“下一步”
![image10](0c593118bb8043b8b811ddc9293926e2.jpg)
![image11](b72bda532d074dce9a0bf89b77edf635.jpg)
Hyper-V配置，点击“下一步”
![image12](7879b7032b4349f38cdc1364174de250.jpg)
选择Hyper-V虚拟交换机所用的物理网卡，点击“下一步”
![image13](95ac05320696452aa3b7c555822328f4.jpg)
勾选“允许此服务器发送和接收虚拟机的实时迁移”，点击“下一步”
![image14](88f2018a9a554dbb97ab98a0a132180d.jpg)
Hyper-V虚机默认的存储位置，点击“下一步”
![image15](14bf17d07a6347c489cfd06b974828dd.jpg)
勾选“自动重启”选项，点击“安装”
![image16](1bf61d2f49144fc88cd623c5237d79fe.jpg)
安装完成，点击“关闭”
![image17](c8a9614ebe584ef98617bda93dc8c175.jpg)
另外一台群集节点服务器node02.contoso.com也按此步骤进行配置。
3.群集共享磁盘准备
在SRV2012服务器上面启用“iSCSI目标服务器”角色，并配置用于群集的2块共享磁盘：仲裁盘2GB，数据盘30GB。
分别在两台群集节点服务器上面打开iSCSI发起程序，连接iSCSI共享磁盘，对磁盘执行联机、初始化。在其中任意一台上面执行新建卷、分配驱动器号操作。
本节的具体操作步骤请参考：http://bbs.winos.cn/thread-132531-1-1.html
磁盘准备完成，如图：
![image18](96d1f5eefd624b0f95e992eb133fd15c.jpg)
4.创建群集
登录Node01.contoso.com，打开故障转移群集。
![image19](97b3749274af4d21b08f175187132f4e.jpg)
点击“验证配置”
![image20](97090457f485414490fa03c941ccc998.jpg)
点击“下一步”
![image21](9aabe5e6af834fc5acdc216915c21d0f.jpg)
添加Node01和Node02两台群集节点服务器，点击“下一步”
![image22](a9f1dd76c26c449ea5366c86d22dc26c.jpg)
这里选择“运行所以测试”，点击“下一步”
![image23](d35ccff843fd4319aba25d221413656e.jpg)
点击“下一步”
![image24](c2f4374312bf4cf3bcd4c2bfff73b2a2.jpg)
验证完成，点击“完成”
![image25](64e4f2e422644e31b8cc6c939ae1e02f.jpg)
进入创建群集向导，点击“下一步”
![image26](cdc9d0baee1a4047a22412fd4b0c6b8e.jpg)
输入群集名称、群集IP地址，点击“下一步”
本次测试用的是Cluster名称，IP为192.168.1.200。
![image27](1e99176ae17b4f159ea9f17245605da9.jpg)
点击“下一步”
![image28](e1369ff98511487882255f62b64d179e.jpg)
创建成功，会自动智能选择仲裁盘（2GB的Disk1），点击“完成”
![image29](8564bc47423345189c597aaf32138d47.jpg)
群集管理主界面：
![image30](cd4f774f8c74414ea61b232ad93d141a.jpg)
群集节点状态正常：
![image31](d909a0cf771d4593886fbfee8dfd47e5.jpg)
磁盘信息：
![image32](fc4576fc05a4467aaf547362678464cd.jpg)
可以手动调整仲裁配置，里面有多种方式：
![image33](4746a4f4ff814ad68d278e8eab685638.jpg)
网络信息：
![image34](aa09f13c9e664daca996b745636b56fc.jpg)
网络配置选项说明：
允许在此网络上进行群集网络通信：控制是否为群集通信的网卡，同时勾选第二项（允许客户端通过该网络通信）。
允许客户端通过该网络通信：如果是心跳网卡，此不勾选此选项，只需勾选第一项（允许在此网络上进行群集网络通信）。
不允许在此网络上进行群集网络通信：如果是iSCSI存储传输的网卡，此勾选此选项。
![image35](f2d9fe3aa4994473aaf79d8f61352eea.jpg)
5.启用群集共享卷
右键单击可用的存储，选择“添加到群集共享卷”
![image36](0c8940eb0b104044a02ca14d8db5f773.jpg)
启用完成，位置移动至C：\ClusterStorage\下面。
![image37](e3237ba70dcd4fa097b5871e979d8d01.jpg)
![image38](415ca24c3e544795aee4d509f956466d.jpg)
6.验证群集
一般在使用群集的过程中出现问题后，我们可以通过群集自身的验证功能进行检查，以便快速定位故障原因，解决故障。
验证步骤跟配置群集前的验证步骤一样，具体请参考第4点。
![image39](cbfef9c6acc24c97a3f90c931404a0e0.jpg)
7.迁移测试
迁移节点测试：右键单击群集—更多操作—迁移核心群集资源—最佳节点，PING群集IP出现一个丢包。
![image40](3be76e173f1e44a2a64417335f18f487.jpg)
![image41](56634a24a63f4874a65b8c183d6274aa.png)
测试完毕！
本次测试环境物理服务器只有2块物理网卡，在规划生产环境的虚拟化或私有云平台时，存储数据（ISCSI）、群集心跳、群集网络的传输一般都是隔开的。例如：心跳一块网卡，至少两块千兆网卡传输存储数据，至少两块千兆网卡做成Teaming，供群集网络交换。
