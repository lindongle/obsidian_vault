---
title: E、导入IPEM映射
updated: 2026-06-06T10:05:37
created: 2026-07-05T17:04:44
---

1、管理员运行TC的命令窗口。
![image1](9bc4921a7d8a411b87af159c70e5aa20.gif)
2、切换到ipem安装目录下。
![image2](576ac6633a2a403b973159d9bb97a267.gif)
3、输入create_attr_mappings -u=infodba -p=infodba -i=ipem.xml -o=ipem_attr_mappings.txt回车，将ipem.xml转换为ipem_attr_mappings.txt文件，ipem目录下产生ipem_attr_mappings.txt文件
![image3](7f0de616ae7344f99bedd96f70b3b27f.gif)

![image4](991151669cd643ba85c5a6d9872262c6.gif)
4、使用export_attr_mappings 命令创建一个existing_attr_mappings.txt文件:
export_attr_mappings -u=infodba -p=infodba -g=dba -file=c:\existing_attr_mappings.txt，回车。
![image5](7544e1a48e6d453994759d6d28ff4eb5.gif)

![image6](2bbaf15f3fc44a9faa9d2886f7ce3886.gif)
5、将集成映射与TC中的现有映射合并，在ipem文件夹中复制一份existing_attr_mappings.txt，重命名为merge_attr_mappings.txt，打开该文件。将ipem_attr_mappings.txt中的内容粘贴到该文件中。保存该文件。如下图。
![image7](2d6477beacc24564b51a405c542c81c8.gif)
6、导入和并后的映射文件到TC。
输入import_attr_mappings -u=infodba -p=infodba -g=dba -file=existing_attr_mappings.txt，回车。完成导入。
![image8](0a092a47a1a446919f42253c4c1de90c.gif)

