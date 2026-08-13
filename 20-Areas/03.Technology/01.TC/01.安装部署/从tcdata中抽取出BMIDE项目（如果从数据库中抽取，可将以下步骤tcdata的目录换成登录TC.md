---
title: 从tcdata中抽取出BMIDE项目（如果从数据库中抽取，可将以下步骤tcdata的目录换成登录TC...
updated: 2026-06-06T10:05
created: 2018-11-15T16:44:04
tags:
  - TC安装部署
---

1、新建项目h6hryt。
复制D:\Siemens\Teamcenter11\install\h6hryt下的
install_h6hryt.default文件和upgrade_开头的文件，到BMIDE的项目文件夹（D:\Siemens\Teamcenter11\bmide\workspace\11000.2.0\h6hryt\install）中。
![image1](d744b46d34b945c5a94eefd465acc99c.png)

![image2](ae5c043166af4f949e063b2eafd75642.png)
2.复制以下文件
D:\Siemens\Teamcenter11\install\install\modules\feature_h6hryt.xml到D:\Siemens\Teamcenter11\bmide\workspace\11000.2.0\h6hryt\install中。
3.打开D:\Siemens\tcdata\model\h6hryt_template.xml文件的内容，全选-复制，打开D:\Siemens\Teamcenter11\bmide\workspace\11000.2.0\h6hryt\extensions\default.xml，然后全选-粘贴-保存。
4.打开D:\Siemens\tcdata\model\h6hryt_dependency.xml文件的内容，全选-复制，打开D:\Siemens\Teamcenter11\bmide\workspace\11000.2.0\h6hryt\extensions\dependency.xml，然后全选-粘贴-保存。
5.打开D:\Siemens\tcdata\model\lang\h6hryt_template_en_US.xml文件的内容，全选-复制，打开D:\Siemens\Teamcenter11\bmide\workspace\11000.2.0\h6hryt\extensions\lang\en_US\default_en_US.xml，然后全选-粘贴-保存。
6.打开D:\Siemens\tcdata\model\lang\h6hryt_template_zh_CN.xml文件的内容，全选-复制，打开D:\Siemens\Teamcenter11\bmide\workspace\11000.2.0\h6hryt\extensions\lang\zh_CN\default_zh_CN.xml，然后全选-粘贴-保存。
7.在BMDIE中重新加载项目。检查是否缺少项目模板。
8、然后通过TEM冷部署到数据库中。
编码验证错误 BASE-10001
![image3](91338fa1e0374b88a036a7d847173406.png)
Default.xml的前两行改成跟原先一样的。检查中文或乱码，Date后面的星期为中文导致，清空即可。
\<?xml version="1.0" encoding="UTF-8"?\>
\<TcBusinessData xmlns="http://teamcenter.com/BusinessModel/TcBusinessData" Date=""\>
