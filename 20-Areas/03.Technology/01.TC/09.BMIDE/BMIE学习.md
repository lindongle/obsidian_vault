---
title: BMIE学习
updated: 2026-06-06T10:05:36
created: 2026-07-05T17:04:45
---

1、零组件类型及属性
必须输入英文名称，然后进行本地化对照。
属性一般放到IteammaterRevesion上，表单可以隐藏。属性添加到itemrevision上无法显示。
问题：如果隐藏新建零部件的其他选项卡，如主零部件、主零部件版本等？
2、对象对应
![image1](bb4454b4ec7943b097fc7b4f63e099e6.gif)
3、零组件属性设置显示与隐藏：visible改为FALSE（去掉下图中的勾选框）
![image2](d4219435ae704cc98ba7bbabd80eea69.gif)

![image3](8fae94ede9744bc4a61fc5d5876bb08a.gif)
3、Item图标设置
在业务对象上右键添加图标（切换为高级模式）。选择图片，格式为模板名称，KY4_XXXX.png（像素为16X16及以下）。（BMIDE添加图标改到了扩展--客户端UI配置--图标，右键新建命令图标）
然后在下图中选择对应的图标。
![image4](f8f51b6667dd4614a7160f5a7cc50d4b.gif)

![image5](a621e1d1941e4ef9a5fa3bd8301e60f3.gif)

第二种配置图标的方式：
在客户端的plugins文件夹下找到：portal\plugins\configuration_11000.2.0。将图标放到该目录下的images文件中。然后用记事本打开该目录的customer.properties文件，编辑里面的文件。
格式为：业务对象（BMIDE中配置零组件或数据集）名称.ICON=images/图标名称.后缀
如KY2_DWG.ICON=images/acad.png保存即可。
然后在客户端重新注册（或通过更新方式写脚本自动注册）
注册方式为：运行胖客户端下portal\registry目录下的genregxml.bat文件即可。此文件可以编辑，然后删除其他国家语言，加快注册速度（只保留EN/ZH）即可。

4、两层数据库连接通过IIOP连接，四层通过HTTP连接。
5、BIMDI部署连接时，需要通过2层客户端开启TAO命令窗口，才可以进行连接。
6、部署模板时，提示IPEM.XML数据库未安装，无法热部署。
解决，使用TEM，在添加移除部件中，浏览选择BMIDE模板文件（feature_ipem.xml），勾选集成功能，安装后重新部署。
7、部署错误，存在未处理的shcma
![image6](e079f5cfe4a84d1b8d882f4d64eedd6c.gif)
解决：根据log日志提示，访问管理器存在组织结构相关的信息。或在部署显示规则时，没有对应的组等，无法部署成功，解决，导入原来的组织及访问管理器设置即可。
8、设置数据集类型隐藏。
默认DataSet（父类）的显示规则是istrue。（istrue为隐藏，isfalse为显示）
修改：选择要隐藏的数据集类型，双击，切换到显示规则标签页，点击右侧添加按钮，输入infodba账号及密码连接到数据库，访问者名称选择要设置隐藏的组织结构（选择顶级org则全部隐藏），参数设置为istrue。
集成CAD的数据集类型，如果没有显示在dataset类下，在BMIDE中，选择项目--文件--属性，切换到Teamcenter-bmide，勾选ipem，点击确定。（不好使）

![image7](d07c5cf8e6264ff5a314471c6aab09db.gif)
9、设置界面显示真实属性（英文）
![image8](8941d6c5bccb4b3dbf7168f503442f10.gif)

![image9](97857dad18a24bfb8da41aa0b2927fa4.gif)
10、修改版本零组件在树上的显示内容。
![image10](32eb788dc36d4c058e0d614ca79805ea.gif)
11、导入BMIDE项目。
将项目（KY6）文件夹（路径D:\Siemens\Teamcenter11\bmide\workspace\11000.2.0）复制到要导入的环境的电脑的对应位置。并将D:\Siemens\Teamcenter11\bmide\workspace\template文件夹一块复制。
启动BMIDE，点击文件--导入--业务建模器，目标内容选择项目文件夹。
![image11](58efd179bfe84fde84101db041f4a292.gif)

