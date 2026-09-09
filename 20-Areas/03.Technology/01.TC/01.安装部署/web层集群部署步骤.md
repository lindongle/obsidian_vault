---
title: web层集群部署步骤
updated: 2026-06-06T10:08
created: 2019-03-25T11:06:48
tags:
  - TC安装部署
---

1、服务器
10.2.1.32 主机名 plmwebproxy 代理服务器 端口号8080
10.2.1.31 主机名 Teamcentertest PLMWEB01服务器 端口号7002
10.2.1.31 主机名 Teamcentertest ADMINServer服务器 端口号7001
10.2.1.32 主机名plmwebproxy plmweb2 PLMWEB02服务器 端口号7003
集群域名均为plmwebcluster
**31和32上创建域名时尽量使用一样的名称（减少后续配置）**
31上
![image1](283a4c5db4454a7b83fc7c88ec7fd747.png)

![image2](e6bb7f0e66754b66ab19fe019b0d15ca.png)

![image3](1ad3c3e183ec4932bb97c8ea4af1e244.png)

![image4](1abf491dc48d482a8dd34cbc2793a047.png)

![image5](eddfb692e1f5478dbaa2c7460b47d241.png)

![image6](470682ce94af4d41a2cb4b70b2ff4797.png)

![image7](2bed702bbadc4966ac0a1d10a589a120.png)
下图左侧为入口服务器，左边放代理端，后侧添加受控端。
![image8](80926c9b81714ea4882af9b4b9021b25.png)

![image9](4415ba060def4f92bab9233034105296.png)

![image10](6af52df174b14c56994e875ac9030761.png)
即01和adminserver在31上，02和Proxy在32上。
![image11](0a2132873903470b8d750946ccc4c788.png)

完成后，必须重启该服务器。
31上
启动weblogic服务
进入IE-weblogic控制台。
![image12](ec0059cdd20a45488f8509da92aa163b.png)
CMD中运行：D:\Oracle\Middleware\Oracle_Home\user_projects\domains\plmweb\bin\startManagedWebLogic.cmd plmweb01 <http://10.2.1.31:7001> 将plmweb01在主控服务上启动。
![image13](e19e9ad48a7748fdbfcc3cd0c13047a9.png)
启动后效果如下：
![image14](b1bfb77b374e43048c482bdfe027a20b.png)

32上
1）创建域，域名plmweb02，不用勾选任何东西，一直下一步完成。
2）将主控服务器上D:\Oracle\Middleware\Oracle_Home\user_projects\domains\plmweb\security\SerializedSystemIni.dat这个文件，覆盖到受控服务器的对应目录。
3）cmd中运行以下命令。
D:\Oracle\Middleware\Oracle_Home\user_projects\domains\plmweb02\bin\startManagedWebLogic.cmd plmweb02 <http://10.2.1.31:7001> 和D:\Oracle\Middleware\Oracle_Home\user_projects\domains\plmweb02\bin\startManagedWebLogic.cmd plmwebproxy <http://10.2.1.31:7001> 分别将服务plmweb02和plmwebProxy启动。记得输入用户名和密码。
注：
如果域是生产模式，启动受管服务器时，提示输入用户和密码：

Enter username to boot WebLogic server: weblogic

Enter password to boot WebLogic server: daphne123

解决方法，在每个受管服务器目录下配置用户验证。

cd /domains/base_domain/servers/proxy_Server_1

新建文件夹

\# mkdir security

\# vi boot.properties

username=weblogic

password=weblogic123

![image15](b543c95d23de400c89dc6cb7e6b4995e.png)

![image16](8416ecfc6d344b0f97e5ea729c489218.png)
启动完成后，在31上查看状态
![image17](e9cd8280f71b43c0910cf8e2fe32a75a.png)

点击plmwebproxy，修改设置，检查是否为本地服务（**不要选择集群，要保持集群为空，否则会出现每次四层登录两个web服务都会出现实例**）。
![image18](e444ecc278734ae5b0669d6ae3a35bc4.png)
部署TC.war包
在31上，锁定及编辑--部署-安装-选择tc.war包。下面勾选集群中的所有服务器。

![image19](8870dae51fca4f2daab66dc74876ca72.png)
修改web层参数
与weblogic中集群名字一致。
![image20](89fc1dbb5be64062aaa7d430a81e548c.png)

![image21](480344baae1f4f60886df0946b249677.png)
添加以下模块，并重新安装解决方案。
![image22](d5e0a6b554ac4be4a5c9a20bb24dbc67.png)
修改后重新生成下tc.war包，关闭所有连接tc.war的weblogic链接，在weblogic中删除掉tc.war，重新安装。安装后记得启动tc.war服务。以下两个都要启动。
![image23](5fa4751a3a9b4ddb9c6c706ee1744afb.png)
修改分发实例参数
只写第一行代理服务器即可，可以自动分配，可以都配置上，让用户登录时手动选择。
<span style='color:red'>注：各个接口使用的四层地址使用proxy对应的IP及端口号，如http://10.2.1.32:8080/tc，而不是7001</span>
![image24](b0107d4d303346509b25e490f1f37c49.png)

![image25](bbb1febddaa044d09d7c249c2db2fd5b.png)
31上修改
修改pool池对等服务器：
D:\Siemens\Teamcenter11\pool_manager\confs\config1\TreeCacheTCP.xml，将下面的主机或ip改为32服务器的主机名或IP。在32服务器的对应位置，加上这31这个服务器的主机名或ip。并将集群名字改成跟weblogic集群名字一致。
或在安装J2EE时，调整以下的IP地址。
![image26](377cb398920d415589efd7dc45e53bc1.png)

在tem安装32的J2EE时，必须要修改下PoolID。或安装或在配置文件中修改。或修改config安装配置文件tem中刷一遍。
![image27](1bc02c9d0f474e599a979561ac57faf8.png)

**验证结果：**
1、登录四个用户，PoolA和poolB一边两个。
2、关闭PoolA，原在PoolA上的客户端无法立即切换到PoolB，等一会儿会自动指派服务器可以正常连接到PoolB。
3、关闭Admin服务或代理服务，无法切换，直接无法使用。如果代理服务器宕机，可以在登录时手动选择一台Pool服务。
4、关闭A的weblogic，原A的TC客户端会提示已自动指派新的服务器，会切换到PoolB上，但PoolA上还会存在。再关闭PoolA服务，也没有问题。同时关闭A的weblogic和PoolA服务，与单独关闭PoolA服务效果一样。
<span style='color:red'>**5、四层地址为10.2.1.32:8080/tc，而不是7001**</span>
