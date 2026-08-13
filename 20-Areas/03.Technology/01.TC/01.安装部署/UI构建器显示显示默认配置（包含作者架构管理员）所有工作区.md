---
title: UI构建器显示/显示默认配置（包含作者/架构/管理员）所有工作区
updated: 2026-06-06T10:09
created: 2024-09-12T11:52:08
tags:
  - TC安装部署
---

![image1](11d5739904b3450890559fd7f88262c2.png)
<span style='font-family:Calibri'>1.   export_wsconfig -u=infodba -p=infodba -g=dba -file=</span><span style='font-family:Calibri;color:#FA0000'>C:\temp</span><span style='font-family: Calibri'>\ws.xml</span>«span style='font-family:"Microsoft YaHei"'»，不要用根目录«/span»
2.   Add the below lines in exported xml and save it.

\<?xml version="1.0" encoding="UTF-8" standalone="no" ?\>
\<Import\>
 \<Workspace id="TCAWWorkspace"\>
    \<WorkspaceMapping default="false" group="dba" role="DBA"/\>
 \</Workspace\>
\</Import\>
import_wsconfig -u=infodba -p=infodba -g=dba -file=C:\temp\ws.xml

*来自 \< <https://support.sw.siemens.com/zh-CN/knowledge-base/PL8522690>\>*

3.  
![image2](71d8dcfd85d34d17b5660230d77b5307.png)
4.   DEFAULT workspace get added in your AWC workspace.
![image3](6341e90885a44aad83cb250473ee1f9c.png)

*来自 \< <https://support.sw.siemens.com/zh-CN/knowledge-base/PL8522690>\>*
