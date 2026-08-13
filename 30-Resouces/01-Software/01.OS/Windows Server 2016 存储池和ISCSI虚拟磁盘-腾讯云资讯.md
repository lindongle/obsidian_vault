---
title: Windows Server 2016 存储池和ISCSI虚拟磁盘-腾讯云资讯
updated: 2026-06-06T10:05
created: 2018-06-13T19:02:11
---

上午
已剪辑自: <https://cloud.tencent.com/info/05c2b6e512fb40118121424b3a3c86f0.html>
Windows Server 2016 存储池和ISCSI虚拟磁盘
本文部署存储池，创建虚拟硬盘，新建卷，配置ISCSI目标服务器，将存储虚拟化。这里新建ISCSI虚拟磁盘是和群集故障转移结合，从而达到群集功能。
主题：
- 部署环境
- 先决条件
- 配置存储池
- 创建虚拟硬盘
- 新建卷
- 安装角色
- 配置ISCSI
部署环境 编号 服务器名称 IP地址 操作系统
|    |        |                |                                          |
|-----|---------|-----------------|-------------------------------------------|
| 001 | AD1     | 192.168.100.250 | Windows Server 2016 Datacenter Evaluation |
| 002 | Storage | 192.168.100.252 | Windows Server 2016 Datacenter Evaluation |
先决条件
1、配置AD域控制器，创建AD域  
2、设置IP地址，DNS指向域控制器IP，这里就不多讲了，我只附一张图  

![image1](6621bbe56c824d59ad1afc1fc6d7f2aa.jpg)
3、设置计算机名加域  

![image2](c73226a44076444b81f0d56c43c86314.jpg)
配置存储池
配置存储池需要多块硬盘，在该服务器上打开“服务器管理器”，点击“文件和存储服务器”  

![image3](746fe59751b749a2bd2d2ff62d1e5eb4.jpg)
点击“存储池”  

![image4](875befd5593345df884235251823be12.jpg)
选择“任务”-“新建存储池”  

![image5](cd35df2842f443a986d7b672de4b59a8.jpg)
打开“新建存储池向导”，点击“下一步”  

![image6](798a4eb358894493babdcd068c0aebed.jpg)
配置存储池名称，点击“下一步”  

![image7](f69ec3577f004c9a80b29cd8546b83df.jpg)
选择需要配置到存储池的物理磁盘，点击“下一步”  

![image8](d6c54efd7baa47ddadb05dc18632c93d.jpg)
确认配置，点击“创建”  

![image9](8ffb127d52474f95b71bc2836aa1318f.jpg)
存储池创建完成，点击“关闭”  

![image10](6420ae150c6941548aa2a02f37b22a9f.jpg)
可以看到创建好的存储池  

![image11](ad099e52ac8348d6addf617df6229915.jpg)
创建虚拟硬盘
依然在存储池界面点击虚拟磁盘下的“任务”-“新建虚拟磁盘”  

![image12](5ad64b5122974a11bf0093c66935bfa2.jpg)
选择存储池点击“确定”  

![image13](7e24078d126e4e1bb3191e8ce5dc177c.jpg)
运行“新建虚拟磁盘向导”点击“下一步”  

![image14](21e760af71c6415195cb1785ac747505.jpg)
配置虚拟磁盘名称，点击“下一步”  

![image15](201aec2bd471409b97666095fc270bdf.jpg)
点击“下一步”  

![image16](92732f383899484b826ba5f82ecf045c.jpg)
存储数据布局根据需要选择，其实这里就像在配置RAID一样，选择好了点击“下一步”  

![image17](97abf21deae64ed4a9e66835561749eb.jpg)
设置类型，可以选择“精简”也可以选择“固定”，点击“下一步”  

![image18](ac6c9c06ef1c4616975d8159d9be7be2.jpg)
指定虚拟磁盘大小，点击“下一步”  

![image19](c1721a0445e1459183ba4983ae5bc49d.jpg)
确认配置，点击“创建”  

![image20](98ce261a91c24016abff33b2bc141ce5.jpg)
创建完成，点击“关闭”  

![image21](e36373b24bab42ccb3b46a31410488e1.jpg)
可以看到虚拟磁盘的虚拟磁盘  

![image22](e8e1238b4a2a48ce8313ea49825993fd.jpg)
新建卷
还是在存储池界面中，右击虚拟磁盘的Data磁盘“新建卷”  

![image23](4cf804b34c324e4e889f4c0e77e8dc10.jpg)
运行“新建卷向导”，点击“下一步”  

![image24](47ec9675843f470d976baa61b28e45bd.jpg)
选择服务器和磁盘，点击“下一步”  

![image25](a60f5943dc7f448ebf302fe3acf71a73.jpg)
指定卷大小，点击“下一步”  

![image26](db61f8dddf5647a788d7fc7b839a6946.jpg)
指定卷的驱动器，点击“下一步”  

![image27](804b3dd2a8f64a478bc54618931dc5e2.jpg)
设置文件系统设置，点击“下一步”  

![image28](f411bfda9c5f422cb19a89e59d7241bd.jpg)
确认配置，点击“创建”  

![image29](04d4ae7612314fb6a34ef667b974edeb.jpg)
卷创建完毕，点击“关闭”  

![image30](9371c6ab97c74a52b1fb9e1968992d19.jpg)
安装角色
打开“服务器管理器”，点击“添加角色和功能”  

![image31](29e2370c855d4b149f49248b0bb91601.jpg)
打开“添加角色和功能向导”，点击“下一步”  

![image32](f217ae29e7e0431eb5cb7c052b5963af.jpg)
安装类型选择“基于角色或基于功能的功能”，点击“下一步”  

![image33](6916fa9bd1e342d7b1b8dfc3025fd75c.jpg)
服务器选择“从服务器池中选择服务器”，选中本地服务器，点击“下一步”  

![image34](c2383dc2a8684313a488098ceb19994f.jpg)
服务器角色选择“文件服务器”和“ISCSI目标服务器”，点击“下一步”  

![image35](3cad12e1e8a248518f95946a7d1fe4f9.jpg)
功能这里直接点击“下一步”  

![image36](b4b4f08a3763428794d53051d6f36ea7.jpg)
确认配置，把“如果需要，自动重新启动目标服务器打勾”，不过安装ISCSI目标服务不需要重新启动，服务器点击“安装”  

![image37](2b0ac649805748b6a084aa33f851e8ca.jpg)
角色安装完成，点击“关闭”  

![image38](091201f418dd424b8580e4617961e7f4.jpg)
配置ISCSI
打开“服务器管理器”，点击“文件和存储服务”  

![image39](0bc857205afb4a70adfcbffc7cdbb46c.jpg)
点击“ISCSI”  

![image40](d1e60878f44844ceb818399bd278a893.jpg)
点击“任务”-“新建ISCSI虚拟磁盘”  

![image41](94491bfe3aed4fdeb1d17a61ac320620.jpg)
配置ISCSI虚拟磁盘位置，我们这里选择刚才配置好的F盘，点击“下一步”  

![image42](e8655888aebb46b09f1cacccab2c9f49.jpg)
配置ISCSI虚拟磁盘名称，点击“下一步”  

![image43](9db1a2944dec4c8da523868890eb1f73.jpg)
配置ISCSI虚拟磁盘大小，点击“下一步”  

![image44](a7a7303837d54b66a3597cff2a21656a.jpg)
配置ISCSI目标选择“新建ISCSI目标”，点击“下一步”  

![image45](4b22c58f6ec54474a5f21e8356cd0405.jpg)
配置目标名称，点击“下一步”  

![image46](b79774ae9874440ea18ccca5fabab93d.jpg)
访问服务器，点击“添加”，我们这里选择“输入选定类型的值”，类型为“IP地址”，键入“IP地址值192.168.100.246”，点击“确定”  

![image47](c0f9cf45f62b4424bdf2b6421e9e2298.jpg)
在键入一个“IP地址值192.168.100.247”，点击“确定”  

![image48](d8fb5a6af6654ffdbe05e99038dd2ed8.jpg)
访问服务器设置好了，点击“下一步”  

![image49](a8161356e4574f6bbd7088685dff8b71.jpg)
启用验证服务这里点击“下一步”  

![image50](166e7acb58634a1f8fb0c6e4d733eded.jpg)
确认配置，点击“创建”  

![image51](527642d4ad8042b7a0b2839d2d2b3d71.jpg)
配置完成，点击“关闭”  

![image52](bb58b38fdf8e49bcba89df498b333517.jpg)
配置好后就可以在ISCSI里面看到刚才的配置，这样ISCSI配置就完成了  

![image53](941b26f9c9ba4e1da73354db94e17d43.jpg)
