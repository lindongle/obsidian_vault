---
title: 使用csv2tcxml命令导入产品配置字典及关联
updated: 2026-06-13T15:34:15
created: 2026-07-05T17:04:46
---

使用<span style='color:#1E1E1E'>csv2tcxml命令导入产品配置字典及关联</span>
2025年7月10日
9:16

1.  安装设置<span style='color:#1E1E1E'>csv2tcxml，输入命令</span>
csv2tcxml install -u=infodba -p=infodba -g=dba C:\Siemens\Teamcenter2412\tc_data -c
![image1](649549cf834049fd98fc53d44d452880.png)
2.  从tc_data复制配置器导入excel模板，并填入信息
![image2](184e11f1882b4b2bb33f6438e1ab2465.png)
3.  修改csv2tcxml配置文件，migration ID需向西门子申请
![image3](72b6493a55ac482fbccc8c32e9e136e9.png)
4.  执行命令，将csv文件转换为tcxml文件
Csv2tcxml 文件
![image4](d927c75ad52246af9b8a3799f9be656d.png)
5.  执行命令，将字典库导入系统
tcxml_import -u=infodba -p=infodba -file=文件路径 -bulk_load

<span style='color:#FA0000'>先导入字典或配置器关联，再导入族，再导入特征，再导入组，再导入组和族的关系</span>
![image5](5039ccb202cf408bb24519c931bca465.png)
导入报错：Wide character in subroutine entry at C:/Siemens/tc_data/csu2tcxml/lib/Csu2TcxML/TcAdminData.pmline 25
将文件转为utf-8格式，如果不好使，修改一下文件：
![image6](7ec5b90f11a945cb8397cc7ee940527f.png)

![image7](bf0b3a375201446d81e2caf17144f2a0.png)
修改导入数据的所有权：
![image8](8c619e1ae1944868ae1b96ed72daad85.png)

无法导入组-族的关系：
漏加了以下内容及列
族-组

![image9](3a7390fb8178483fae2187cb7c5c19cf.png)

![image10](c9d1069434c7408ebe56a1ca110abba4.png)

