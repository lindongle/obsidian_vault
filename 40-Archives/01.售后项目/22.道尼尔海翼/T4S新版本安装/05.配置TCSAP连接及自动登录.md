---
title: 配置TC/SAP连接及自动登录
updated: 2026-06-13T15:39:19
created: 2026-07-05T17:05:02
---

1.  配置TC连接
    2.  进入GS控制台：找到脚本Register Tc Database Connection，输入名称（默认即可）执行
    3.  ![image1](0dadc692da2f42429547ada5378b67d2.png)
    4.  以下分别生成TC和SAP的连接别名，即存储用户密码库的实例名，后续通过这个别名去连接，不在直接使用用户名、密码的方式
GS中使用脚本Tc database connection test，下拉框选择Define Default …，输入用户名/密码/组，执行，得到TC连接的Credentials Alias，即 'Default@Teamcenter' ，测试TC连接：该用户为未来执行t4s接口的接口账号，改密码后需要重新注册，Overwrite选择yes
注册数据库：值为上述注册的值

![image2](60b0757b2744492d84daa3ce4138ab4d.png)

![image3](ad1b99df579246b0ad2aca6f0eef48a9.png)

2.  配置SAP连接
    1.  从D:\Siemens\AIG22\gs_root\gs\var\template\sap复制两个文件到D:\Siemens\AIG22\gs_root\gs\etc，按照SAP信息进行修改

![image4](249d7f7f757748e29c97bec10d0d032c.png)
![image5](d75bb778af414b6a95f1db424ad948ac.png)

[sapnwrfc.ini](7e6595950b8f474784c821048dc7093f.ini)

[saplogon.properties](b3a06d578c064059baec9caf045ee534.properties)

![image6](e8fa6ecf222c48a1b350433f5e40575c.png)

1.  测试连接：
![image7](785f35a17d444b3781285ac58630cc57.png)
startrfc.exe -h 10.240.66.101 -s 00 -u RFC_TC -p Dornier2013! -c 001-l EN -t -i
2.  登录GS控制台，找到脚本SAP connection test，下拉框选择Define Default …，输入SAP的信息执行，得到SAP连接的Credentials Alias 'sapqas'，Credentials Alias可以随便起名字，其他信息使用sap的登录信息。
![image8](5fda920ae86b4dd285ae7026045ccb0b.png)

![image9](5bc474749a0d418e86200899e19b73b8.png)

3.  配置t4s_mapping_config.sd，以使TC和SAP自动登录；
TC的连接别名为Default@Teamcenter，SAP的连接别名为sapqas
![image10](96f0fc4f3372431b978fe03ca339e4f1.png)

4.  连接测试
    1.  重启gs服务，运行D:\Siemens\T4S\t4s_apps_win64\bin64\restart.exe
    2.  进入gs控制台，找到脚本Generate mapping and mapping deployment，生成mapping中间文件
![image11](1dcf8ed5b9a146779d7faed4e429e423.png)

![image12](12f13711ab0f4bf1ae40fbd90f1a8614.png)
3.  测试tc自动登录
![image13](3ee3392d0a38464c9ddf1e1cb26b9089.png)

![image14](1967ce924941443182017fc531d168c5.png)
4.  测试sap自动登录
![image15](3ab1d374561b42c7a43e9d9e56060a35.png)

![image16](1f016fc81994471fb2fe212d5438aa6e.png)
---

.
