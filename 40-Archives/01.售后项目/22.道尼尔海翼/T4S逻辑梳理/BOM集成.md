---
title: BOM集成
updated: 2026-07-29T13:49:46
created: 2026-07-05T17:05:02
---

1.  集成的Item父级类型：DS4_MPartRevision/DS4_PartRevision（T4S_BillOfMaterialHeaderTypeList），视图类型为view（T4S_BillOfMaterialTypeList）,T4S_BillOfMaterialOccurrenceNotes4view，读取的BOM行属性
2.  子件不能为DS4_MEEquipmentRevision，否则无法加载单位，且行项目号默认0000，数量默认1
3.  返回：将BOM下发流程的所有者/下发时间，分别写入父级Item版本对象ds4_SAPUpdateuser和ds4_SAPUpdatetimestamp属性中。
