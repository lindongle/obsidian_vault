---
title: 卷、查询、ACL
updated: 2026-06-06T10:05
created: 2018-06-28T20:42:34
---

volume中会自动建立用户、组等开头的文件夹，取决于组织中对哪种对象设置的默认卷。
volume中的文件只会新建副本，不会被修改。

查询构建器中的显示缩进结果，勾选后，查到的对象不能展开，不显示前面的+号
![image1](7c050bd7f17b4eae8d807a8144915acd.png)

查询构建器中，选择查询条件时，不知道哪个字段，可以使用“查询提示”去找，点击上方的显示提示按钮。
![image2](474b49d3f7fc46c393b37e13d5630ac5.png)

![image3](77538564ba164f4b888325d1e15eb139.png)
通过关系查询特定条件的对象，根据引用者找到查询条件
![image4](4b7a6b137fd44826883fe867b007da55.png)
根据数据集名称反差引用它的零组件。
搜索类型选择ItemRevision，类属性中选择规格关系，打开后选择dataset，在定位到dataset的名称作为条件。
itemid在查询条件中可以输入多个值，用分号隔开。

![image5](0e0a0e6f9e4440a88f507ef7398f98c3.png)

![image6](b50a13614be047558502cc67732c04aa.png)

![image7](a2457b41fd624beda7a3666a6383f89e.png)
对象授权不一定优先级最高，取决于ACL（true）在规则树的位置。
![image8](b5ceecec0b9747ffac2ec9c3e8216b3a.png)
<span style='color:black'>==设置中对象流程中第一步可编辑，最后一步审批也可编辑，中间过程不可编辑，即流程模板中的acl与权限树的优先级。==</span>
<span style='color:black'>==分类中的acl走的那个规则树？==</span>
