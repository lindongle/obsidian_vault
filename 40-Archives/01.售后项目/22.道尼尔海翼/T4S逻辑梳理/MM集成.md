---
title: MM集成
updated: 2026-06-06T10:09
created: 2023-10-09T11:08:55
---

1.  集成的Item类型：四种类型DS4_MPartRevision(ZMPG自制半成品)/DS4_MEEquipmentRevision（FHMI生产资源工具）/DS4_ToolRevision（FHMI生产资源工具）/DS4_PartRevision（ROH原材料/HALB采购半成品），通过首选项：T4S_MaterialMasterTypeList控制
2.  从TC中对于上述四个对象的所有属性、对应的Item对象的所有属性、版本主属性表单基本属性、Item主属性表单基本属性，通过首选项T4S_MaterialMasterMapping4\*控制
3.  属性映射：详见映射表。根据类型不同，属性映射不同，除基本视图部分数据读取TC数据，其他视图或属性均为默认值或基于SAP特定物料的属性复制而来。
4.  返回：将物料下发流程的所有者/下发时间/状态，分别写入Item版本对象ds4_SAPInitialuser/ds4_SAPInitialtimestamp/ds4_SAPTransferstatus属性中（汇总中的SAP Attributes标签页中），如果ds4_SAPInitialuser有值，则更新到ds4_SAPUpdateuser属性中，如果ds4_SAPInitialtimestamp有值，则更新到ds4_SAPUpdatetimestamp属性中。
![image1](737af950dc024eafbc51ba67a62f7436.png)
