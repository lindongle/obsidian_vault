---
title: 配置CreateImage4Report
updated: 2026-06-13T15:32:53
created: 2026-07-05T17:05:02
---

1.  说明：
    1.  CreateImage4Office 队列与标准 CreateImage 队列仅略有不同：
        1.  CRServerEnv.bat 中的其他配置元素支持 Office 导出设置以及 PLMXML 报告/处理。
        2.  支持 PLMXML 报告/处理。
2.  CRServerEnv.bat
    1.  与上面 CreateImage4Office中详述的更改相比，CRServerEnv.bat 中只有 2 个不同
    2.  <img src="ce9588a51f.png" alt="image1" />
3.  XSLT Stylesheet: plmxml2stamp.xsl
    1.  XSLT 样式表转换 PLMXML 文件，以便动态确定用于标记和导入标记 PDF 的参数，并可用于解析。
    2.  样式表使用当前导出文件夹作为参数 base_dir（通常为 %CR_ROOT_DIR%\temp\cr_job\_\<timestamp\>）。附加参数当前使用它们的默认值：
        1.  config_file：stamp_configs.xml 与样式表在同一文件夹中
        2.  pdf_type：PDF 文档的数据集类型 (PDF)
        3.  pdf_ref：PDF 文档的 NamedRef 类型 (PDF_Reference)
        4.  pdf_relation：ItemRevision 和数据集之间的关系 (IMAN_specification)
        5.  static_stamp_args：静态参数对于 ds4_stamp 工具 (-page=2)
        6.  static_import_args：tcpb_import_file 工具的静态参数 (-status=IREV -owner=IREV de=c)
    3.  为每个导出的 PDF 文档读取 Item-Id、Revision-Id、Dataset-Name 和 File-Name。然后查询配置文件 stamp_configs.xml 中的条目。当为Dataset-Type、Revision-Type 和属性名称的当前组合找到条目时，属性内容、位置（X、Y）以及字体详细信息（样式和大小）将添加到参数列表中。标签文本（如果找到）也将被处理。
    4.  例如，当存在并设置 ds4_approvername、ds4_approverfunction、ds4_approverdate 和 ds4_approverdepartment 时，输出可能类似于以下摘录：
<img src="C:\Users\lindo\AppData\Local\Temp\东乐 的笔记本\pandoc/media/image2.png" style="width:6.59375in;height:0.78125in" />
4.  stamp_configs.xml
    1.  该 XML 文件允许定义冲压配置，而无需直接编辑 XSLT 文件。
格式如下：
<img src="C:\Users\lindo\AppData\Local\Temp\东乐 的笔记本\pandoc/media/image3.png" style="width:6.5625in;height:0.67708in" />

<img src="C:\Users\lindo\AppData\Local\Temp\东乐 的笔记本\pandoc/media/image4.png" style="width:9.34375in;height:2.6875in" />

<table style="width:79%;">
<colgroup>
<col style="width: 17%" />
<col style="width: 14%" />
<col style="width: 47%" />
</colgroup>
<thead>
<tr>
<th>Tag</th>
<th>Attribute</th>
<th>详细信息</th>
</tr>
</thead>
<tbody>
<tr>
<td>&lt;defaults&gt;</td>
<td>font</td>
<td>定义字体样式的默认值。当个别 &lt;stamp&gt; 或 &lt;label&gt; 未指定字体样式时使用此字体。</td>
</tr>
<tr>
<td></td>
<td>size</td>
<td>以磅 (pt) 为单位定义字体大小的默认值。当单个 &lt;stamp&gt; 或 &lt;label&gt; 未指定字体大小时使用此大小。</td>
</tr>
<tr>
<td><p>&lt;stamp&gt;</p>
<p>&lt;label&gt;</p></td>
<td>dstype</td>
<td>必需的。定义“*”以将此配置应用于所有数据集类型或此条目适用的特定数据集类型。</td>
</tr>
<tr>
<td></td>
<td>revtype</td>
<td>必需的。定义“*”以将此配置应用于所有Item版本类型或此条目适用的特定版本类型。</td>
</tr>
<tr>
<td></td>
<td>attribute</td>
<td><p>必需的。定义此条目适用的属性。</p>
<p>标签仅在填充属性时写入。要覆盖此默认行为，应使用关键字 _ALWAYS_。</p></td>
</tr>
<tr>
<td></td>
<td>xpos</td>
<td>必需的。定义此签名的 X 位置（以点 (pt) 为单位）。</td>
</tr>
<tr>
<td></td>
<td>ypos</td>
<td>必需的。定义此签名的 Y 位置（以点 (pt) 为单位）。</td>
</tr>
<tr>
<td></td>
<td>font</td>
<td>定义当前文本的字体样式</td>
</tr>
<tr>
<td></td>
<td>size</td>
<td>以磅 (pt) 定义当前文本的字体大小</td>
</tr>
<tr>
<td>&lt;stamp&gt;</td>
<td>format</td>
<td><p>date 德国日期格式 (DD.MM.YYYY)</p>
<p>time 使用 HH:MI:SS 格式的时间</p></td>
</tr>
<tr>
<td>&lt;label&gt;</td>
<td>text</td>
<td>必需的。定义标签文本。当引用的属性被设置时，该文本将被标记。</td>
</tr>
</tbody>
</table>
使用提供的辅助 Excel 文件，无需广泛的 XML 专业知识即可维护这些条目。
5.  Apache ANT 报告：StampPdf.xml
    1.  Apache ANT 支持以 XML 格式执行脚本。该脚本实现了以下主要步骤：
        1.  将 PLMXML 文件转换为 ANT 属性列表
            1.  使用 plmxml2stamp.xsl。
            2.  当前 CreateImage 临时文件夹用作 base_dir 参数。
        2.  属性值中的任何“\\字符都将替换为“\\”
        3.  读取属性文件。
            1.  DS4_PDF_COUNT 已读取。
            2.  为每个 PDF 数据集设置 DS4_STAMP_n（n=计数器）
            3.  为每个 PDF 数据集设置 DS4_IMPORT_n（n=计数器）
        4.  对于每个包含戳记信息的 PDF 数据集，执行以下步骤：（对PDF签字并上传）
            1.  带有来自 DS4_STAMP_nd参数的s4_stamp.exe
            2.  带有来自 DS4_IMPORT_n 参数的 tcpb_import_file.exe
        5.  成功处理的结果是在 Teamcenter 中提供加盖 PDF。CreateImage4Reports 中的默认机制会在临时目录中创建一个 custom_convert.log。此日志文件中包含许多成功或失败处理的详细信息

