---
title: windows企业层连接Linux卷服务的两种方式
updated: 2026-09-02T16:30:04
created: 2026-07-05T17:04:38
tags:
  - TC安装部署
---

方式一：
1）使用Linux创建volume路径，通过samba的方式共享出来。
2）在windows上访问Linux共享，并映射为永久磁盘映射。
3）在windows上安装企业层时，路径选择磁盘映射的路径。
方式二：
1）在Linux安装卷服务时，同时安装企业层，创建出volume文件夹。设置主FSC服务。
2）在windows上安装企业层和FSC服务，设置为非主FSC，父FCC增加Linux上配置的主FSC地址，优先级设置为最高。
![image1](ee2c58a9d26d4e43b5521f3382623337.png)
3）在Linux上更新FSCMaster。添加windows上创建的非主FSC服务。
![image2](85423cabfe4c4b42921d9966a574fbec.jpg)
![image3](7727082d5c5b4903809c29ca0de17e49.jpg)
![image4](f2ac47ea41914be1be500267b1f2a328.jpg)
![image5](9f0b0809699746c7ab84724162903635.jpg)

即通过FSC服务区访问Linux上的volume，而不是直接访问。其中Linux创建的tcdata无实际作用。
方式三，Linux安装企业层及卷服务器，选择路径，正常安装。然后使用windows上只安装企业层，不装卷服务器和FSC，创建tcdata时使用--使用现有数据库创建数据目录，然后FSC输入Linux上主FSC的地址即可。
