---
title: Windows 2008 r2 AD域自定义属性
updated: 2026-06-06T10:05
created: 2018-04-24T23:22:32
---

Windows 2008 r2 AD域自定义属性
星期二, 四月 24, 2018
3:22 下午

已剪辑自: <https://www.cnblogs.com/zhangxu724100/archive/2012/09/20/2695600.html>

1.Active Directory 用户和计算机:dsa.msc  
2.但是dsa中不能对自定义的扩展属性进行管理。要管理这个，就需要使用adsiedit.msc。

3.接下来的问题是，如何增加自定义属性。  
3.1 安装:运行adminpak.msi后，regsvr32schmmgmt.dll。  
3.2  
A.开始，运行MMC  
B.在MMC【文件】菜单中选择【添加删除管理单元】
　　　　　　　　
![image1](9a6da84cabfa477eae7a7fc48ce6dd52.png)
C.在弹出框中点【添加】按钮  
D.选择【Active Directory架构】后，点【添加】按钮，然后【关闭】  
E.返回到C中的窗口，点【确定】按钮
4.点击“属性”，新建一个属性。

![image2](36a6fd6232a84894b090271bd33ce2fc.png)
5.点击类，找到user类，添加新属性到user里面
![image3](02bf47c084d34bd2a8d8673f13aa87a4.png)
6、打开AD人员管理，选择高级功能，点击人员属性，找到属性编辑器，可填写自定义属性的值
![image2](36a6fd6232a84894b090271bd33ce2fc.png)
![image2](36a6fd6232a84894b090271bd33ce2fc.png)

