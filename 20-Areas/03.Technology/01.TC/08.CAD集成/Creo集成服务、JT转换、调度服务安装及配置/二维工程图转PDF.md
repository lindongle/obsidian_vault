---
title: 二维工程图转PDF
updated: 2026-06-06T10:05:38
created: 2026-07-05T17:04:44
---

二维工程图转PDF
2018年11月12日
9:46
在IPEM.xml文件中加入
\<auxiliary_file cad_type="DRW" direction="cadtopdm"\>
\<pdm_location named_ref="PDF_Reference" pdm_type="PDF"/\>
\<file_name pattern="{cad_directory}/{cad_name,lower}\*.pdf"/\>
\<cadtopdm_control label="Save PDF Files" /\>
\<pdf sheets="current"/\>
\</auxiliary_file\>

![image1](e496d89397fc40afa02ab45fe505f0bb.png)

