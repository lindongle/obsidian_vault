---
title: 控制PDF生成的文件名
updated: 2026-06-05T23:59:36
created: 2026-07-05T17:04:44
---

首选项：
<span style='font-weight:bold;background:white'>TC_NX_PDF_create_pattern</span>
<span style='color:#212529'></span>

*From \< <https://docs.sw.siemens.com/documentation/external/PL20240507114647081/en-US/nx_help/nx/2412/nx_help/en-US/tcint/id1299560/xid1972498.html>\>*
<span style='background:white'>更新到 NX 版本 1980 后，更改了 pdf 文件格式的管理。</span>

<span style='background:white'>区别在于：</span>

<span style='background:white'>1. 1980 年之前，PDF 数据集直接附加在项目修订版下，从 1980 年起，可以选择是否必须附加在项目修订版下或绘图下。</span>

<span style='background:white'>2. 1980 年之前，PDF 数据集是使用名称规则 \${ItemID}\_\${RevisionID}\_PDF\_{1：2} 创建的，自 1980 年以来，它使用名称规则 \${ItemID}\_\${RevisionID}-PDF-{1：2}</span>

<span style='background:white'>3 创建。1980 年之前，PDF 数据集在保存时覆盖了以前的数据集，从 1980 年开始，附加了新数据集，以前的数据集也可用。</span>

<span style='background:white'>为了保持现有过程正常工作，一些客户询问要执行哪些作才能恢复系统的行为。</span>

**解决方案**
<span style='background:white'>引入此更改是为了增强对从 NX 导出的文档的管理。</span>
<span style='background:white'>解释引入的更改的文档页面是：“CGM 和 PDF 导出增强功能”</span>
[<span style='background:white'>https://docs.sw.siemens.com/en-US/product/209349590/doc/PL20200522120320484.whatsnew/html/xid1973004</span>](https://docs.sw.siemens.com/en-US/product/209349590/doc/PL20200522120320484.whatsnew/html/xid1973004)

<span style='background:white'>下面是关于恢复系统行为而要执行的作的简短说明。</span>

<span style='background:white'>1. 要将 pdf 附加到项目修订版中，而不是“UGPART 数据集”，请将其设置为“表现形式”或“规范”</span>

<span style='background:white'>2 来更改此设置。创建一个分配值为 \${ItemID}\_\${RevisionID}\_PDF\_{1：2}</span>
<span style='background:white'>3 的新 TC 变量TC_NX_PDF_create_pattern。要删除旧的 PDF 数据集并仅将最新的数据集附加到项目修订版，请将“-delete”参数添加到调用翻译器的命令行中：</span>

<span style='background:white'>示例：“</span>
<span style='background:white'>%UGII_BASE_DIR%\Ugmanager\export_ugdwgimages.exe” -all -delete -text=text -pdf -nocgm %\*</span>

*From \< <https://support.sw.siemens.com/zh-CN/knowledge-base/PL8575135>\>*

