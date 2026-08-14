---
title: 注册GS
updated: 2026-08-11T10:39:15
created: 2026-07-05T17:04:48
---

修改E:\Siemens\AIG21\aig_root\gs\var\conf\script\t4xcust.bat文件，此文件在成功启动GS服务后会自动创建。
![image1](36f171fc3b264e448b52de55b37a438e.png)
获取SAP版本对应dll文件：信息通过E:\Siemens\AIG21\aig_root\gs\bin64\readme.sapnwrfclib这个文件中获取
libicudecnumber.dll/.so, libsapucum.dll/.so, sapjco3.dll/ libsapjco3.so,
sapnwrfc.dll/ libsapnwrfc.so, sapjco3.jar, sapnwrfc.ini and saplogon.properties
Windows:
\- sapnwrfc.dll -\> bin32 or bin64
\- libicudecnumber.dll -\> bin32 or bin64
\- libsapucum.dll -\> bin32 or bin64
\- icudt\*.dll -\> bin32 or bin64
\- icuin\*.dll -\> bin32 or bin64
\- icuuc\*.dll -\> bin32 or bin64
\- sapjco3.dll -\> bin32 or bin64
\- sapjco3.pdb -\> bin32 or bin64
\- sapjco3.jar -\> lib

以下是2406版本的：
Copy the extracted files into following directories in the installation:
\* Windows:
\- sapnwrfc.dll -\> bin64
\- libsapucum.dll -\> bin64
\- icudt\*.dll -\> bin64
\- icuin\*.dll -\> bin64
\- icuuc\*.dll -\> bin64
\- sapjco3.dll -\> bin64
\- sapjco3.pdb -\> bin64
\- sapjco3.jar -\> lib
以下两个exe也可以放到bin64中，单独测试sap连接用
![image2](6aedcadfc6864ed387d64f98a354a1fb.png)
运行E:\Siemens\AIG21\aig_root\gs\bin64\restart.exe启动gs服务
任务管理器中出现tpapps.exe进程，但会自动退出，继续执行以下操作注册，点击批准后，重新启动，状态变为已批准即可。
![image3](cc0078eb99e2436199a8b0e4e679f32c.png)

注册：GS必须与PoolManager安装在同一台服务；
手动注册（建议）：注册GS-T4S，**BGS**中配置-Gateway services，选中实例，点击批准；(必须安装四层服务，否则为空)，重启GS会自动生成或更新t4x_env.bat文件
![image4](580f4203251043afa463485a62227344.png)

![image5](d058cb34eeef4a50b62e990a2d20b117.png)

<span style='color:#FA0000'>点击批准后，先变为等待确认状态；重启BGS，再点击批准，变为已批准状态；否则GS启动后服务登录网页；</span>
![image6](e4eee5d8ead94c67953ab42af814b1a9.png)

==自动注册：BGS-配置-常规-高级配置，新建令牌，复制令牌值==
![image7](c857263fda734ba5bde7acc0322c1396.png)
在GS的服务器上，新建环境变量：TP_AUTO_REGISTER_TOKEN，值为上面的令牌值；

**进入GS控制台：**
网页输入https://tc:11321，登陆，用户名密码同BGS
![image8](d4be6b49ed534e148bd6326ebeaf0672.png)

![image9](2e37268b9d6d44298ca464395cec8276.png)

![image10](b5222fceafca4a89a780121412a15fe8.png)
测试TC连接：修改密码后，需要重新测试连接，Overwrite选择yes
注册数据库：值为上述注册的值
![image11](516f39a9219d4edcb5a3b0f883781ca1.png)

![image12](404d337879634644921736eac1548321.png)

![image13](9757c23bc95242cfb240b032a72f0769.png)
修改：%TC_ROOT%\tctpservers\tccs\starttcserver.bat添加call E:\Siemens\AIG21\aig_root\gs\etc\t4x_env.bat，四层需要在poomanager服务的%TC_ROOT%\pool_manager\confs\config1\tcenv.bat文件中增加上述内容，两层放到D:\Siemens\Teamcenter2406\tccs\third_party\tctp\GetEnv.bat中。或者放到tc_profiles.bat中
![image14](ad9ebda058614d91ac2e197f59dbdf12.png)
手动将 AIG 文本文件从 \<GS_ROOT\>\var\template\lang\textserver 复制到 %TC_ROOT% \lang\textserver。

*来自 \< <https://www.login.com/>\>*
