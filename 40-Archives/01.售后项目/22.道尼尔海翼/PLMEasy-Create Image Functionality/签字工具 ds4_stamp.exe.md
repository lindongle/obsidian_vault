---
title: 签字工具 ds4_stamp.exe
updated: 2026-06-13T15:39:36
created: 2026-07-05T17:05:02
---

1.  activePDF Toolkit
    1.  DSG 自定义标记实用程序是使用 activePDF 工具包作为基础实现的。该工具包安装在服务器上。 DLL 版本以及工具包的许可非常具体。自定义冲压工具的编译版本只有在安装了兼容版本的工具包后才能正常运行。许可与特定服务器相关联，只能在特殊情况下转移到另一台服务器（更多信息，请访问www.activepdf.com）。
    2.  因此建议直接在服务器本身上进行编译。为此目的，在此处安装了适用于 Windows 桌面的 Visual Studio 2013 Express。
    3.  安装更新版本的 activePDF 工具包时，应重新编译 ds4_stamp 程序并将其复制到 e:\siemensshare\tc10prodlocal\cri\office\CreateImage4Reports\bin\\
2.  ds4_stamp
    1.  Visual Basic 源代码和项目可以在 X:\CreateImage4Office\ds4_stamp 下找到。
    2.  当前实施中存在以下已知约束：
        1.  标记文本不能包含分号。
        2.  PDF-A 文件通常不能被标记。
        3.  不能为每个签字文本专门设置旋转。
        4.  该工具需要与编译时使用的版本完全匹配的许可版本 activePDF 工具包。
    3.  这些位置以点为单位定义。处理正 X 位置，以便从左边缘测量给定值。处理负 X 位置，以便从右边缘测量给定值。一个点的尺寸为 0.3527 毫米。提供了一个辅助 Excel 文件来帮助进行必要的配置。该工具接受以下参数：
<table>
<colgroup>
<col style="width: 35%" />
<col style="width: 36%" />
<col style="width: 27%" />
</colgroup>
<thead>
<tr>
<th><span style='color:black'><strong>Parameter</strong></span></th>
<th><span style='color:black'><strong>Description</strong></span></th>
<th><span style='color:black'><strong>Required / Default</strong></span></th>
</tr>
</thead>
<tbody>
<tr>
<td>-xpos</td>
<td><p>以点 (pt) 为单位的 X 位置的分号分隔列表。</p>
<p>处理正 X 位置，以便从左边缘测量给定值。处理负 X 位置，以便从右边缘测量给定值 此列表的长度应与 Y 位置的长度以及戳记文本相匹配</p></td>
<td>Required</td>
</tr>
<tr>
<td>-ypos</td>
<td><p>以点 (pt) 为单位的 Y 位置的分号分隔列表。</p>
<p>位置从底部边缘开始测量。</p>
<p>此列表的长度应与 X 位置以及戳记文本的长度相匹配。</p></td>
<td>Required</td>
</tr>
<tr>
<td>-stamps</td>
<td><p>以分号分隔的标记文本列表。</p>
<p>此列表的长度应与 X 和 Y 位置以及戳记文本的长度相匹配</p></td>
<td>Required</td>
</tr>
<tr>
<td>-input</td>
<td>定义输入 PDF 文件</td>
<td>Required</td>
</tr>
<tr>
<td>-output</td>
<td>定义输出 PDF 文件。这必须不同于输入文件。</td>
<td>Required</td>
</tr>
<tr>
<td>-font</td>
<td><p>定义字体样式。此字体样式必须安装在服务器上。</p>
<p>如果字体因文本而异，也可以定义为以分号分隔的列表。如果列表比标记文本短，则使用所有剩余标记文本中的最后一个条目。</p></td>
<td>Arial</td>
</tr>
<tr>
<td>-size</td>
<td><p>以磅 (pt) 为单位定义字体大小。</p>
<p>如果字体大小因文本而异，也可以定义为以分号分隔的列表。如果列表比签字文本短，则使用所有剩余签字文本中的最后一个条目。</p></td>
<td>12</td>
</tr>
<tr>
<td>-rotation</td>
<td>定义在 PDF 上加盖签字时使用的旋转以允许垂直或对角线签字</td>
<td>0</td>
</tr>
<tr>
<td><p>-from_page</p>
<p>-page</p></td>
<td><p>定义后，将不会签在给定页码之前的页面。</p>
<p>-page 也被接受以允许签字单个页面，并因此同时设置 -from_page</p></td>
<td>All pages</td>
</tr>
<tr>
<td>-to_page</td>
<td><p>定义后，给定页码之后的页面将不会被签字。</p>
<p></p></td>
<td><p>All pages *</p>
<p>(see -from_page)</p></td>
</tr>
<tr>
<td>-all_pages</td>
<td>所有页均签字</td>
<td>All pages</td>
</tr>
<tr>
<td><p>-auto_landscape</p>
<p>-auto_portrait</p></td>
<td>如果 PDF 是在旋转状态下创建的（即以纵向存储的横向 A0），则强制布局为横向或纵向。</td>
<td></td>
</tr>
</tbody>
</table>
4.  功能：给plmeasy生成的PDF，从tc中取签字信息签到PDF上；
![image1](413a46da3bb84ccdb18ab17fd599d1b1.png)
5.  程序路径：
    1.  ![image2](0b26ffaef60a4a58bc64afa565597570.png)

2.  ![image3](6d5720265c064c0eb79052686a219dcf.png)

3.  ![image4](9e877b9e318f4a58bafdceb33ec89eee.png)
6.  坐标及字体参数配置文件：
    1.  ![image5](0499805324f4438da00917e768a0ded9.png)

7.  ![image6](0b172e8e22244ca0aff737e8a32d2b90.png)
