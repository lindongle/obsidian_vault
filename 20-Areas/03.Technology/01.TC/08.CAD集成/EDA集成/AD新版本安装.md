---
title: AD新版本安装
updated: 2026-08-13T11:12:56+08:00
created: 2020-10-10T16:04:36
---

独立介质，且必须先安装EDA gateway；
![image1](0782fc3e93e14f548d67e8e11bf975bd.png)

![image2](2bb22101bcbb4be994ff37553dee4578.png)
从1.1版本开始，Altium集成以“组合”模式或“双重”模式支持设计数据管理。 当设计的原理图和布局被视为组合安全设置时，将使用“组合”模式-这表明整个设计必须由一个人签出/拥有。 “双重”模式允许单独的个人同时签出原理图和布局数据库。 它不包含有关实际EDA客户程序的任何帮助。
您可以通过两种不同的方式使用连接器：
■组合模式
■双模式
在组合模式下，整个设计保存在Teamcenter中的一个Item下。
在双模式下，原理图和PCB文档将保存在单独的Item下。 双重模式允许工程师单独处理这些文档

项目存在多人编辑同一PCBA项目的原理图和Layout图，所以采用dual模式
如果安装过其他版本的EDA，则需要将Integrate.dll and TeamcenterG2.dll 从AD的system目录下移除；
将D:\Siemens\TeamcenterEDA2\eda\G2\altium_dual\setup\edaclient的内容复制到D:\Siemens\TeamcenterEDA2\eda中
将D:\Siemens\TeamcenterEDA2\eda\G2\altium_dual\setup\system64的内容复制到D:\Altium\AD18\System中
修改D:\Siemens\TeamcenterEDA2\eda下altium_schematic_config.xml和altium_pcb_config.xml，将ITEMID改为Description
可根据需要修改D:\Altium\AD18\System\TeamcenterG2.rcs文件，对AD中Teamcenter的菜单进行裁剪；
