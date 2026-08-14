---
title: Rulestream
updated: 2026-06-05T22:11:41
created: 2026-07-05T17:04:59
---

设置各个零部件规则，设置零部件间的坐标位置及配合关系，同步到TC，调用TC的零件图模型，自动生成装配。
根据Rulestream中设置的工艺与设计BOM的标准拆分关系，自动在TC中形成PBOM
基于OOTB的工艺过程模板，进行克隆。

模块件（客户需求的）、非模块件（部件，无订单价值的、部分产品坐标相对固定的）

RS中维护模块和模块的接口关系；
单模块下的其他零件，提前需要将模型及装配关系画好；

模块实体规格表定义编码规则；

现在TC中产生模块实体编号；TC提供模块三维模型；模型之间的约束和规则从RS中定义；

<span style='color:red'>1、在TC中定义空间布局模板（模块之间的布局，模板）与模型实例（每个模块对应的标准零组件模板和ETO零组件模型，及模块实体），在RS中定义模型实例的选项及与模板的对应规则。</span>
<span style='color:red'>2、当在RS中进行选配时，加载到NX中，NX会调用TC的空间模板（如ABCDEF的空间布局位置，A模块可能有A1A2A3几种实例选择，但都遵循这个模板所固定的空间布局及约束关系，第2个模板可能也是ABCDEF，只是空间布局位置会变化，各模块的接口点会变化）、每个选项对应的实例的模型关系调用已经实例后的标准零件或ETO零件（模型实例）进行加载，并引用RS中已经建立的约束规则对模型进行自动装配，如果引用的标准零件不允许修改，如果为ETO零件，则可以修改及保存；</span>
<span style='color:red'>3、装配后的号会在RS中维护的命名规则（与TC一致）自动创建；</span>
<span style='color:red'>4、如果有中间虚拟层可以添加；</span>
<span style='color:red'>5、模板库</span>
<span style='color:red'></span>
<span style='color:red'>在TC中提前维护**模块实体和模板**；</span>
<span style='color:red'>RS配置四层地址</span>
<span style='color:red'>在TC客户端要配置TC_DATA/TC_ROOT/FMS_HOME，其中TC_DATA是需磁盘共享映射；</span>
<span style='color:red'>模板可以基于整机或系统；</span>
<span style='color:red'></span>
