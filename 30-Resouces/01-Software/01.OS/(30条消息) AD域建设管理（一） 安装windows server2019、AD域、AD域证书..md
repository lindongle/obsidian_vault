---
title: (30条消息) AD域建设管理（一）| 安装windows server2019、AD域、AD域证书...
updated: 2026-06-06T10:05
created: 2022-11-01T02:04:52
---

(30条消息) AD域建设管理（一）\| 安装windows server2019、AD域、AD域证书服务_disabled_fk_csdN的博客-CSDN博客_ad域证书
已剪辑自: <https://blog.csdn.net/qq_33997198/article/details/106056311>
最后更新时间:2020/8/5  
更新说明：1.安装配置了[虚拟机](https://so.csdn.net/so/search?q=%E8%99%9A%E6%8B%9F%E6%9C%BA&spm=1001.2101.3001.7020)、AD域、AD域证书服务，并将域提升为控制器；  
2.简单介绍下AD DS的用户和计算机、ADSI编辑器；
## <span style='color:#2E75B5'>1.环境介绍及前言</span>
虚拟机ip
|                    |                |
|---------------------|-----------------|
| windows server 2019 | 192.168.255.222 |
## <span style='color:#2E75B5'>2.安装配置win server 2019虚拟机</span>
步骤1：VMware操作(蛮简单的)
1.  用VMware\>新建虚拟机\>典型\>稍后安装系统\>Windows Server 2016\>虚拟机名称位置(修改下)\>容量(默认)\>完成;
2.  编辑虚拟机设置\>CD/DVD(SATA)\>使用镜像文件(server 2019镜像)\>确定\>开启虚拟机傻瓜安装不要怂;  
    步骤1：不输入秘钥不激活\>下一步  
    **注意点**：
![image1](725b91a7d83f4c86bc02a4bde641c027.png)
步骤2：注意选择\*\*Standard(桌面体验)\*\*版本  
点击下一步,等待安装完成即可
![image2](f31e229405194584b08be7706f56f704.png)
步骤3：使用Sysprep清理计算机，记得勾选通用选项
- **怎么找到Sysprep？**
进到windows server 2019虚拟机；  
在C:\Windows\System32\Sysprep目录下找到Sysprep工具；
![image3](5f50c0a161624d6aba96f2f6eed7b456.png)
- **清理完成后该怎么做？**
重启后遇到输入产品秘钥点左下角以后再说，设置管理员Administrator密码进入系统；
步骤4：虚拟机配置静态IP，DNS指向127.0.0.1(自己)
1.  进入系统后初始化的配置如下：
![image4](39dfd2a7804045c9b7e3f3598062de67.png)
2.  配置静态IP：192.168.255.223
3.  DNS指向127.0.0.1(自己)
![image5](c34c81906a84486982e1439d349bd9e1.png)
步骤5：修改计算机名为RAN-MAIN，然后自动重启
![image6](f21df39d9a394b228f1e2e96615c6ff4.png)
重启后生效：
![image7](6a8c27f0b75a442a89888d43659c3983.png)
## <span style='color:#2E75B5'>3.安装AD域服务、AD证书服务</span>
1.  安装AD域服务，并将主机升级为域控主机;
2.  安装AD域证书服务并配置生成秘钥；
### <span style='color:#5B9BD5'>3.1.安装AD域服务</span>
步骤1：服务器管理器\>管理\>添加角色和功能
![image7](6a8c27f0b75a442a89888d43659c3983.png)
步骤2：确认服务器所需配置
- 管理员账户强密码
- 配置静态IP
每次安装新的服务都需要这么操作，可以勾选默认跳过此页\>下一步
![image8](8ebe0c551ac64cbc925d5f7de08f9568.png)
步骤3：安装类型\>默认\>下一步
![image9](0d20ae340e0b4fa08cab1bcb3d32a167.png)
步骤4：选择目标服务器\>默认\>下一步
![image10](f57a0c8c9936470fadeb30989e871f2f.png)
步骤5：**选择服务器角色**\>勾选所需服务\>下一步
1.  AD域服务——**必选**
2.  AD联合身份验证服务——可以先不选择安装(不勾选)
3.  后面检查发现AD证书服务已经安装不能安装AD域！！！(因此这里先不安装证书服务)
![image11](83aae174552a4625959ef69b58742abf.png)
步骤6：默认跳过\>下一步
![image12](68a80e5b51224c85aeea90b878b793b5.png)
步骤7：介绍AD DS\>下一步
![image13](0ef2b2143506467b92827cc5e4879fea.png)
步骤8：勾选允许重启服务器\>安装
![image14](3474a960fcec41e28319098189b406aa.png)
### <span style='color:#5B9BD5'>3.2.配置AD域服务(将此服务器提升为域控制器)</span>
步骤1：添加新林\>根域名 randolph.com\>下一步  
填写根域名，可以先了解下命名规范： [Active Directory 中计算机、域、站点和 OU 的命名约定](https://support.microsoft.com/zh-cn/help/909264/naming-conventions-in-active-directory-for-computers-domains-sites-and)
![image15](10dd4d4adaa447db86f1219839defcf0.png)
步骤2：输入密码\>下一步
![image16](f19ce6be61dc496e99258894c91a9356.png)
步骤3：默认\>下一步
![image17](5dfe60bee882491d936aa8f67d329db4.png)
步骤4：默认\>下一步
![image18](8819e8a490d04632aa2f61dd2e45ea80.png)
步骤5：默认\>下一步
![image19](d42a6b5b41004671b370df8f27d2e354.png)
步骤6：检查选项\>下一步
![image20](f09c235a490440e3bea1653f3007faec.png)
步骤7：先决条件检查\>下一步
![image21](b94030c21bad4ffaa593872b217c45ba.png)
步骤8：安装重启，服务器就变成了域控制器了
![image22](bccd230402c049038d8a9469766ba3d5.png)
### <span style='color:#5B9BD5'>3.3.安装AD域证书服务</span>
重复的步骤在3.1中已经写到，这里只标出需要注意的地方
步骤1：选择AD证书服务\>下一步
![image23](40844cdb27ac4d228dd71c536bb345b0.png)
步骤2：AD证书服务简介\>下一步
![image24](b59bfcfb366041418d50daa9668d38c3.png)
步骤3：默认证书颁发机构\>下一步
![image25](bf63d8ff37f0404abac3493122466e1e.png)
步骤4：勾选允许重启服务器\>点击安装即可
![image26](dc8459918e554ecf925e6c93c46a340b.png)
### <span style='color:#5B9BD5'>3.4.配置AD域证书服务</span>
步骤1：检查需要配置AD证书服务
![image27](d553e51a6d624f10a6b4c0146f938ede.png)
步骤2：默认凭据\>下一步
![image28](b2632e4e330e4541978529ae0abacb8e.png)
步骤3：默认证书颁发机构\>下一步
![image29](c29db9d41b874851a9fbcece05826ff2.png)
步骤4：默认企业CA\>下一步
![image30](fcaf624d0f4e4b5c996c174e0dc9cec1.png)
步骤5：默认根CA\>下一步
![image31](f2a7d07862454a3dbf7a046d0261a947.png)
步骤6：默认创建新的私钥\>下一步
![image32](3099381299ab4559a94c5fc3424aa6b8.png)
步骤7：默认加密算法\>勾选允许管理员交互\>下一步
![image33](4d9e371789fd4b4ea4fbfc0d4af8ba62.png)
步骤8：全部默认\>下一步
![image34](85701c128d7542c8a2e78028e797b506.png)
步骤9：默认证书有效期5年\>下一步
![image35](ff2e7c4e9750451fbbaf346c90e36446.png)
步骤10：默认数据库位置\>下一步
![image36](bc577231d21c404582513dfc635bf12c.png)
步骤11：检查636端口连通性：没配置好之前，不可连通（我自己测试下的，不需要做）  
还没配置好证书服务之前：  
**日志**：
2020-05-18 15:47:01,139 INFO localAD.py 52 username:CN=Administrator,CN=Users,DC=randolph,DC=com res: True
- 1
结论：636端口不可以访问
![image37](f5f53f49caa64f5b8fd9b38bf4c8cf55.png)
步骤12：点击配置即可
![image38](74d5a95dad994193982502aa987e9dda.png)
步骤13：配置成功\>关闭
![image39](19d8905b4ba04645b0d70e633337d1a0.png)
步骤14：检查636端口连通性（我自己测试下的，不需要做）  
**日志**：
2020-05-18 16:01:02,819 INFO localAD.py 52 username:CN=Administrator,CN=Users,DC=randolph,DC=com res: True  
安装完成后，测试是可以636端口访问的，这样就可以用LDAP3远程批量修改密码了。
- 1
- 2
## <span style='color:#2E75B5'>4.AD DS的用户和计算机、ADSI编辑器</span>
### <span style='color:#5B9BD5'>4.1.AD DS的用户和计算机</span>
服务器管理器\>AD DS\>右键\>Actice Directory用户和计算机
![image40](c6d1617a3135439685109d3978bf6a36.png)
记得点击查看\>勾选高级功能
![image41](2344267de6484dc5b82c1ccf22c70532.png)
### <span style='color:#5B9BD5'>4.2.ADSI编辑器</span>
打开方式上小结可以看到\>更多操作\>连接到\>直接确定默认即可
![image42](d9fac2fd85bf4615b47fbfcf5761234c.png)
之后我们用程序管理AD域账号的效果都将在这里呈现
![image43](01dcf231402c4a56a79e120f33fc1c5e.png)
2022年11月1日
2:04
