---
title: BAPI函数
updated: 2026-06-25T09:41:32
created: 2026-07-05T17:04:48
---

可以从T4S的BGS日志中获取SAP的BAPI函数
![image1](0c10155676144a0ba503911aa036117f.png)
物料：
<span style='background:#92D050'>BAPI_MATERIAL_SAVEDATA</span>
BOM：
<span style='background:#92D050'>CSAI_BOM_CREATE</span>
<span style='background:#92D050'>CSAP_MAT_BOM_MAINTAIN</span>
变更：
<span style='background:#92D050'>CCAP_ECN_CREATE</span>
CCAP_ECN_MAINTAIN
文档：
<span style='background:#92D050'>BAPI_DOCUMENT_CREATE2</span>
<span style='background:#92D050'>BAPI_DOCUMENT_CHANGE2</span>
BAPI_DOCUMENT_EXISTENCECHECK
文档BOM：
<span style='background:#92D050'>BAPI_DOCUMENT_CREATE2</span>
CSAP_DOC_BOM_CREATE
CSAP_MAT_BOM_MAINTAIN
工艺路线：
BAPI_ROUTING_CREATE
BAPI_ROUTING_EXISTENCE_CHECK
/TESISPLM/T4S_ROUTING_CHANGE2

与SAP 的二次开发接口
C:\PLM\Siemens\T4S_GS_ROOT\var\template\t4s\sap\TransportPackages
