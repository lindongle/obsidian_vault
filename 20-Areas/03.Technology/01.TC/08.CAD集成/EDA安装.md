---
title: 安装
updated: 2026-06-12T10:38:29
created: 2026-07-05T17:04:43
---

安装
2018年8月10日
9:54

一、前提：
1、安装EDACommonClient 2.1（安装基本EDA2.1安装过程）
2、安装AD17或18
3、安装Teamcenter10或11
4、设置JAVA_HOME环境变量为jre的安装目录。
![image1](5532d870c7ef4ec891cd3b448c16122c.png)
二、安装过程：
1、关闭AD软件。
2、管理员运行安装程序
![image2](bcfc73e30edf4c8e9e7559d1ab19de7b.png)
3、弹出界面，点击install
![image3](c2c623e247fe4a25b94674e6d14efcd4.png)

![image4](ad98f03e5eed403192cba63f2e67a837.png)

![image5](bc6849369c274b80b72ba443a1744195.png)
4、会自动安装到%TCEDAECAD_ROOT%中，文件夹名字为G2
![image6](b4f2b4ba942f46ba84d795fec4df13ee.png)
5、将D:\Siemens\TeamcenterEDA2\eda\G2\altium_dual\setup\edaclient下所有文件复制到D:\Siemens\TeamcenterEDA2\eda下，根据提示进行替换
![image7](6e4902e99a2e442589bc4048aa162293.png)
6、对于AD18，将D:\Siemens\TeamcenterEDA2\eda\G2\altium_dual\setup\system64下的所有文件复制到AD18的安装目录的system文件夹下，如D:\Altium\AD18\System下
![image8](6afc0d1f9b344a61bfb2c55d34c5b64c.png)
7、对于AD17，将D:\Siemens\TeamcenterEDA2\eda\G2\altium_dual\setup\system32下的所有文件复制到AD18的安装目录的system文件夹下，如D:\Altium\AD17\System下
![image9](f9c68e8b9542473d807b843a4d5707c7.png)
8、在AD安装目录下的system文件夹下找到刚复制的TeamcenterG2.rcs文件，记事本打开进行编辑。将所有%TCEDAECAD_ROOT%替换为D:\Siemens\TeamcenterEDA2\eda，并保存。
![image10](3e65bea9a6d4492aae5772a9f2977166.png)
9、对于集成菜单Workflow是基于AWC系统用的，没有的可以进行裁剪。裁剪方式：到该文件最下面。
![image11](e2f89a7e5be849b1af4dec14df12f230.png)
记事本打开AD安装目录下的system文件夹下找到刚复制的TeamcenterG2.rcs文件。
替换：
Tree MNI2MenuTree Caption='&Workflow' Link MNItemDesignWorkflowSchematic PLID='PLI2:DesignWorkflowSchematic' End Link MNItemPartWorkflowSchematic PLID='PLI2:PartWorkflowSchematic' End Link MNItemWorkflowStatusSchematic PLID='PLI2:WorkflowStatusSchematic' End
End
为：
Link MNItemPartWorkflowSchematic PLID='PLI2: PartWorkflowSchematic' End

替换：
Tree MNI2MenuTree Caption='&Workflow'
Copyright 2018. Siemens PLM. All Rights Reserved
Link MNItemDesignWorkflowPcb PLID='PLI2:DesignWorkflowPcb' End Link MNItemPartWorkflowPcb PLID='PLI2:PartWorkflowPcb' End Link MNItemWorkflowStatusPcb PLID='PLI2:WorkflowStatusPcb' End
End
为：
Link MNItemPartWorkflowPcb PLID='PLI2: PartWorkflowPcb' End
10、修改D:\Siemens\TeamcenterEDA2\eda\altium_pcb_config.xml和D:\Siemens\TeamcenterEDA2\eda\altium_schematic_config.xml，将\<PartInBom id="ItemID" name="Value"/\>中的ItemID改为Description，value可以改为保存到Teamcenter时的元器件名称。用于匹配元器件与Teamcenter元器件的映射关系，此处可以填写所有显示的属性。
![image12](d39afb5433ea40388b13fc9a6470fd4f.png)

![image13](c07fbe8fdc0e4454b61e0ec3ddf72948.png)

![image14](577d48d8bdf54410904ec885a2cc9c59.png)

