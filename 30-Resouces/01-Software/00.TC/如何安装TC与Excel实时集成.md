---
title: 如何安装TC与Excel实时集成
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:04:52
tags:
  - TC
---

如何安装TC与Excel实时集成
2020年2月25日
0:07

## 如何安装TC与Excel实时集成 
![image1](d1c65efc0e3f4f5bbd0312be955175ba.gif)
«span style='font-weight:bold;background: \#59C3F9'»作者：陈嘉颖 审校：陈泓希«/span»
**适用版本：Teamcenter11.3**

在Teamcenter结构管理器里导出BOM结构可以使用静态导出到EXCEL也可以使用实时集成导出的EXCEL，但是使用实时集成需要安装模块后才能使用。

![image2](de754c4d8bac4f4d8b147d2257a6bbde.png)
**操 作 步 骤**
![image2](de754c4d8bac4f4d8b147d2257a6bbde.png)
![image3](ba1975cd434943ca8a86100eb9c84a16.png)
在此路径下创建名为“TcExt”的文件夹
![image4](396cb931cc6e47daa248adfceee745b0.png)
**图1**
![image3](ba1975cd434943ca8a86100eb9c84a16.png)
在这个目录中创建两个名为“tc”和“additional_applications”的子文件夹。
![image5](871c6419aa9244ad9d47feb34ea1072d.png)
**图2**
![image3](ba1975cd434943ca8a86100eb9c84a16.png)
复制原始介质中的OFFICE集成模块安装包
![image6](05427adc0e9d490b818c4ad61911a6fd.jpg)
**图3**
![image3](ba1975cd434943ca8a86100eb9c84a16.png)
用版本补丁包中的的安装工具替换原始介质的安装工具
![image7](6421ab7912a9459bb231a8fac68c0da4.png)
**图4**
![image3](ba1975cd434943ca8a86100eb9c84a16.png)
将原始介质里的“office_ext.zip”文件解压到刚刚创建的tc文件中。
![image8](1e0086456b15460b9c6c734e6af62291.png)
**图5**
![image3](ba1975cd434943ca8a86100eb9c84a16.png)
将补丁介质里的“office_ext.zip”文件解压到刚刚创建的tc文件中
![image9](5c03871e24fd467aab4d690f81d2eaba.png)
**图6**
![image3](ba1975cd434943ca8a86100eb9c84a16.png)
替换覆盖安装介质的内容
![image10](e634dfab3d224bd28a1dcf210cebd7e0.png)
**图7**
![image3](ba1975cd434943ca8a86100eb9c84a16.png)
删除office_ext文件，将office_ext_base文件重名为office_ext后压缩文件为Zip类型
![image11](1f81238f8c8a4cd0a1e24407286eb804.png)
**图8**
![image3](ba1975cd434943ca8a86100eb9c84a16.png)
运行安装程序，指定安装路径，直到安装完成
![image12](b5711775676b4a3083c3ad3ae3b0da32.png)
**图9**
![image3](ba1975cd434943ca8a86100eb9c84a16.png)
打开TC就可以使用实时集成Excel
**关注我们**
