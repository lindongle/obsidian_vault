---
title: AD 域服务简介（一）- 基于 LDAP 的 AD 域服务器搭建及其使用 - 沐小悠 - 博客园
updated: 2026-06-06T10:05
created: 2020-02-15T00:30:21
---

AD 域服务简介（一）- 基于 LDAP 的 AD 域服务器搭建及其使用 - 沐小悠 - 博客园
星期五, 二月 14, 2020
4:30 下午
已剪辑自: <https://www.cnblogs.com/cnjavahome/p/9029665.html>
博客地址：[http://www.moonxy.com](http://www.moonxy.com/)
**一、前言**
**1.1 AD 域服务**
什么是目录（directory）呢？
日常生活中使用的电话薄内记录着亲朋好友的姓名、电话与地址等数据，它就是 telephone directory（电话目录）；计算机中的文件系统（file system）内记录着文件的文件名、大小与日期等数据，它就是 file directory（文件目录）。
如果这些目录内的数据能够由系统加以整理，用户就能够容易且迅速地查找到所需的数据，而 directory service（目录服务）提供的服务，就是要达到此目的。在现实生活中，查号台也是一种目录；在 Internet 上，百度和谷歌提供的搜索功能也是一种目录服务。
Active Directory 域内的 directory database（目录数据库）被用来存储用户账户、计算机账户、打印机和共享文件夹等对象，而提供目录服务的组件就是 Active Directory （活动目录）域服务（Active Directory Domain Service，AD DS），它负责目录数据库的存储、添加、删除、修改与查询等操作。一般适用于一个局域网内。
在 AD 域服务（AD DS）内，AD 就是一个命名空间（Namespace）。利用 AD，我们可以通过对象名称来找到与这个对象有关的所有信息。
在 TCP/IP 网络环境内利用 Domain Name System（DNS）来解析主机名与 IP 地址的对应关系，也就是利用 DNS 来解析来得到主机的 IP 地址。除此之外，AD 域服务也与 DNS 紧密结合在一起，它的域命名空间也是采用 DNS 架构，因此域名采用 DNS 格式来命名，例如可以将 AD 域的域名命名为 moonxy.com。
**1.2 AD域对象与属性**
AD 域内的资源以对象（Object）的形式存在，例如用户、计算机与打印机等都是对象，而对象则通过属性（Attriburte）来描述其特征，也就是说对象本身是一些属性的集合。例如，创建一个账户张三，则必须添加一个对象类型（object class）为用户的对象（也就是用户账户），然后在这个用户账户内输入张三的姓名、登录账户、电话号码和电子邮件等信息，这其中的用户账户就是对象，而姓名、登录账户等数据就是该对象的属性，张三就是对象类型为用户（user）的对象。
**1.3 AD 域控制器 DC**
AD 域服务（AD DS）的目录数据存储在**域控制器（Domain Controller，DC）**内。一个域内可以有多台域控制器，每台域控制器的地位几乎是平等的，它们各自存储着一份几乎完全相同的 Active Directory。当在任何一台域控制器内添加了一个用户账户后，此账户默认被创建在此域控制器的 Active Directory，之后会自动被复制（replicate）到其他域控制器的 Active Directory，以便让所有域控制器内的 Active Directory 数据都能够同步（synchronize）。
当用户在域内某台计算机登录时，会由其中一台域控制器根据其 Active Directory 内的账户数据，来审核用户输入的账户与密码是否正确。如果是正确的，用户就可以登录成功；反之，会被拒绝登录。域控制器是由服务器级别的额计算机来扮演的，例如 Windows Server 2012 和 Windows Server 2008 R2 等。
通常，域控制器的 Active Directory 数据库是可以被读写的，除此之外，还有 Active Directory 数据库是只可以读取、不可以被修改的只读域控制器（Read-Only Domain Controller，RODC）。例如，某子公司位于远程网络，如果安全措施并不像总公司一样完备，则可以使用 RODC。
**1.4 LDAP**
LDAP（Lightweight Directory Access Protocol），轻量目录访问协议，是一种用来查询与更新 Active Directory 的目录服务通信协议。AD 域服务利用 LDAP 命名路径（LDAP naming path）来表示对象在 AD 内的位置，以便用它来访问 AD 内的对象。
LDAP 数据的组织方式：
![image1](1d09ca4bf5344c14934185a628f148d7.png)
LDAP 名称路径如下：
![image2](55c4d611fa2f4f449dce18b0906917ac.png)
**标识名称（distinguished Name，DN）**：它是对象在 Active Directory 内的完整路径，**DN** 有三个属性，分别是 **CN，OU，DC**。
**DC (Domain Component)：域名组件；**
**CN (Common Name)：通用名称，一般为用户名或计算机名；**
**OU (Organizational Unit)：组织单位；**
例如，如上用户账户，其 DN 为：
CN=张三,OU=Web前端组,OU=软件开发部,DC=moonxy,DC=com
其中 **DC（Domain Component）**表示 DNS 域名中的组件，例如 moonxy.com 中的 moonxy 与 com；**OU为组织单位（Organization Unit）**；**CN为通用名称（Common Name），一般为用户名或服务器名**。除了DC与OU之外，其他都利用CN来表示，例如用户与计算机对象都属于CN。上述DN表示法中的 moonxy.com 为域名，软件研发部、Web前端组都是组织单位。此 DN 表示账户张三存储在 **moonxy.com\软件研发部\Web前端组**路径中。
**相对标识名称（Relative Distinguished Name，RDN）**：RDN用来代表DN完整路径中的部分路径，例如上面路径中的 CN=张三与 OU=Web前端组等都是 RDN。
**Base DN**：LDAP 目录树的最顶部就是根，也就是所谓的 "Base DN"，如 "DC=moonxy,DC=com"。
除了 DN 与 RDN 这两个对象名称外，另外还有如下两个名称：
**全局唯一标识符（Global Unique Identifier，GUID）**：GUID 是一个128位的数值，系统会自动为每个对象指定一个唯一的GUID。虽然可以改变对象的名称，但是其GUID永远不会改变。
**用户主体名称（User Principal Name，UPN）**：每个用户还可以有一个比DN更短、更容易记忆的 UPN，例如上面的张三隶属于 moonxy.com，则其 UPN 可以为 <zhangsan@moonxy.com>。用户登录时所输入的账户名最好是 UPN，因为无论此用户的账户被移动到哪一个域，其 UPN 都不会改变，因此用户可以一直使用同一个名称来登录。
**AD 与 LDAP 的关系**：LDAP 是一种用来访问 AD 数据库的目录服务协议，AD DS 会通过 LDAP 名称路径来表示对象在 AD 数据库中的位置，以便用它来访问 AD 数据库内的对象。LDAP 的名称路径包括有 DN、RDN。
**openLDAP（Linux），Active Directory（Microsoft）**等是对 LDAP 目录访问协议的具体实现，除了实现协议的功能，还对它进行了扩展。
**1.5 全局编录**
虽然在域树内的所有域共享一个 Active Directory，但是 Active Directory 数据却分散在各个域内，而每个域仅存储该域本身的数据。因此，为了让用户、应用程序能够快速找到位于其他域内的资源，在 AD 域服务器内设计了**全局编录（Global Catalog，GC）**。
全局编录的数据存储在域控制器内，这台域控制器被称为全局编录服务器，它存储着林内所有域的 AD 内的每个对象。不过只存储对象的部分属性，这些属性都是常用来搜索的属性，例如用户的电话号码、登录账户名等。全局编录让用户即使不知道对象位于哪一个域内，仍然可以快速的找到所需的对象。
用户登录时，全局编录服务器还负责提供该用户所属的通用组的信息；用户利用 UPN 登录时，它会负责提供该用户隶属于哪一个域的信息。
一个林内的所有域树共享相同的全局编录，而林内的第一台域控制器默认就是全局编录服务器。必要时，也可以另外指派其他域控制器来当做全局编录服务器。
**二、安装 DNS 和 AD 域服务**
Windows 版本：Windows Server 2008 Enterprise Service Pack 1
系统类型： 64 位操作系统
**2.1 安装 DNS 服务器**
这一步不是必须的，在安装 Active Directory 域服务时可以同时装上 DNS 服务器：Active Directory 域服务安装向导 -\> 其它域控制服务器，勾上 DNS 服务器也有同样效果。但是鉴于服务器配置容易出现一些未知错误，所以还是推荐提前安装 DNS 服务比较好。
首先应该配置 DNS 服务器的**静态 IP**（推荐），否则安装时会出现如下提示：
![image3](b286b06fe40c415c893804a7303b2a80.png)
并且 DNS 服务器的地址设置为自己的地址 127.0.0.1：
![image4](14ee82d1c49144a48e50cc37f05f8989.png)
开始菜单 -\> 管理工具 -\> 服务器管理器，或者直接点击开始菜单旁边的快捷图标：
![image5](cbc94468e1414053bc3315cb7183272c.png)
选择左侧树形菜单 "角色" 节点，右键 "添加角色"，此处的 "角色" 表示此服务器要被配置为什么功能的服务器，即提供什么样的服务：
![image6](c131e9888b5f48a482633348955ff85e.png)
进入 "添加角色向导"，点击 "下一步" 按钮：
![image7](2b5a4bcfce5749d29b783bef17599d82.png)
进入选择 "角色" 页面：
![image8](ac7c808a4d3b47b9a8aa043d7296cd45.png)
勾选 "DNS 服务器" 角色，并点击 "下一步" 按钮：
![image9](e814b98a8ef9418f902a64c2d381cd89.png)
进入 DNS 服务器简介页面，点击 "下一步" 按钮：
![image10](d464ff1bdfc34a438717de319515e940.png)
进入确认安装页面，点击 "安装" 按钮：
![image11](46d4b4cb6d634eee9b6db8f2f97bfefc.png)
出现如下进度条：
![image12](7aa87d753fb0494caa285db531bfb28e.png)
点击 "关闭" 按钮，并重启服务器：
![image13](96f48614fc2a42439b2dd473315eacc3.png)
此时，DNS 服务已经安装完成。
**2.2 安装 Active Directory 域服务**
进入 "服务器管理器"中添加 AD 域服务角色：
![image14](e5a1bbf7bba4401b9950522c1c25c78f.png)
或者点击开始菜单 -\> 运行 -\> 输入命令 "**dcpromo**" ，然后回车：
![image15](9aa3859e9b7b47858493471956471755.png)
备注：
dcpromo 命令是一个 "开关" 命令。如果 Windows Server 2008 计算机是成员服务器，则 运行 dcpromo 命令会安装 AD 活动目录，将其升级为域控制器；如果Windows Server 2008 计算机已经是域控制器，则运行 dcpromo 命令会卸载 AD 活动目录，将其降级为成员服务器。
进入安装界面界面：
![image16](b7ac008b2afa4f7d8b08ed4ae22950af.png)
弹出 Active Direcotry 域服务安装向导，点击 "下一步" 按钮：
![image17](dc6f0f7948c64aab8fa68b106a6c35dc.png)
进入兼容性提醒页面，不用理会，点击 "下一步" 按钮：
![image18](ada21fefe0674b9883570e222486492d.png)
注意：如果是第一次搭建也是你整个内网中的第一台域控制器，那么需要选择第二项 "在新林中新建域"，第一项是内网中已经存在 AD 环境再想搭建额外域控制器的时候使用的。
选择 "在新林中新建域”并点击"，点击 "下一步" 按钮：
![image19](baaf9746ba47451ebd26c81367888cb2.png)
输入域名，这个要慎重，因为这个配置完毕之后要修改很麻烦且有风险，并点击 "下一步" 按钮：
![image20](15f363f076f24ada8206b2a0c24a89c1.png)
进入林功能级别设置界面，选择 "Windows Server 2008"，然后点击 "下一步"：
![image21](592ccc02022f4a2db301706eb22d9731.png)
注意：
这里需要强调的是，如果你的 AD 中以后可能会出现 Windows Server 2003 系统的域控制器，请务必选择 Windows Server 2003 的域功能级别，要不以后那些 Windows Server 2003 的服务器就做不了域控制器了，所以安装第一台 DC 的时候，都选择的低级别的林功能，以后要升到 Windows Server 2008 的域功能级别是没问题的，若是选了 Windows Server 2008 的功能级别，以后要降级就难了。
点击 "下一步" 按钮：
如果最初没有安装 DNS 服务器，此处可以勾选并安装：
![image22](0a12c208cbaa455ebe0f668c5560257f.png)
如果已经安装，此处即为灰色：
![image23](6b9bd96975474a73836ea33b87df5a4f.png)
弹出 DNS 提示框，不用理会，点击 "是" 按钮，继续安装：
![image24](7e5e820182dd4cd09c82ec8e5c6f325f.png)
进入AD 域的数据库文件、日志文件和共享文件位置设置页面，此处保持默认设置，点击 "下一步" 按钮：
![image25](d2fb2cf053e94f7790ffae8ccb3547b1.png)
进入 "域还原密码" 设置界面，此密码相当的重要，后续做数据库迁移、备份、整理、恢复的时候都可能用到，务必要牢记：
![image26](d17725951c3d467988ef4da11baf5268.png)
填入密码之后，点击 "下一步" 按钮：
![image27](ed3ac08193be478891b9ad44778e8873.png)
进入 "摘要" 界面，显示之前设置的摘要信息，点击 "下一步" 按钮：
![image28](af8fa6c0137c4246bdce5e4bbc31514b.png)
此处可以点击 "导出设置" 到一个位置保持起来，以便后续排错时查阅，也可以作为 DC 安装时的无人值守安装的脚本。
安装向导进入配置过程
![image29](46cdb800df26434a9ae3286dc840094a.png)
点击 "完成" 按钮，重启服务器：
![image30](3970b9ff4eb5489db52c7fa98a05f793.png)
此时，AD 域服务已经安装完成。ADDS域控制器已经安装完成，在完成域控制器的安装后，系统会自动的将该服务器的用户账号转移到 AD 数据库中。
**2.3 检查 DC 是否已经注册到 DNS**
域控制器 DC 会将自己扮演的角色注册到 DNS 服务器内，以便让其他计算机能够通过 DNS 服务器来找到这台域控制器，因此先检查 DNS 服务器内是否已经存在这些记录。利用与系统管理员（MOONXY/Administrator）登录。
**检查主机记录**
![image31](4947ad217b0a46ee91b7baf9bd0c6980.png)
首先检查域控制器是否已经将其主机名与 IP 地址注册到 DNS 服务器内。请到扮演 DNS 服务器角色的计算机 WIN-NHLP41A04F6.moonxy.com 上点击 "DNS" 菜单：
![image32](35f137feb2d043a3a8bdef5169e04d27.png)
此处应该会有一个名称为 moonxy.com 的区域，图中的主机(A)记录表示域控制器WIN-NHLP41A04F6.moonxy.com 已经正确地将其主机名与 IP 地址注册到 DNS 服务器内。DNS 客户端所提出的请求大多是**正向解析**，即通过 hostname 来解析 IP 地址对应与此处的正向查找区域；通过 IP 来查找 hostname 即为**反向解析**，对应于此处的反向查找区域。
![image33](eeea3c7418554943a0e8541164bf30de.png)
如果域控制器已经正确地将其扮演的角色注册到 DNS 服务器，则还应该有对应的 \_tcp、\_udp 等文件夹。在单击 \_tcp 文件夹后可以看到如下所示的界面，其中数据类型为**服务位置（SRV）**的 \_ldap 记录，表示WIN-NHLP41A04F6.moonxy.com 已经正确地注册为域控制器。其中的 \_gc 记录还可以看出**全局编录**服务器的角色也是由WIN-NHLP41A04F6.moonxy.com 扮演的。
![image34](9afeaeebcf9940fdabfe637293beb61f.png)
DNS 区域内包含这些数据后，其他要加入域的计算机就可以通过通过此区域来得知域控制器为WIN-NHLP41A04F6.moonxy.com。这些加入域的成员（域控制器、成员服务器、Windows 8、Windows 7、Windows Vista、Windows XP Professional 等）也会将其主机与 IP 地址数据注册到此区域内。
**三、管理 AD 域用户账户**
**3.1 域用户管理工具**
可以使用如下两个工具来管理域账户，如下：
**Active Directory 用户和计算机**：这是之前 Windows Server 2008、Windows Server 2003 等系统就已经提供的工具；
**Active Directory 管理中心**：这是从 Windows Server 2008 R2 开始提供的工具，用来取代 Active Directory 用户和计算机。
**3.2 创建组织单位与域用户账户**
通过使用 Active Directory 用户和计算机进行说明：
![image35](6d0d00dcb97c45ca8e06ca3990056964.png)
可以将用户账户创建到任何一个容器或组织单位（OU）内。以下创建一个名为软件研发部的组织单位。然后再建子组织单位，最后在此子组织单位内创建域用户账户。
**创建组织单位：**
![image36](abe52db664ec42d99d14ceaba5d3c6bb.png)
输入**软件研发部**的组织单位，然后点击 "确定" 按钮：
![image37](2966b52e3c834cdb8de1403d7b044df7.png)
创建之后，在该组织下面继续创建两个子组织单位：**Web 前端组**和**Java 开发组**。
Web 前端组：
![image38](77328e2588c146a69e6f78850b5b5fa9.png)
Java开发组：
![image39](c2a21a240ca349d5bfec1a6a8e459e95.png)
**创建用户：**
![image40](9aedd14fd3c842c8a4c7dbd9babd45ca.png)
进入创建用户界面，填入用户信息，比如此处创建用户：张三，然后点击 "下一步" 按钮：
![image41](db6e07a8f5fd47fd90c29feb5f4ecb1d.png)
注意：
**用户 UPN 登录：**用户可以利用这个与电子邮箱格式相同的名称（**zhangsan@moonxy.com**）来登录域，此名称被称为 User Principal Name（UPN）。在整个林内，此名称必须是唯一的。
**用户 SamAccountName 登录**：用户也可以利用此名称（**MOONXY\zhangsan**）来登录域，其中 MOONXY 为 NetBIOS 域名。同一个域内，此登录名称必须是唯一的。Windows NT、Windows 98 等旧版系统并不支持 UPN，因此在这些计算机上登录时，只能使用此处的登录名。
进入创建密码界面，域用户的密码默认必须至少7个字符，且至少包含大写字母、小写字母、数字、非字母数字等4组中的3组，点击 "下一步" 按钮：
![image42](d23318d5016c427d88e02bf446545a98.png)
进入完成页面：
![image43](6039187296ed4e359217f91f0eeebc57.png)
点击上面的 "完成" 按钮，即可看到新增的用户：张三
![image44](83e03ab358ed4191b89c23aac6e137b2.png)
同理，在 "Web 前端组" 子组织单位下继续创建用户：李四，在 "Java开发组" 组组织机构下创建两个用户：王五、赵六。结果如下：
Web 前端组用户：
![image45](249349dc85cf4f17bef4a4d2cf024c42.png)
Java 开发组用户：
![image46](39032b9ff8104c62a378d4161f79306a.png)
创建好上面的域用户账户之后，就可以用来测试登录域的操作。直接到域内任何一台非域控制器的计算机上登录域，例如 Windows Server 2012 成员服务器或已加入域的 Windows 8 计算机。一般用户账户默认无法在域控制器上登录，除非另外开放。
备注：
以上是 Windows Server 2008 AD 域服务器搭建的过程和简介，此过程也适用于 Windows Server 2008 R2 版本的 AD域搭建。此外也可以参考如下博友不同版本的搭建过程：
[Windows Server 2008 R2 AD服务器搭建](https://www.cnblogs.com/sjdn/p/5509885.html)
[Windwos 08R2_DNS全面图文详解](https://blog.csdn.net/jmilk/article/details/51282953)
[Windows 08 R2_创建AD DS域服务(图文详解)](https://yq.aliyun.com/articles/237426)
[Windows Server 2008 R2 配置AD(Active Directory)域控制器(图文教程)](http://www.jb51.net/os/windows/win2008/69883.html)
[Windows Server 2012 R2 创建AD域](https://www.cnblogs.com/wanggege/p/4605678.html)
