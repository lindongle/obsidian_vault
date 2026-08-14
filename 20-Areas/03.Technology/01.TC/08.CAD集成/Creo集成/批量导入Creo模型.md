---
title: 批量导入Creo模型
updated: 2026-06-06T10:05:37
created: 2026-07-05T17:04:43
---

![image1](7190e33200c54e33aa58502cfe23ec12.png)
cd /d D:\PLM\Siemens\ipem
ipemimport -u=admin -p=admin -g=dba -folder=import C:\Users\infodba\Desktop\TESTIMPORT
-folder为tc中文件夹的名称，如果没有则放到newstuff中，后面空格+文件或文件夹所在路径，多个路径使用分号隔开
-auxiliary_files_only：只导入生成的数据集，不导入原模型；

