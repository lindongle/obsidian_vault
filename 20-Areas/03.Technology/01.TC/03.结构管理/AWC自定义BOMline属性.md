---
title: AWC自定义BOMline属性
updated: 2026-06-06T10:09
created: 2018-09-20T20:02:12.000Z
tags:
  - awc
  - bom
  - BOM
---

1、安装Active Workspace→客户端→活动内容
Active Workspace→服务器扩展→Active Content Structure
2、新建ItemRevision（OOTB），打开后点击后侧加号，添加子项。搭建BOM结构。
![image1](6a36c7dc9b574c51bec716c04dfc1ef7.png)
3、BMIDE：
1）新建两个注释类型：
![image2](85e9b8eca06d4cd1b5dcdbb733a9e470.png)
2）在Awb0DesignElement对象属性，新增两个runtime属性：
![image3](3dad00a287ad42fca24dafb1bdeecef2.png)
3）修改新增的两个runtime属性的常数Awb0BOMToOccurrence，值为1）中新建的注释类型。
![image4](c730ef4fad9842b4824c1cc21bd18aed.png)

![image5](61995038e4054c0a9105f39fe31f1b64.png)

![image6](19163794f1ae45e89ac148aa4d6c0e63.png)
4）新建LOV，并将LOV附加到其中一个属性上。
![image7](09766e1bba0444eab3a9387d019a8d58.png)
保存，并进行热部署，部署成功。（后面进行了一遍冷部署，也成功）
4、执行utility命令：
export_uiconfig -u=infodba -p=infodba -g=dba -file=C:\temp\occmgmt.xml -client_scope_URI="Awb0OccurrenceManagement"，显示成功。
打开C:\temp\occmgmt.xml，添加新增的两个runtime属性。保存。并将上面的sortBy="29"中29，改为31，增加几个自定义属性数量就增加几。
![image8](9168f14062cc4725a5d086cd410bcfe4.png)
5、执行utility命令：
import_uiconfig -u=infodba -p=infodba -g=dba -file=C:\temp\occmgmt.xml -client_scope_URI="Awb0OccurrenceManagement"，显示成功。
![image9](bcb14b47d033421798e2a1be6614cf47.png)
6、启动四层服务，重新登录AWC客户端，将建立的ItemRevision对象打开后，选择右侧列后面的排序，点击重置即可。
![image10](5b6ead32198a40329243586d69957d4f.png)

![image11](244a1315ba1e4e989a7f05b04f322f03.png)

![image12](0a525ace508d49f091ee00ccf88e249a.png)

