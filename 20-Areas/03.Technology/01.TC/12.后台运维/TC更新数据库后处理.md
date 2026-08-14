---
title: TC更新数据库后处理
updated: 2026-06-06T10:05:36
created: 2026-07-05T17:04:47
---

**TC更新数据库密码及后续操作**

**数据库端**
1.  更新数据库密码
启动dos，
C:\temp\> sqlplus / as sysdba
sql\> alter user infodba identified by infodba;

2.  设置数据库密码过期时间
永不过期：
sql\>ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;
![image1](4509636bfa27466dac9de4ed03997f18.png)

**TC端**
**方法一**
1.  启动Environment Manager
2.  选择Configuration Manager
3.  选择 Perform maintenance on an existing configuration
4.  选择 Update Security
![image2](8b418c20a6694212ba671e4d5736dbe3.jpg)
5.  指定生成加密码文件的目录，并输入密码
![image3](ffa6f058c42040e0871eecee9e4e9b41.jpg)

6.  执行后，在上步指定目录找到pwf文件
![image4](8238fdbf5d844d3db4c96743e8c6d8d8.jpg)

7.  打开得到一个加密字符串
![image5](34c75db1e710428bb873252cfae98021.jpg)

8.  更新tc_profilevars
在TCDATA目录，编辑tc_profilevars.bat文件
![image6](e0d96f47d0c248e2a9bd240ce1dc0e51.jpg)

9.  用第9步得到的字符串替换红框中的内容。

**方法二**
1.  打开 TC 命令提示窗口,设置相关的环境变量
2.  使用 user:pwd@database 格式设置 TC_DB_CONNECT 环境变量,
比如 set TC_DB_CONNECT=infodba:infodba@tc
3.  运行 install -encrypt 来获取加密后的密码。
![image7](b3dfebd9f8304d9c921828106926cec9.png)
4.  修改 TC_DATA 中 tc_profilevars 文件的 TC_DB_CONNECT，如果 IMAN_DB_CONNECT 已存在,那么也修改它。
