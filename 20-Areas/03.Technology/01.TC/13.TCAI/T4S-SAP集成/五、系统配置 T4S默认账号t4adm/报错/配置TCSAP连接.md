---
title: 配置TC/SAP连接
updated: 2026-09-02T16:30:05
created: 2026-07-05T17:04:48
---

通过GS脚本生成连接文件；或者直接根据SAP登录信息手动配置一下两个文件(730及以前版本，安装完后可以自动生成saplogon.ini或从已有电脑上上复制一份，避免填写各种配置信息，默认路径在C:\Users\infodba\AppData\Roaming\SAP\Common\saplogon.ini)；--注：SAP 750及以上可能没有这个文件，直接忽略此步（脚本生成），手动配置以下两个文件即可
[saplogon.ini](17f1b6e42f0f4f1b8145dd57b40bbff1.ini)

[SapLogonTree.xml](5e09a46b26394ee8ac50d368b393ce9e.xml)

![image1](d146822d17764e2483d2b1c2a3a04454.png)

![image2](ce703e899fad428a876fa7055713bd0a.png)

![image3](52a3b9b2a5eb43d4b76d77168bea6131.png)

将生成的配置文件sapnwrfc.ini和saplogon.properties从tmp复制到etc文件夹中，重启GS服务
![image4](c58504e0e6984a1abd4fdead55924a2e.png)

以下分别生成TC和SAP的连接别名，即存储用户密码库的实例名，后续通过这个别名去连接，不在直接使用用户名、密码的方式
GS中使用脚本Tc database connection test，下拉框选择Define Default …，输入用户名/密码/组，执行，得到TC连接的Credentials Alias，即 'Default@Teamcenter'
![image5](4ca6741e2d7240129d1e5f8b984dd3df.png)

![image6](7793354c62d745bd8821a0350cd2fabf.png)
GS中使用脚本SAP connection test，下拉框选择Define Default …，输入SAP的信息执行，得到SAP连接的Credentials Alias 'sapqas'，Credentials Alias可以随便起名字
可以先用以下命令测试SAP的环境：将以下两个文件（SAP 开发包中的文件）放到gs的bin下，cd到里面去执行；
![image7](3ab6a3da8d49480ebd60880e9ea79d69.png)
startrfc.exe -h 172.20.1.218 -s 00 -u itbasis -p sapbasis -c 300 -l ZH -t -i
![image8](e0e67d1349ea4fb6a50a4071158e1db3.png)

![image9](c5f41302905147068e2df83519081ef9.png)

![image10](a3fdd81dd75744da8ac5b675417a7b23.png)

![image11](28a5c749cefa43e88ad5036f893cd5b7.png)

配置t4s_mapping_config.sd，以使TC和SAP自动登录；
TC的连接别名为Default@Teamcenter，SAP的连接别名为sapqas
![image12](a41cd69ee944403fb2bfc41a0b1544d1.png)

0\.
