---
title: BOM下发属性映射
updated: 2026-09-02T16:30:05
created: 2026-07-05T17:04:48
---

BOM下发属性映射
2019年5月22日
8:37
Mapping文件：E:\PLM\Siemens\T4S\var\mmap\t4s_mapping_config\t4s_bom_mapping.sd
要选择版本view对象--T4S网关--物料清单（选择版本零组件显示灰色。
可以设置以下内容：
1）配置BOM头和BOM行属性映射（取属性值、设置默认值、设置固定值）
2）检查物料是否存在
3）是否允许空BOM创建
4）配置数量为空时默认为1
5）可以设置位置号自动生成或从TC获取，获取时位置号要求是四位，不足四位补0（配置格式），避免影响SAP的排序。
6）可以设置数量强制保留3位小数。
7）使用逗号代替数量中的点
8）如果没有view对象，不会触发T4S接口
使用OOTB的单位，需要对以下属性设置可写。
![image1](eef44435adc44dc4bd1fffac424661bc.png)
首选项设置：设置运行映射的对象类型、关系、属性。控制映射的范围，以保证事务处理性能。
T4S_BillOfMaterialOccurrenceNotes4view
添加Bomline属性（自定义的复合属性或新建的注释类型），如BOM单位类型为Typereference，无法直接获取，BOM单位可以取物料基本单位或自定义注释类型（BOM行属性），如果使用OOTB的基本单位，一旦物料被放入BOM，则该单位将无法修改。
![image2](e94d142a9ace4be2bdfb2c487caebefc.png)

T4S_BillOfMaterialTypeList
设置BOM视图允许下发的类型。
[t4s_bom_mapping.sd](7daebffcb9c04e2792123973473c4d96.sd)
物料必须维护工厂，否则无法创建BOM。
BOM创建，必须先创建对应更改单号
T4S_BillOfMaterialHeaderTypeList
配置可以下发的对象父级类型，不配置可能出现流程下发BOM不起作用，也没有日志。

**T4S_BOM4RelationTypeList，配置可以下发SAP的BOM子组件(关系类型时使用，非BOM子件)的Item类型**

设置删除SAP的空BOM。
set ::SAPDat(Bom:Parameter:allowEmptyBomTransfer) YES
set ::SAPDat(Bom:Parameter:deleteEmptyBom) YES
set ::SAPDat(Bom:Parameter:skipEmptyBomTransfer) NO ;#default value

regsub -all {\\} \$SAPQuantity {,} SAPQuantity; \# Caution: there may be the need to format it in a different way, depending on the SAP system!
将点替换为逗号，匹配千分位格式，根据需要可以注释掉，不注释可能出现数量\*100的情况

