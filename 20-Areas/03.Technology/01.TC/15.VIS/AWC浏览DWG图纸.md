---
title: AWC浏览DWG图纸
updated: 2026-06-05T23:49
created: 2021-05-21T11:16:30
---

AW
Client Extensions:
Active Workspace Vis (will be renamed in AW 4.3 to &#8220;Active Workspace Visualization 2D Viewer&#8221;)
Markup
Document Management Client

Server Extensions:
Active Workspace Document Management
Visualization Extension

Visualization Server
Visualization Server Manager

*来自 \<<https://support.sw.siemens.com/zh-CN/product/282219420/knowledge-base/PL8015909?pid=sc%3Asearch&pid_context=awc%20view%20dwg&index=content-external&audience=external>\>*

Visualization 2D viewer
DWG在AWC中的浏览：
1\. AWC_defaultViewerConfig.VIEWERCONFIG create a Value using \<DatasetType\>.Awp02dViewer=\<Reference\>
Example: ACADDWG.Awp02dViewer=DWG
a. remove other entries for the same Dataset Type

2\. VMU_Datasets add the Dataset Type name
Example: add ACADDWG

3\. VMU_FileSearchOrder add the Reference
Example: add DWG

4\. Restart the Visualization Server Manager

*来自 \<<https://support.sw.siemens.com/zh-CN/product/282219420/knowledge-base/PL8015909?pid=sc%3Asearch&pid_context=2D%20VIEWER&index=content-external&audience=external>\>*

