---
title: 文档管理-office online
updated: 2026-06-06T10:08:54
created: 2026-07-05T17:04:41
---

在线查看
转pdf

问题
1、AWC上传300M PDF文件，提示服务器错误，超时。
2、

安装：
1、
• 服务器增强功能→基于 Java EE 的服务器管理器（仅可用于 4 层胖客户端安装）、全文搜
索引擎、样本文件和安全服务。
• 扩展→企业知识基础→Teamcenter Client for Microsoft Office、胖客户端的调度程序客户
端和胖客户端的渲染文档
• 扩展→内容和文档管理→Acrobat/Reader 插件

2、添加BMIDE模板，docmgt_samples.xml。
3、dispatcher
• 文档管理 (DocMgt) 转换器→RenderMdtTranslator 和 BatchPrint
• TcVis 转换器→PreviewService
设置：
1、修改首选项：
AWC_defaultViewerConfig.VIEWERCONFIG：
SEARCHORDER.DocumentRevision=TC_Attaches, IMAN_reference, **Fnd0DocPageTypeRel**
**2、**在 Active Workspace 通用查看器中启用 PDF 流式处理（
。当您对PDF 文件进行流式处理时，文件的每一页在下载后即可显示。因此，无需等待整个PDF 下载完成便可查看特定页。）
修改D:\Siemens\Teamcenter11\fsc\FSC_FAW01_infodba.xml文件，将属性FSC_DoNotCompressExtensions行的注释去掉，在value中增加pdf。保存，并重启fsc服务。

![image1](30e5c50dd61c4a7d8302ebe43e4ed29d.png)
3、
通过将文件拖至文件夹在 Active Workspace 中创建文档版本
默认情况下，当文件被拖至文件夹时，它们被创建为独立的数据集，并附加到文件夹。此行为可以
更改为创建文档版本，其中包含文件作为附件。根据 Dma1CreateDocOnDrop 首选项的值，文档版本
（具有文件附件）可以手动或自动创建。此首选项的默认值为空白。从空白更改该值会将默认行为
更改为当文件被拖至文件夹时创建文档。但是，这不会更改当文件被拖至非文件夹对象时的默认行
为。将文件拖至非文件夹对象会创建独立数据集，其中包含文件作为附件。
自动创建文档版本
可以将默认行为更改为当文件被拖至文件夹时，自动创建文档版本并向其附加文件（作为数据
集）。为此，将 Dma1CreateDocOnDrop 首选项的值设为必须创建的对象类型的内部名称（如
item）。如果设为 Item，当文件被拖至文件夹时，会创建零组件，拖放的文件会附加到零组件版
本，而零组件版本会附加到文件夹。

