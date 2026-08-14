---
title: Creo模板文件配置
updated: 2026-06-06T10:05:37
created: 2026-07-05T17:04:43
---

1.  打开D:\ipem路径下的ipem.xml文件，找到如图所示位置并将其改为如图所示内容，其中PRTSEED是PRT的种子文件在TC中的零组件ID，ASMSEED是ASM的种子文件在TC中的零组件ID
![image1](9a194a1566b64016a888f5e473887faf.jpg)
2.  用infodba账号登录TC，创建ID为PRTSEED和ASMSEED的零组件，分别在PRTSEED和ASMSEED下创建Creo 零件和Creo 装配
3.  分别在ProPrt和ProAsm类型的数据集下导入D:\PTC\Creo 2.0\Common Files\M100\templates路径下的mmns_part_solid.prt和mmns_asm_design.asm文件（注意：种子文件的数据集名称不能带有斜杠）
4.  导入完成后，种子文件配置完成
以上种子文件配置，是基于系统内三维模板处理，如果映射本地模板，则需要修改以下配置文件。将proe_common_dir改为proe安装目录下的common文件夹。如C:\Program Files\PTC\Creo 2.0\Common Files\MXXX\\
![image2](56871d91b96f4c9ca55128c39cc26b86.jpg)

