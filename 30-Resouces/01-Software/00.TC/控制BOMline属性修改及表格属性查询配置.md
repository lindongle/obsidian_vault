---
title: 控制BOMline属性修改及表格属性查询配置
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:04:52
tags:
  - TC
---

## Teamcenter技术技巧 
***1. 如何控制BOMLine属性的可修改性***
默认情况下，从零组件和零组件版本传递过来的BOM行属性都可以被修改
如何控制结构管理器中属性的可修改性呢?
![image1](635c03dece1349e79c6d341f64e9833b.jpg)
方法
修改 BOMLine属性的属性常量'Modifiable', 该常量有以下三个可选值.
Read – 提供用户只读的权限.
Write – 用户可以修改属性，这是默认的值.
Write Only If Null – 只有该属性的值为空时，用户才可以修改.
注意：
每当你对一个属性的Modifiable常量设置值为'Write Only If Null' 时，你必须要在属性策略中对该属性添加includeIsModifiable="true"标记, 这样在调用服务时，可以同时返回该属性值的'Is Modifiable' 标记 (默认情况下，Teamcenter服务对Modifiable常量设置为'Write Only If Null'的属性不返回'Is Modifiable' 标记，原因是考虑到性能方面的因素)。
例如，在TC_DATA\soa\policies\RACBase.xml属性策略文件中做如下修改：
\<ObjectType name="WorkspaceObject"\>
\<Property name="object_string" includeIsModifiable="true" /\>
\</ObjectType\>
例如在BMIDE中做如下设置，这样在该属性值不为空时，用户无法修改
![image2](3c197e25d11748eaaaed5a18244ae1b8.jpg)
***2. 禁止非几何模型在查看器中显示***
NX非几何模型的零件默认可以在TC查看器中勾选并且查看
如何禁止它显示呢？
设置首选项
TCVIS_allow_NGC_expand=FALSE
***3. 如何创建查询来搜索表格属性信息？***
为表格属性创建保存的查询
1.在查询构建器中为新建查询输入唯一的名字
2\. 如果需要，在描述中输入描述
3.在可修改的查询类型中选择本地查询
4.点击搜索类按钮来选择查询的目标类
5\. 展开 POM_application_object 类并找到 ItemRevision 类
6.点击显示设置，选择所有属性和真实名称
![image3](d268b936c6774ab4b8cb839f6cb63994.jpg)
7\. 在属性选择窗口中，双击被引用节点，出现类属性选择对话框
8.点击搜索类按钮搜索自定义的表格行业务对象类型
它会在Fnd0TableRow节点下出现
![image4](b6e785cc5edf4a4489ad212b22625652.jpg)
9\. 选择对应的表格行业务对象，然后选择fnd0OwingObject，并点击OK，就会列出可以查询的表格行属性
10\. 选择需要查询的属性来建立查询条目，点击创建来创建查询
![image5](33c2721214714d43a749d7a04d998310.jpg)
在保存的查询树下即可见新创建的查询，并且在My Teamcenter中可以进行查询
![image6](1ee27070b154435bb27e99ca7b72c17a.jpg)

阅读
在看
已同步到看一看[写下你的想法](javascript:;)
前往“发现”-“看一看”浏览“朋友在看”
![image7](18b9448aa54242ce819895ab667dc61b.png)
前往看一看
**看一看入口已关闭**
在“设置”-“通用”-“发现页管理”打开“看一看”入口
[我知道了](javascript:;)
已发送
取消
#### *发布到看一看 *
发送
最多200字，当前共字
发送中
相关阅读
[更多文章](javascript:;)

微信扫一扫  
关注该公众号

微信扫一扫  
使用小程序
[取消](javascript:void(0);) [允许](javascript:void(0);)
[取消](javascript:void(0);) [允许](javascript:void(0);)
[知道了](javascript:;)
[确定](javascript:void(0);)
[\<From: http://mp.weixin.qq.com/s?\_\_biz=MzAwMjUyOTUwMw==&mid=2649882232&idx=1&sn=19a860b3acc82b6acbb78c81fa9554f9&chksm=82cc5fc8b5bbd6def80dd6c199675d4305254608e91585318a2f5bc57b4f0c13a3e1cd30d938&mpshare=1&scene=1&srcid=1216j5pFWzqnTuHAT5uXIdhV&sharer_sharetime=1576505026567&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd\>](http://mp.weixin.qq.com/s?__biz=MzAwMjUyOTUwMw==&mid=2649882232&idx=1&sn=19a860b3acc82b6acbb78c81fa9554f9&chksm=82cc5fc8b5bbd6def80dd6c199675d4305254608e91585318a2f5bc57b4f0c13a3e1cd30d938&mpshare=1&scene=1&srcid=1216j5pFWzqnTuHAT5uXIdhV&sharer_sharetime=1576505026567&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd)
