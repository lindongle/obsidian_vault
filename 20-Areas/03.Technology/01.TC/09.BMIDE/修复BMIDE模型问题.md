---
title: 修复BMIDE模型问题
updated: 2026-06-06T10:08
created: 2020-03-30T23:18:27
---

<span style='color:red'>manage_model_files</span> -u=user-id {-p=password \| -pf=password-file} \[-g=group\] -option=\[list \| upload \| download\] \[-dir=directory -template=template -release=Teamcenter-release -resource=project \] -syncToDb \[-h\]

1、business_model_extractor -u=infodba -p=infodba -g=dba -mode=all -outfile=c:\extracted.xml
导出系统模型，查看分析那些属性有问题
<span style='color:#FA0000'>导出后当前目录的lang文件夹中也有对应文件</span>

2、business_model_updater -u=infodba -p=infodba -g=dba -mode=upgrade -update=all -file=c\delta.xml
删除问题属性，删除模板如下：将以下内容粘贴到xml文件中

另外差异可以分别从好的环境下抽取后，与不好的环境对比，把对比的结果复制到delta.xml文件，使用Add/Change/Delete进行操作

\<?xml version="1.0" encoding="UTF-8"?\>
\<TcBusinessData xmlns="http://teamcenter.com/BusinessModel/TcBusinessData" Date=""\>
\<Delete\>
\<TcPropertyConstantAttach constantName="Visible" propertyName="y2_Y2_REL_ColourfulPart" typeName="Y2_RawMaterialRevisionCreI" value="false"/\>
\</Delete\>
\</TcBusinessData\>
3、business_model_extractor –u=infodba -p=infodba -g=dba -mode=all –outfile=d:\bak\extracted.xml
再次导出，看属性是否删除

4、删除tcdata\model\下三个文件中上述相关属性
![image1](cb4d86144305400b8b23766ea99aea85.png)

5、manage_model_files -u=infodba -p=infodba -g=dba -option=upload
将bimde项目作为数据集上传到TC系统中（元数据，数据库中的 Fnd0BMIDEResource 文件夹中）

6、重新部署

7、查看tcdata下delta.xml的更新信息

BMIDE步骤：
<span style='background:yellow;mso-highlight:yellow'>business_model_extractor从数据库导出模型文件</span>
删除原model.xml及model_lang的backup文件
将model.xml及model_lang备份，后面加backup
将当前bmide项目的内容重新整合到model.xml及model_lang中，
bmide_comparator命令将新的model.xml与新的backup文件对比，生成delta.xml文件，business_model_updater命令将该文件部署到数据库中；

business_model_extractor可以将上次部署到数据库中最新的model.xml及model_lang导出来。

如果部署报错，导致数据库部署一直相同，无差异。可以==business_model_extractor导出来，重命名为==model.xml及model_lang的backup文件，在部署时系统自动生成backup文件时快速覆盖过去（开始生成delta.xml文件之前）。

1.  移除属性，部署，成功，日志错误，提示属性不是有效的属性；
2.  添加属性，部署，报错；
3.  数据库移除attribute表；
4.  将Delta文件复制出来，使用改为Add，使用utiliy部署，报错；
5.  Add改为Delte，执行；
6.  再改为ADD，再执行
7.  
