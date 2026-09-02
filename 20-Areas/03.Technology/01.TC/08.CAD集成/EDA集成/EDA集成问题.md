---
title: EDA集成问题
updated: 2026-09-02T16:30:05
created: 2026-07-05T17:04:44
---

1、
The instance cannot be saved because it contains at least one attribute that violates a unique
The instance cannot be saved because it contains at least one attribute that violates a unique
The tag passed is not a valid tag
The tag passed is not a valid tag
The tag passed is not a valid tag
The tag passed is not a valid tag

----designator属性重复，或没有给值。

---Ps_Reference_Designator_Validation，验证同一父级下引用指示符符合某一规则时，必须是唯一的。

2、
com.teamcenter.edabase.EDAException: 不允许保存。Teamcenter 中不存在以下组件。
每个组件行包含零组件ID（名称）：引用指示符

Electrical Bell (Electrical Bell): LS0292, LS3020, LS8902
Feed-Through Capacitor (Feed-Through Capacitor): C0394, C1010, C1121, C2920

----EDA_CheckComponentExistence首选项设置为1后，对应item没有在系统中创建，或创建的item类型不是EDA_ComponentItemTypes首选项中包含的类型。
3、
![image1](63eeba364ca5402ab68e881792ecfad0.png)
Warning Valid component instances must contain the identifier Design Item ID
that is mapped to the Teamcenter itemID.
The following instances listed by their reference designators do not contain this
identifier. They are FDI, FD2, PCB 1 ， R22
These component instances will not be included in the BOM.
---意思是在元器件的属性参数中找不到Design Item ID，只能识别元器件属性中左上角的Description属性（左下角中属性Design Item ID是AD本地lib库中元器件的名称）。或如果是左上角的区域还是提示类似错误，则应该是选择了从PCB提取BOM，因为PCB中元器件的属性没有描述之类的参数。
4、
无法从PCB提取元器件BOM。
---元器件在PCB上位置摆放问题。直接从原理图上更新到PCB上可以提取。

5、添加辅料后，更新EDABOM，会不会把辅料更新没了？
--只更新元器件，其他类型不会从BOM上移除。
6、AD如何调用分类管理中元器件库？AD的本地元器件库如何与分类管理中进行库关联。

7、
PCABase及变量如何使用？
![image2](54ed26957c734574a08c63b2d3bb1aa3.png)
电路板装配基座PCABase是怎么出来的，有base，必定有变量。
![image3](63c0172f0fba408aa82e1f3a5368f305.png)

![image4](9ad61f2e1634450196ba8073af012ee4.png)
--需要在AD设计时安装变量。详见[[AD集成基础-变量管理]]

9、Altium属性映射在哪？
属性映射必须使用Gateway for EDA，否则只能通过修改C:\plm\Siemens\TeamcenterEDA1\eda\psw\altium下的setting.ini文件，并将part.itemid=Description，且AD中元器件参数的描述（description）中填写元器件编号。
Altium 和Cadence Orcad在使用Gateway for EDA进行属性映射时，不能使用通用的import_attr_mappings -file=test_attribute_mapping -u=infodba -p=infodba，必须用数据库源连接的方式，在表中建立属性映射。
10、AD中点击任何集成菜单提示以下错误。
![image5](f9c0275b2ce848d7935b51040a5b25ad.png)
解决：
打开Teamcenter.rcs文件，执行以下修改修改：把文本中的“%TCEDAECAD_ROOT%”字段，替换成环境变量“%TCEDAECAD_ROOT%”里的值
