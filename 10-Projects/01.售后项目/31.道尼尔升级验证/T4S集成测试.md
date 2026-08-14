---
title: T4S集成测试
updated: 2026-07-29T13:49:50
created: 2026-07-05T17:04:35
tags:
  - 道尼尔
---

文档下发测试：没有单独下发文档的流程，直接放到了下发工艺路线时，同时下发工艺路线中关联的文档，即T4S_dir相关的mapping没有作用。
![image1](22a4f358e83b4c329979d6c6e27eec9f.png)

while executing
"Unmarshall myVar \[eval ::T4X::JAVASERVER::sExecute \$serverHandle with \$handle \$methodName \$args\]"
(procedure "tplet" line 17)
invoked from within
"tplet StatusName \$Document_Status_List getName"
(procedure "PLMXML_Data2SAP_RoutingOperation" line 691)
invoked from within
"PLMXML_Data2SAP_RoutingOperation \$TransactionId \$SequenceNumber \$ProcessOccurrence \$ProcessHeader \$Document"
(procedure "PLMXML_Data2SAP_RoutingSequence" line 85)
invoked from within
"PLMXML_Data2SAP_RoutingSequence \$TransactionId \$ProcessHeader 0 0 0 \$Document"
(procedure "::T4S::PLMXML2::ROUTING::CUSTOM::MAPPING::plmxml_data2sap_ro..." line 480)
invoked from within
"::T4S::PLMXML2::ROUTING::CUSTOM::MAPPING::plmxml_data2sap_routing \$TransactionId \$Document"
T4X: Reverse mapping to Teamcenter object returns with status: OK
T4X: Detailed list of Tcl error messages:
Invocation of the ReleaseStatus.257.~id66() method failed because no such method could be found
