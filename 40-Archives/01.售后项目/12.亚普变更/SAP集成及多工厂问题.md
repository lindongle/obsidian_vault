---
title: SAP集成及多工厂问题
updated: 2026-06-06T10:08
created: 2021-11-02T09:09:25
---

SAP集成及多工厂问题
2021年11月2日
9:09
1.  工厂号维护，已确认在BOMView视图版本上维护工厂编号，下发SAP时根据工厂编号发送到不同的工厂，去除原虚拟顶层；
2.  T4S与开发接口的选择；--待定
3.  时间有效性问题：在TC的View视图版本上维护有效起始日期后，需要关联更改单才能发到SAP中进行更新（SAP修改有效日期的规则），但目前MBOM有些情况不走工程变更流程，讨论：
    1.  BOM变更是否使用更改单及使用TC更改单或接口自动创建更改单；
<span style='color:#FA0000'>--业务确定，影响接口方式（开发/标准T4S，可研究T4S接口中自动创建更改单）</span>
<span style='color:#FA0000'>方案1：使用TC更改单进行下发，业务操作及流程规范比较复杂；</span>
<span style='color:#FA0000'>方案2：自动创建更改单进行下发，接口调整比较复杂；</span>
2.  提前给出的断点切换时间不一定准确，对于精确变更不适用（情况较少）；--业务确定，根据目前的切换状态判断；
3.  快速变更流程目前只使用PR对象进行审批（不走ECR和ECN），且流程与正常PR一致，考虑是否可以使用单独的ECN对象，单独配置审批流程；
<span style='color:#FA0000'>--业务确定单独创建ECN，单独一套工作任务清单BOM，单独设置快速变更审批流程，并需跟工艺讨论目前未通过更改单直接修改BOM的场景是否可纳入快速变更流程进行管理；</span>
4.  新增数量优化，调整目前PBOM单独新增的自定义组件数量为OOTB数量。需解决两个问题：
    1.  因SAP对于小数保留3位有效数字后，部分数量非常小的物料数量为0的情况；
        1.  目前系统在BOM行中增加自定义的基本数量和组件数量，进行组件数量\*基本数量的计算，且组件数量为String类型（注释类型），无法控制字符格式，然后下发SAP，OOTB数量不变也未关注。
        2.  建议调整基本数量到VIEW版本上维护，取消自定义组件数量，使用OOTB数量，在视图上进行基本数量的扩大，TC中数量不变（按单产品维护，避免对后续三维工艺等应用的影响），下发时将数量自动乘以基本数量下发，同时基本数量下发到SAP的BOM抬头属性“基本数量”中。
        3.  方案问题：由于数量只支持正整数和正小数，对于1/3无法支持，导致数量+基本数量后计算不准确，如3个物料需要1个纸箱，对于一个产品只需1个物料，基本数量维护3，但数量维护0.3333后，乘积为0.9999，无法等于1；
<span style='color:#FA0000'>--业务/IT/实施方共同讨论如何解决；</span>
<span style='color:#FA0000'>方案：下发SAP时，将乘积使用round(arg)四舍五入取整函数进行转换（需确定基本数量不为1时，乘积为整数）；</span>
<span style='color:#FA0000'>方案：不管包材，P/M；</span>
<span style='color:#FA0000'></span>
<span style='color:#FA0000'>PBOM：产品总成ZZ000023</span>
<span style='color:#FA0000'>焊接XXX</span>
<span style='color:#FA0000'></span>
<span style='color:#FA0000'>MBOM：产品总成 10011001X3（自制件）--工单</span>
<span style='color:#FA0000'>箱子12040001 （1）</span>
<span style='color:#FA0000'>焊接XXX（3）</span>
1.  目前存在数量为负数的情况（回料，即余料重新熔炉加工为相同物料且未做入库，BOM中原料A号数量为正，回料B号数量为正，回料B号数量为负三行BOM），需业务讨论产生的原因及避免的方法；
![image1](6e339dbd2c6d4e848cdd3686ba8ff991.png)
<span style='color:#FA0000'>--如无法避免负数的情况</span>
<span style='color:#FA0000'>方案1：负数回料行填写整数，单独加一列打负数标识，下发SAP时根据负数标识自动将此行数量转为负数下发；</span>
<span style='color:#FA0000'>方案2：保留现状，即通过自定义的组件数量进行维护，做调整1）将现有组件数量（注释类型，文本行）属性隐藏，新定义double类型的组件数量，控制填写规范；2）开发保存后处理，保存时将组件数量更新到OOTB数量中，负数情况更新为0；</span>
<span style='color:#FA0000'></span>
<span style='color:#FA0000'>**组件数量问题：**</span>
1.  <span style='color:#FA0000'>负数问题及分数问题保持现有业务；</span>
2.  <span style='color:#FA0000'>初始化PBOM，自动带过DBOM数量到PBOM（OOTB数量和自定义的组件数量）；</span>
3.  <span style='color:#FA0000'>移除原组件数量，自定义double的组件数量（验证支持负数--已验证，支持）；</span>
4.  <span style='color:#FA0000'>开发菜单（脚本）对历史组件数量的迁移；</span>
<span style='color:#FA0000'>**物料属性新增下发：**</span>
<span style='color:#FA0000'>梳理需下发的属性字段及与SAP的字段映射；--本周完成</span>
<span style='color:#FA0000'>**BOM时间有效期及启用更改单问题：**</span>
<span style='color:#FA0000'>亚普内部讨论确定；--本周完成；</span>
<span style='color:#FA0000'>**接口方式：T4S（BOM更改必须使用更改单）或开发问题：**</span>
<span style='color:#FA0000'>T4S所有接口均需重新开发及配置，并新增更改单接口，开发调整需调整现有BOM接口及新增更改单接口。亚普内部讨论确定；--本周完成；</span>
<span style='color:#FA0000'></span>
<span style='color:#FA0000'></span>
