---
title: "<span style='color:#2B77BF;text-align:center'>1.启用属性级安全（ALS）支持(只有自定义属性才支持)</span>"
updated: 2026-06-23T08:58:08+08:00
created: 2026-04-27T07:07:17
tags:
  - TC
aliases: ["<span style='color:#2B77BF;text-align:center'>1.启用属性级安全（ALS）支持(只有自定义属性才支持)</span>"]
linter-yaml-title-alias: "<span style='color:#2B77BF;text-align:center'>1.启用属性级安全（ALS）支持(只有自定义属性才支持)</span>"
---

TC设置对象属性的权限
2026年4月27日
7:07

[源网页](https://mp.weixin.qq.com/s?__biz=MzkwNTI5MDY0OQ==&mid=2247486475&idx=1&sn=f42db68dbefc7d56dc4371b73353243a&chksm=c1fc91d968631b4da2bc14386a3f8810dfcfee3383c1161a22ad4654587254cb2e153458848f&mpshare=1&scene=1&srcid=0427wb0kDv3pKj0QUudfjl1v&sharer_shareinfo=d7824c571051c974225ce2ee4ce94292&sharer_shareinfo_first=d7824c571051c974225ce2ee4ce94292#rd)
公众号名称：小智PLM实施笔记
作者名称：李杰智
发布时间：2026-04-25 12:04
<span style='color:black'>背景：项目上有时候会出现针对属性设置权限的需求，以前老版本，针对这种情况，一般是通过在渲染中进行条件判断或者开发单独页面的方式来实现，下面介绍一下新版本中针对属性单独设置权限的功能。</span>
<span style='color:black'>环境：tc2512</span>
# <span style='color:#2B77BF;text-align:center'>1.启用属性级安全（ALS）支持(只有自定义属性才支持)</span>
<span style='color:black'>打开 BMIDE 中的目标自定义持久属性，点击「Property Constants」。</span>
<span style='color:black'>双击 Fnd0SupportAls 常量，将值设为 true。</span>
<span style='color:black'>前提：属性需为持久属性，且符合 ALS 的适用限制。</span>
![image1](a384ce09a4404159ae2196e1ef0240bd.png)
## <span style='color:#2B77BF'>ALS的适用限制</span>
![image2](474cfeb8e281498d9b90f30c7928015e.png)
![image3](88e226c405694642886f70159bb3f4cd.png)
# <span style='color:#2B77BF;text-align:center'>2.使用管理员登录awc，在访问管理器中创建属性组</span>
<span style='color:black'>进入访问管理器（Access Manager）的「Property Groups」页面。</span>
<span style='color:black'>点击「Add Property Group」，输入唯一名称，选择属性所属的业务对象类型。</span>
<span style='color:black'>在「Properties」列表中选择已启用 ALS 的自定义属性(可以选择多个属性)，点击「Add」完成创建。</span>
![image4](2c8b3f59033345b5b79413da18b459c2.png)
# <span style='color:#2B77BF;text-align:center'>3.定义权限控制规则</span>
<span style='color:black'>新建acl</span>
![image5](b0822fed1f294ce9a81b05e1a986d4fd.png)
<span style='color:black'>添加规则</span>
![image6](82dcbf2b5099493587c0a0f40d898e39.png)
![image7](769dd824d691422aa4de9eda5c6680df.png)
![image8](38ae4d23ec33484da57daaba5f706e7d.png)
![image9](aa8c1a16970f4ace9766a4f6f3fd4277.png)
![image10](9e1ad1deac4b4af28d46d1850c930185.png)
# <span style='color:#2B77BF;text-align:center'>4.验证权限设置</span>
![image11](114509e294e64ada90b29061f2b69c95.png)
![image12](48e7a7217f294d129e530709910da594.png)
<span style='color:#2B77BF'>附录：</span>
<span style='color:#2B77BF'>属性访问控制列表设置的详细配置解释：</span>
## <span style='color:#2B77BF'>Default settings 默认设置</span>
<span style='color:black'>When adding ALS entries to your rule tree, there are three options available for setting baseline permissions.在将 ALS 项添加到规则树时，有三种选项可以设置基线权限。</span>
## <span style='color:#2B77BF'>Restrict Write Access限制写入权限</span>
<span style='color:black'>Restricts write access forallproperties on the object, not just the ALS properties. This setting can be useful when an object is released and you want to grant write permissions to a few ALS properties, but no other properties. Check this permission to restrict access to all properties, and then assign write access in the table using property groups. Do not use this option in combination with Grant Write Access.限制对对象的所有属性的写入访问权限，而不仅仅是 ALS 属性。当对象被释放并且您想要授予对少数 ALS 属性的写入权限，但不授予其他属性的写入权限时，此设置可能有用。请检查此权限，以限制对所有属性的访问，然后使用属性组在表中分配写入访问权限。请勿将此选项与 授予写入访问权限 一起使用。</span>
## <span style='color:#2B77BF'>Grant Write Access授予写入访问权限</span>
<span style='color:black'>Grants write access for all ALS properties on the object. Properties that are not enabled for ALS are not affected.授予的权限可写入对象上所有 ALS 属性。未启用 ALS 的属性不受影响。</span>
## <span style='color:#2B77BF'>Grant Read AccessGrant Read 访问</span>
<span style='color:black'>Grants read access for all ALS properties on the object. Properties that are not enabled for ALS are not affected.授予对象上所有 ALS 特性的读取访问权限。未启用 ALS 的特性不受影响。</span>
## <span style='color:#2B77BF'>A simple example 一个简单的例子</span>
<span style='color:black'>The most basic configuration consists of a single custom entry on the rule tree, specifically for the business object containing the properties. You must add a named ACL to this line that grants read permissions, write permissions, or both, to the object.最基础的配置包括规则树上只有一个自定义条目，专门针对包含属性的业务对象。必须为该行添加一个名为 ACL 的条目，该条目授予对该对象的读取、写入或两者权限。</span>
![image13](05ac6a442c6048479fda5364f465d803.png)
<span style='color:black'>In this example, a custom-named ACL is assigned, granting read and write permissions only to the demo group for the object, and denying those permissions for everyone else.在本示例中，分配了一个自定义名称的 ACL，仅授予对象的 demo 组读取和写入权限，而拒绝其他所有人的权限。</span>
![image14](e99e616fb58c4880afad6385476b62b8.png)
<span style='color:black'>The Object Access Control List grants read and write permissions to the object. This list is required to control those permissions on ALS properties. Next, the Attribute Access Control List is used to control access to the property groups on that object.对象访问控制列表授予对对象的读取和写入权限。此列表是控制对 ALS 属性的这些权限所必需的。接下来， 属性访问控制列表用于控制对对象上属性组的访问。</span>
<span style='color:black'>In this example, the Grant Write Access and Grant Read Accesscheck boxes are both cleared, which means read and write permissions for all ALS properties are denied to everyone. Then, a property group is added to the table to grant read and write permissions only to the demo group.在本示例中，Grant Write Access 和 Grant Read Access 复选框都已清除，这意味着所有 ALS 特性读写权限均被拒绝给所有人。然后，向表中添加一个特性组，仅授予读写权限，只授予 demo 群组。</span>
## <span style='color:#2B77BF'>提示</span>
<span style='color:black'>Any rule tree entry evaluated above this line in the tree will ignore the Attribute Access Control List information of this line. For complete coverage, assign ALS ACLs at many places in your rule tree, based on your desired configuration.任何在树中高于此行的规则树条目都会忽略此行的 属性访问控制列表 信息。为了获得全面覆盖，根据您想要的配置，在规则树中的许多地方分配 ALS ACL。</span>
## <span style='color:#2B77BF'>Common entries for ALS ACLsALS ACLs 的常见条目</span>
<span style='color:black'>Following are some commonly used locations for adding ALS controls.以下是一些常用的用于添加 ALS 控件的位置。</span>
![image15](4b2726a9217c40929bcf9290d8bd5a44.png)
## <span style='color:#2B77BF'>Working</span>
<span style='color:black'>This entry in the rule tree applies to all objects that a user works with in the user interface. ALS ACLs added here control all objects by default.此规则树条目适用于用户在用户界面中工作的所有对象。这里添加的 ALS ACLs 会默认控制所有对象。</span>
## <span style='color:#2B77BF'>Projects</span>
<span style='color:black'>If an object is part of a Project, then any ALS ACLs added to lines below it, like Working, are ignored.如果对象是 项目 的一部分，则任何添加到其下方的线（例如 工作 ）的 ALS 权限都将被忽略。</span>
## <span style='color:#2B77BF'>Vault</span>
<span style='color:black'>If an object is part of a Vault, then any ALS ACLs added to lines below it, like Project, are ignored.如果一个对象是 Vault 的一部分，则在下面的行中添加的任何 ALS ACLs（如 Project）将被忽略。</span>

![image16](9d9f3410b1f34f3c83136538ee8112d2.jpg)
<span style='color:black'>Original 李杰智 小智PLM实施笔记 </span>
