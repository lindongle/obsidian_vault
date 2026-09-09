---
title: 注册GS及tc连接配置
updated: 2026-09-02T16:30:07
created: 2026-07-05T17:05:02
---

1.  修改d:\Siemens\AIG22\gs_root\gs\var\conf\script\t4xcust.bat文件
![image1](0d29b5d6210f41c58d94e938ef07094b.png)

1.  手动注册（建议）：
2.  运行GS,D:\Siemens\AIG22\gs_root\gs\bin64\restart.exe
3.  登录BGS控制台，**BGS**中配置-Gateway services，选中实例，点击批准；
![image2](a0af669577f4445d8487ef021af78582.png)

![image3](55879d0f8c0b4355961c9e75cc65d8b9.png)

3.  点击批准后，先变为等待确认状态；
4.  再次启动GSD:\Siemens\AIG22\gs_root\gs\bin64\restart.exe，再点击刷新，变为已批准状态；
![image4](8a6ed19a436242d89dd2e05d85000e58.png)
4.  部署SAP所需文件：在GS的服务器上，新建环境变量：TP_AUTO_REGISTER_TOKEN，值为上面的令牌值；
获取SAP版本对应dll文件：信息通过d:\Siemens\AIG22\gs_root\gs\bin64\readme.sapnwrfclib这个文件中获取（从原T4S中获取或从该文件的网站上下载）
![image5](09767802c96a48ed84ae08a9ee7a018b.png)
4.  运行D:\Siemens\AIG22\gs_root\gs\bin64\restart.exe重新启动gs，网页打开https://syixtst04.dosea.local:11321/，进行登录
![image6](cd5a44a546fe492b95ec61cd2aaf87b4.png)
注册：GS必须与PoolManager安装在同一台服务；
5.  D:\Siemens\tcdata\tc_profilevars.bat添加call D:\Siemens\AIG22\gs_root\gs\etc\t4x_env.bat
![image7](391b5b007f8f4736902e70e826e1493e.png)

