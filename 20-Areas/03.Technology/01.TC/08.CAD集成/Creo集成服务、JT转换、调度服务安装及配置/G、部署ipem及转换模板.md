---
title: G、部署ipem及转换模板
updated: 2026-06-06T10:05
created: 2018-03-11T13:13:03
---

1、管理员运行TEM-配置管理器-业务建模器模板-添加/更新。。。，点击下一步。
![image1](8a625005c33b44e9ba0e07379d52859f.gif)
2、点击添加按钮。搜索ipem，添加ipem模板和translation模板。点击下一步。
![image2](7d0e2cc29ca44fbdb6e3a232105ffbf8.gif)

![image3](c3b4722ed86f4ce48b6891b0e5499856.gif)
3、点击开始，提示查找ipem，定位到D:\apps\ipem\iPEM_BMIDE_Package11\feature_ipem.xml点击打开，继续安装。直至安装完成。
![image4](c0689bcaf37e427b88a968c637760ea6.gif)
4、打开BMIDE，选中项目，右键属性。
找到Teamcenter-BMIDE，勾选新加的ipem及translationService，点击确定。会自动重新加载项目。
![image5](2826197e011f4f6daf47b74ceb270d3d.gif)
5、点击BMIDE菜单-部署模板，将模板部署到数据库中。
