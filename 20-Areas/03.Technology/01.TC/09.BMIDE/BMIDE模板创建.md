---
title: BMIDE模板创建
updated: 2026-06-06T10:35:47
created: 2026-07-05T17:04:45
---

1、在BMIDE中加载模版：
1）EM中添加模版：
![image1](dcdc796b78f4478aad107eff4d9dd199.png)
可以添加现有的，也可以从本地xml文件中选取，默认的模版放在%tc_root%\install\install\modules中
![image2](13064be27f39413b976c79817470aadf.png)
3）在BMIDE中添加并自动加载。
选中项目-文件-属性-Teamcenter-BMIDE，右侧勾选上刚加进来的模版，点击确定。

2、将模版导入数据库（BMIDE热部署之前）
1）TEM中选择更新数据库。
2）
![image3](d13e384cfe4c4e69884428a847c11034.png)
添加本地需要增加的模版XML文件，跟上面一样（此处或者从添加删除组件中，添加对应的模块一样效果）
![image4](b7f0587d00de451d87146af2a323a4fc.png)
