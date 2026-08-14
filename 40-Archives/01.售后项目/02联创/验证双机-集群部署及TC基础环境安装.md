---
title: 验证双机-集群部署及TC基础环境安装
updated: 2026-06-13T22:07:03
created: 2026-07-05T17:04:57
tags:
  - 联创
---

架构：
1、域控服务器（license服务器、企业层服务器、共享存储共用）
主机名：JJDomain
IP:172.16.254.200
DNS:172.16.254.200
adminitrator密码pdm_1234
Plm/Infodbapdm,1234（忘记切换了）
2、PLM01
IP:172.16.254.201
心跳IP:172.1.1.10
主机名：PLMSource1
集群IP：172.16.254.220
<span style='color:red'>集群名称：PLMSource</span>
Administrator密码123
Infodba/pdm_1234
3、PLM02
IP:172.16.254.202
心跳IP：172.1.1.20
主机名：PLMSource2
Administrator密码123
Infodba/pdm_1234

正式环境以下PLMFMS命名 改为PLMFSC，群集名称改为PLMSource

集群角色PLMORA虚拟资源IP:172.16.254.203，名称PLMOracle_IP
集群角色PLMFMS虚拟资源IP:172.16.254.204,名称PLMFMS_IP，正式环境更改为PLMFSC_IP

集群磁盘命名
![image1](307b2a7b552e4bbbac5a536ecd55e529.png)

安装：
**一、安装域控服务器、添加用户PLM--略**
1）部署域控环境-略
<span style='color:#BFBFBF'>3）创建共享磁盘（仲裁盘1G，共享盘2\*2G）</span>
2）安装starwind软件，新建Server，新建Target，新建虚拟磁盘（仲裁盘、oracledata共享盘、FMSVolume共享盘）--正式环境，有存储，此过程不需要。
StarWind 模仿 iSCSI 进行网络存储管理
![image2](5d925e19f7db476b989b2730540b70b7.png)

<span style='color:red'>如果两台同时连接，则添加target时，必须勾选允许多路径交互连接（集群）。否则只能连接一台，除非一台关机。</span>
**二、PLM01**
1）加域，并将登陆账号添加本地Administrators组（登陆本地Administrator添加，需登陆域管理员）
2）配置IP及心跳线，心跳线，DNC去注册、禁用NETBOIS，修改手动全工为1G全工。
![image3](d2e6712960cf4b0f9d63aa24248cebd6.png)

![image4](5463fb8720da47d79fa1d711b280e5b0.png)

![image5](f1a7644494bb4d6e827bfbb9b8a1b04a.png)

![image6](be1b15d846a14859b1c22e062f256a90.png)

![image7](358c0f95770f49d09f496f7d326234b4.png)
3）使用管理工具-iSCSI 发起程序，添加虚拟磁盘，会自动启动ISCSI服务，并自动设为自动。
StarWind 模仿 iSCSI 进行网络存储管理
4）进入计算机管理-磁盘管理，选中网络存储并联机、初始化、新建卷、格式化。
![image8](f1331bc626e74986b99d8ffa6b1b3df6.png)
5）添加角色-添加故障转移集群
**三、PLM02**
按照2执行。

四、PLM01或PLM02选一个设置就行。另一个同步。
**1、集群配置验证**
（选择两台PLMSource1和PLMSource2），会验证共享磁盘自动脱机与联机。
**2、创建集群**
![image9](a6320738e30a4caaa2b523a7dbd316b1.png)

![image10](b59e99b64e184481a34c29cf9f564971.png)
**3、集群移动验证**
断网是否自动切换
4、指派仲裁盘，默认会把最小的共享磁盘指派为仲裁磁盘
![image11](f9f9d597d2ba46f2857089691af1e7af.png)
5、集群中添加角色。
先将节点2停止集群服务，会自动将共享磁盘连接到节点1.
![image12](b3223399c8094f3e88b62631ad2a7475.png)

选中角色，右键添加空角色。优先级都设置为高
选中创建的空角色，右键属性，修改角色名称为PLMORA。
选中创建的角色，右键添加存储，选择PLMOracleDataDisk这个磁盘。
选中创建的角色，右键添加虚拟IP ，双击添加的IP资源，编辑。
![image13](4c4747e26c1b4b10ba96247bb08f5b2b.png)

![image14](bdb12836726f48ba85013d7a4536eaa0.png)
依赖关系选择添加的磁盘存储
![image15](31d74a25bf624330be70e37b51ae09ce.png)

五、PLM01安装软件
1、安装oracle
**1）oracle软件，两个节点可以一块安装，数据库必须分开顺序创建**
2）创建监听、创建数据库（TC数据库脚本,保证25G以上空闲空间）（两台都安装，oracledata放到共享磁盘中，软件放本地，路径保持一模一样，停止节点2集群服务。
3）创建时使用自动共享内存方式，后面可以根据情况调整SGA/PGA参数。
![image16](868ca0b9bc0e4258ab1c91e559c6a40b.png)

![image17](b7e3f44d09b843e0bc151fdd4dc71cae.png)

![image18](f8aa88b29ff6470cba667f69683796af.png)
4）IP地址选择角色PLMORA的虚拟IP 172.16.254.203。--确保PLMORA角色正常运行。
5）对监听添加数据库服务。
将oracle的dnsname.ora与listener.ora文件中的PLMSource1@dias.com.cn改为虚拟IP地址172.16.254.203。oracle监听及数据库服务改为手动。并顺序重启一遍监听服务、数据库服务。
6）设置数据库密码永不过期。--使用system登录sqlplus。
六、PLM02安装软件
**将节点1停止集群服务，节点2启动器群服务。并确保PLMORA角色启动。**
![image19](f4fdccff4d004e46a8f64f4481ffe5d2.png)

![image20](3b04772308fd47bc94715245eda2209a.png)
**1、重命名PLMOracleData盘中的oracledata文件夹。如加_bak**
2、安装oracle，创建监听、数据库、配置本地连接、修改监听及连接ora文件、添加数据库服务到监听、重启监听、重启数据库服务、将服务自动改为手动，修改密码永不过期。路径选择，尤其oracledata要跟PLM01完全一致，其他配置参考节点1。
七、添加oracle服务到角色PLMORA。
3、向角色中添加oracle监听及数据库服务，配置依赖
![image21](ef597fe036e64e0aa1260e9fc4d077d3.png)

![image22](8bd86fe48b1d41739dd2cc9871d19a4f.png)
4、测试，将节点1集群服务停止，oracle两个服务会自动停止。将节点1集群服务开启，节点2集群服务停止，则节点1上oracle服务按照依赖关系顺序启动。

七、安装卷服务器
跟oracle安装方式一致，装完修改mastserfms配置文件，主机改为PLMFMS角色的虚拟IP 172.16.254.204。装完手动停止服务。再切换到另一节点一样路径一样配置。
<span style='color:red'>1）安装介质不能使用VMware共享方式，因为域环境下，管理员权限不识别网络磁盘，需要拷贝到每个服务器的本地磁盘中。</span>
<span style='color:red'>2）FSC ID统一命名为FSC_TC_infodba</span>
![image23](291ce6336a274b48addac670e03dc2e1.png)

![image24](0d7b74af532e448097a813629dff105a.png)
3）改FSC服务为手动。
八、集群管理器-角色，选择PLMFMS，添加资源-通用服务，选择FSC服务。右键添加的FSC，联机，右键属性，设置依赖于PLMFMS_IP及对应共享磁盘存储PLMFMSVOLUME。
![image25](c9b2c67bcfda46d59bea92cf18cd5ad1.png)
九、修改fscmaster的xml文件，改为PLMFMS的虚拟ip地址172.16.254.204，两台都要改，改后均重启FSC服务。
修改xml文件可能提示拒绝访问，对整个Teamcenter11文件夹做如下配置。
![image26](bb369261f2044cd1ba7f974a31e9f29b.png)

十、安装企业层、客户端、BMIDE、J2EE等
<span style='color:red'>先安装vc_redist.x64.exe 2015 否则安装vis可能报错</span>
<span style='color:red'>安装过程不要移动集群角色的节点，保存集群服务一直不动。</span>
<span style='color:red'>按照联创测试环境中的模块安装的所有模块（BMIDE模板也是），尽量1、先安装企业层（去掉文件服务-FSC cache的勾选）及2层客户端。2、打补丁后再安装其他的。3、最后安装安全服务。</span>
![image27](27a1ef5baccf464c980e0267f4cda21a.png)
<span style='color:black'>安装选择项：</span>
[configuration.xml](554721046c0f4a8fb4abb0dfd833e362.xml)
<span style='color:red'>安装J2EE时，选择的FSCid**==不要==**跟卷服务器的FSCID一样，否则企业层FSC无法启动，且不会产生临时卷信息，查看器查看数据集无法查看。默认即可。下图为示例</span>
![image28](25216e2309c2424ba2f90da31a664fe6.png)
<span style='color:red'>注：FSCID填写pool池fscid（非主FSC）,不能和主FSCid一样。**下面地址填写非主FSC服务的地址**</span>

![image29](d3afbb3f5c074734b143b179af5f6d31.png)

<span style='color:red'>**目录将共享映射为网络磁盘。不要用\\**</span>

![image30](dbfd2205e5614f758e20f8d0ed5f6ab8.png)

![image31](193c22a3cf28424c8e4669b1b335dcb4.png)

![image32](6f9f80f1bdbf4395ac51f363bfc24dcc.png)

![image33](f0d27c52e3904fc0a1820c0cd57cd6c3.png)
<span style='color:red'>安装完成企业服务器后，将节点1的FSCmaster配置文件复制更新到节点2的对应位置并覆盖，重启节点2的FSC服务（确保PLMFSC角色所有权在节点1的时候进行覆盖更新重启fsc服务）。</span>
\<volume id="00eb5b1f05a58fe32efe" enterpriseid="-1880936706" root="\\172.16.254.204\G\$\plmvolume" priority="0" /\>
\</fsc\>
![image34](8c21cc339a1c4b5d8767878fc787bbe9.png)
«span style='color:red'»  
安装完成J2EE后，将企业层中的FSCmaster配置文件中的fscid信息复制到卷服务器的FSCMATSTER配置文件，两个卷服务器均要更新。更新完重启两个节点FSC服务。«/span»
中间错误及解决：
Executing \["bmide_setupknowledgebase.bat" -u=infodba -p=\*\*\*\*\* -g=dba -regen=false\]
Output from command: "bmide_setupknowledgebase.bat" -u=infodba -p=\*\*\*\*\* -g=dba -regen=false
----------------------------------------------------------------------------
Verifying Teamcenter environment setup...
Verifying the inputs...
Starting to build model from consolidated file...
Starting to generate CLIPS rules file...
CLIPS rules file is generated at : C:\Users\ADMINI~1\AppData\Local\Temp\84a5b4c8_163e_fc03_565a_c10fec826564\rules.clp
Starting to upload the CLIPS rules file into database...

\*\*\*\*\*

ifail (14112) Unable to create file %1\$s
原因：安装过程中手贱，移动了fsc角色节点到另一台服务器上了，切换回来，点击重试即可。

数据集查看无法查看。
Caused by: com.teamcenter.fms.util.FMSException: 没有企业可用的路由："-1881236135", transientvolume: "2a132ec7946d1bf3723d55584841d719"
注意：这通常是配置问题，其中未使用正确的卷/会话 ID 更新 FMS 主配置（需要 FMS 重新启动）。
这还可能是因为多站点配置缺少关于给定企业的信息。
原因：卷服务FSCid（主FSC）和pool池fscid(非主FSC)弄成了相同，导致pool池fsc服务无法启动。
解决：1、用backup info命令导出卷信息，添加临时卷信息到主FSC的master配置文件。出现以下错误。
![image35](13e98db680414b9ba1227fee141598ca.png)
找不到文件，2a132ec7946d1bf3723d55584841d719(C:\\Temp\\transientVolume_infodba)5b1fc677000013900000510a.vvi（GUID 为
2、在企业层上tem勾掉FSC cache，同时自动勾掉J2EE，并会自动删除dispatcher中安装的转换模块。重新安装这两个，FSCid设置成不一样。
然后将非主FSCid和非主FSC服务所在的地址添加到主FSCmaster配置文件中，并把临时卷信息放到非主FSCid下面，重启两遍FSC服务。
![image36](6f21ac94dfd8469b9a4babef44a2ea1d.png)

[FSC_PoolA_Administrator.xml](062aa2eea209413585725d009326dad8.xml)

[fmsmaster_FSC_PoolA_Administrator.xml](0a02e9512c704475bcc420ba36b30dc4.xml)
下图可以写多个，主的或非主的FSC配置信息，一个无法启动自动切换到另一个。
![image37](76741298817f4ce5baf7e835b7e0f48c.png)

**附件说明：**
1、磁盘扩展
共享磁盘空间不够后，可以在starwind中，选中磁盘右键进行扩展。
![image38](0965df2b53dc49738a01472393b0041d.png)
然后进入故障转移集群管理器，找到磁盘，选中右键脱机，然后在联机即可。
![image39](a69857807a704ec3b86516b5c8e030e5.png)
然后到节点1上，磁盘管理，选中磁盘右键扩展卷。
![image40](906df48d6c4e4eec9e3f52725442c235.png)

验证：
1、登录TC
2、将其中一台source服务器关机
3、oracle及fsc服务会自动飘到另一台，但由于oracle数据库服务启动太慢，导致Teamcenter需要重新登录才可以
4、新建数据集提示一下问题，但是能建成功。
![image41](6c5fe16a703e4daba232ff02d6c5e553.png)

![image42](5a5de4aa46714fb4b07fcee7911b38e7.png)
节点2的fscmaster配置文件中没有更新volumeid信息，从节点1对应位置将fscmaster配置文件复制并覆盖过来，重启节点2FSC服务。
![image43](6ff1e8e5dbe9467587d87bf65c9710b5.png)
