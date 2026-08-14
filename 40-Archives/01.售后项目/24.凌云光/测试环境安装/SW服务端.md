---
title: SW服务端
updated: 2026-06-06T10:09:05
created: 2026-07-05T17:05:04
---

添加SWIM功能；
![image1](f5475579d0da4149bd3977ef1b1c610a.png)

![image2](01cab9ee8d6447e78909ebfb17a6c37b.png)
安装JT转换器（客户端转换的，需要客户端配置）
![image3](4d439c0046904f58be0c246f70b99538.png)

![image4](52a732ec2466450eb963a5bf77255fd3.png)
AWC配置（安装MCAD Intergration才可以出现AWC从SW打开的菜单）
![image5](e5e49ecccfd84497af88348ea9fed7b5.png)

![image6](e4ae923bcdb64b4c85f1c82cde2c5737.png)

首选项配置：
FLColumnCatIVFSeparatorPref= -
ActiveWorkspaceHosting.SW2.URL= <http://TCQAS:3000/awc>
AWC_SWIM_OpenSupportedTypes = Item, ItemRevision, SWAsm, SWPrt, SWDrw（默认，需增加时可配置）
![image7](958e0ca1e4ee4505b4e6da681ce21d9a.png)

![image8](594fe92db957426fa6155ec1a6953d41.png)

Swim.xml配置
1.  配置种子文件：
    1.  ![image9](a74e01b8f0c145a98e2419d8054b50be.png)
2.  配置属性映射
    1.  ![image10](9fe572451ebd4f4c965d2ba737d80d2d.png)
3.  配置JT转换/PDF转换/STEP转换
![image11](1078659c79174ce39d6950829d8a2f6f.png)
Swim.properties配置
修改配置文件，将以下两个注释放开，第一个设置为true
![image12](09b3f179ece34d1ea10f89a6ddce52b1.png)
**上述配置管理文件统一维护配置：**
Swim.xml与Swim.properties统一控制：
1\. 创建ItemID = SW2_Properties及SW2_XML 的Item。初始Item版本由 Teamcenter 自动创建。随着设置的更改，Item可能会被修改任意次数，并且集成将始终从最新的可用修订版中查找和检索文件
2\. 在Item版本下，创建名为 SW2_Properties 的 SOLIDWORKS 集成设置类型的数据集（从数据集名称中删除 /{RevisionID} 扩展名）。
3\. 导入 swim.properties 及swim.xml文件作为数据集的命名引用。
4\. 建议用户重新启动其会话，以使用 swim.properties及swim.xml的托管副本

修改首选项：ActiveWorkspaceHosting.SW2.URL=http://tcqas.lusterinc.com:8080/awc
