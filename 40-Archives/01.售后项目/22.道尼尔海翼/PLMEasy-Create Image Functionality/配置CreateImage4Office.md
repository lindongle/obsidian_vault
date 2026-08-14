---
title: 配置CreateImage4Office
updated: 2026-07-05T17:09:19
created: 2026-07-05T17:09:19
---

1.  说明：
    1.  CreateImage4Office 队列与标准 CreateImage 队列仅略有不同：
        1.  CRServerEnv.bat 中用于支持 Office 导出设置的其他配置元素。
        2.  CRServer.pl 中的扩展，用于实现 PDF 创建以及生成的 PDF 的重新导入。
        3.  支持 PLMXML 报告（类似于 CreateImage4Reports），以防需要对 PDF 文件进行后处理。
            1.  目前不需要后处理选项，它在 CRServerEnv.bat 中被禁用
2.  CRServerEnv.bat
    1.  对标准 CRServerEnv.bat 进行了以下设置和扩展
3.  CRServer.pl
    1.  对标准 CRServer.pl 进行了以下设置和扩展
4.  PLMXML文件夹
    1.  <img src="c3891309123c4ca097cf8dd5d6bf30ba.png" alt="image1" />
<table>
<colgroup>
<col style="width: 14%" />
<col style="width: 85%" />
</colgroup>
<thead>
<tr>
<th>bin</th>
<th><p>包含自定义转换脚本以及用于启动基于 PLMXML 的后处理的主要 Apache ANT 构建文件。导出 PLMXML 文件后，将启动给定的自定义报告逻辑。此自定义逻辑应在报告文件夹中。例如：</p>
<p><img src="ad3f7b0e9293420a994158770a055411.png" alt="image2" /></p>
<p>这里的逻辑将搜索 reports\NoPostAction.xml。</p></th>
</tr>
</thead>
<tbody>
<tr>
<td>reports</td>
<td>包含自定义 Apache ANT 报告/逻辑的文件夹</td>
</tr>
<tr>
<td>stylesheets</td>
<td>包含报告使用的 XSLT 样式表的文件夹。</td>
</tr>
<tr>
<td>tools\java</td>
<td><p>其他基于 Java 的工具</p>
<p>ant-contrib-1.0b3.jar</p>
<p>avalon-framework-cvs-20020315.jar</p>
<p>batik.jar</p>
<p>bsf.jar</p>
<p>commons-logging-1.0.jar</p>
<p>dom4j.jar</p>
<p>fop.jar</p>
<p>js.jar</p>
<p>ojdbc14.jar</p>
<p>plmxml_report_helper.jar</p>
<p>poi-2.5.1-final-20040804.jar</p>
<p>saxon8.j</p></td>
</tr>
</tbody>
</table>
PLMXML 后处理当前在 CRServerEnv.bat 中被禁用。
5.  NoPostAction.xml
    1.  Apache ANT 文件 NoPostAction.xml 仅包含 PLMXML 数据的导出以及日志的调试消息
    2.  \<echo\>Got here!!! plmxml.file = \${plmxml.file}\</echo\>
