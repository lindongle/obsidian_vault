---
title: 三、Linux访问windows共享目录
updated: 2026-06-06T10:08:57
created: 2026-07-05T17:04:57
---

三、Linux访问windows共享目录
2018年11月16日
0:15
配置Windows共享（在10.2.1.6上）
1、添加NFS服务
![image1](0538c7e4a94e498db6008d882e9c365e.png)

![image2](04e3b29557174a469456726220725853.png)
2、新建NFS共享目录
1）在windows服务器管理器中，选择文件和存储服务，然后选择共享，
![image3](0537c7da08b848adada73a40ef0afa85.png)

![image4](80930f1172264f9d8a1fd51e4a826403.png)
2）选择NFS共享-快速，下一步。
![image5](f8617633061c4ebb838b64ceb61f972a.png)
3）选择自定义路径，路径选择要共享给Linux的文件夹，点击下一步。
![image6](4b781afa0a8b45d7b2873b6fa5779e3e.png)
4）默认，直接下一步。
![image7](6702cabec6e34cf0915911e065edd327.png)
5）勾选验证方式，下图所示。下一步。
![image8](82be56869958444a9f8886ed3b706a92.png)
6）点击添加，权限选择所有计算机，无访问权限，添加添加，再点击添加，选择Host，输入10.0.1.51，即能访问此共享的计算机IP，权限设置为只读，勾选允许root访问。点击添加。
![image9](a81b4300adfc402ea81dd09611d25482.png)

![image10](34b098e242404d2bae8a5663fe7a0c82.png)
7）点击下一步，点击创建。完成。
![image11](33b57b2712d34951a0d05a1cfe516cd3.png)

![image12](442d14c2fec746f0b79f8f98ca3473a7.png)
~~2、查看Linux共享目录~~
~~cmd中运行~~
~~C:\Windows\system32\>showmount -e 10.0.1.51~~
~~Exports list on 10.0.1.51:~~
~~/plmdata/plmdatabackup_temp/~~
~~volume_database_temp 10.2.1.7~~
~~/plmdata/plmdatabackup_temp/~~
~~tcdata_bmideproject_temp 10.2.1.6~~
~~3、新建网络映射，网络地址输入以下内容，映射为X盘~~
~~10.0.1.51:/plmdata/plmdatabackup_temp/tcdata_bmideproject_temp~~
3、Linux中挂在windows刚创建的共享目录。（在10.0.1.51上）
\[root@PLMResource1 ~\]# mount -t nfs 10.2.1.6:/tcdata_bmideproject_temp /plmdata/plmdatabackup_temp/tcdata_bmideproject_temp
mount -t nfs 10.2.1.6:/tcdata_bmideproject_temp /plmdata/plmdatabackup_temp/tcdata_bmideproject_temp
4、设置开机挂载。
\[root@PLMResource1 ~\]# mount -t nfs 10.2.1.6:/tcdata_bmideproject_temp /plmdata/plmdatabackup_temp/tcdata_bmideproject_temp
\[root@PLMResource1 ~\]# vi /etc/fstab
打开的文件中输入以下内容，保存退出。
mount -t nfs 10.2.1.6:/tcdata_bmideproject_temp /plmdata/plmdatabackup_temp/tcdata_bmideproject_temp nfs defaults 0 0
