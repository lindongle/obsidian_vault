---
title: Windows Server 2012 iSCSI目标服务器群集 - 鸿网互联
updated: 2026-06-06T10:05
created: 2018-06-06T23:25:50
---

Windows Server 2012 iSCSI目标服务器群集 - 鸿网互联
星期三, 六月 6, 2018
3:25 下午

已剪辑自: <http://www.68idc.cn/help/server/20150628391408.html>
之前已经测试了Windows Server 2012 iSCSI目标服务器功能，接下来将测试Windows Server 2012 iSCSI目标服务器群集功能，也就是在Windows Server 2012的群集中提供iSCSI服务，实现高可用。 实验环境： 5台服务器都为Windows Server 2012 DataCenter操作系统 S
之前已经测试了Windows Server 2012 iSCSI目标[服务器](http://www.68idc.cn/)功能，接下来将测试Windows Server 2012 iSCSI目标[服务器](http://www.68idc.cn/)群集功能，也就是在Windows Server 2012的群集中提供iSCSI服务，实现高可用。
实验环境：
![image1](8781a122f6cf4854819263c59fca15c9.jpg)
5台服务器都为Windows Server 2012 DataCenter操作系统
SRV2012服务器安装iSCSI目标服务器角色并配置2块虚拟磁盘给两台群集服务器共享使用
群集服务器用来部署iSCSI目标服务器群集服务，提供高可用的iSCSI共享磁盘给DC02使用。
DC02域控服务器用来模拟iSCSI客户端，使用群集提供的iSCSI共享磁盘。
操作步骤：
1\. 系统准备
按拓扑图配置群集服务器的IP地址，并调整网卡的优先顺序为：LAN\>Hearth
将群集节点服务器加入contoso.com域，关闭系统防火墙。
2\. 群集节点服务器安装iSCSI目标服务器角色和故障转移群集功能
分别登录Node01和Node02两台群集节点服务器，打开服务器管理器—添加角色和功能，选择“iSCSI目标服务器”
![image2](b869e3a55a294557ba80eae8cad4ab38.png)
在功能中选择“故障转移群集”
![image3](2e9513b8178543c481770b95886d13c8.jpg)
3\. 群集共享磁盘准备
A．在SRV2012服务器上面配置iSCSI目标服务器并启用虚拟磁盘
在SRV2012服务器上面启用“iSCSI目标服务器”角色，并配置用于群集的2块共享磁盘：仲裁盘2GB，，数据盘10GB。
注意：在配置iSCSI目标发起程序时，需添加两台群集节点服务器的IP地址。
B． 群集节点服务器配置iSCSI发起程序连接磁盘
分别在两台群集节点服务器上面打开iSCSI发起程序，连接iSCSI共享磁盘，对磁盘执行联机、初始化。
在其中任意一台上面执行新建卷、分配驱动器号操作。
本节的具体操作步骤请参考：
4\. 创建群集
登录Node01.contoso.com，打开故障转移群集。点击“验证配置”
![image4](c53d0a15d34e4a0d99c30678fdc9958f.jpg)
点击“下一步”
![image5](1be258f7ecb842a79ba3c0638d70f379.jpg)
添加Node01和Node02两台群集节点服务器，点击“下一步”
![image6](8880bfad709b4bb9aa66c98d7406c4cc.jpg)
这里选择“仅运行选择的测试”，点击“下一步”
![image7](d08498dd78c744829276a6d2bec2c93c.jpg)
勾选“存储、清单、网络、系统配置”，点击“下一步”
![image8](8a472119b8a64739999df0b78c84a0f6.jpg)
点击“下一步”
![image9](380b47f2a2e84ba69a0ded3ea76cd1b4.jpg)
验证完成，提示Hyper-V的警告信息，本次不体验hyper-V的高可用，忽略。点击“完成”
![image10](5140ca9fdb354571a27a13957cf6d98f.png)
进入创建群集向导，点击“下一步”
![image11](1c245698862642928aadef7efbf9349e.jpg)
输入群集名称、群集IP地址，点击“下一步”
本次测试用的是Cluster名称，IP为192.168.1.106，下图中的参数不对，没有重新截图，偷懒了！
![image12](ac8b2dcb8fec456b8a8aa76311a1f2e6.jpg)
点击“下一步”
![image13](750948d450ad4b46aefe92c290b95749.jpg)
创建成功，点击“完成”
![image14](74fab5613c334c4e93a9696daf796822.jpg)
群集管理主界面：
![image15](daa542bd442a4eb2a62092d0306cfb74.jpg)
磁盘信息：
![image16](df5f0776e7214e11b1f8483188052eea.jpg)
