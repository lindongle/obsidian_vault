---
title: AWC中扩展BOM行属性
updated: 2026-06-13T22:12:21
created: 2026-07-05T17:04:41
tags:
  - awc
  - bom
  - BOM
---

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><p><img src="18153745f14a4c16b3fbdab2a21c386a.png" alt="image1" /></p>
<p></p>
<p>I created two note types, one with LOV attached, the other without, the result in AWC as below.</p>
<p><img src="C:\Users\lindo\AppData\Local\Temp\个人\pandoc/media/image2.png" style="width:6.33333in;height:2.54167in" /></p>
<p>In my case, the configuration steps as below</p>
<p>1. Create a LOV “G2_note_lv1” with two values: value1, value2</p>
<p>2. Create two note type as below</p>
<p><img src="C:\Users\lindo\AppData\Local\Temp\个人\pandoc/media/image3.png" style="width:5.1875in;height:1.375in" /></p>
<p>3. Create two Runtime attributes on Awb0DesignElement object, g2_note_attr1, g2_note_attr2, and set each of the Awb0BOMToOccurrence property constants as below</p>
<p><img src="C:\Users\lindo\AppData\Local\Temp\个人\pandoc/media/image4.png" style="width:7.08333in;height:3.63542in" /></p>
<p><img src="C:\Users\lindo\AppData\Local\Temp\个人\pandoc/media/image5.png" style="width:7.17708in;height:3.5625in" /></p>
<p>4. Attach LOV G2_note_lv1 to Awb0DesignElement.g2_note_attr2</p>
<p><img src="C:\Users\lindo\AppData\Local\Temp\个人\pandoc/media/image6.png" style="width:5.78125in;height:3.63542in" /></p>
<p>5. Deploy the template</p>
<p>6. Export uiconfig with below command line</p>
<p>export_uiconfig -u=infodba -p=infodba -g=dba -file=C:\temp\occmgmt.xml -client_scope_URI="Awb0OccurrenceManagement"</p>
<p>7. Edit occmgmt.xml, add two column definitions as below</p>
<p><img src="C:\Users\lindo\AppData\Local\Temp\个人\pandoc/media/image7.png" style="width:11.10417in;height:1.61458in" /></p>
<p>8. Import uiconfig with below command line</p>
<p>import_uiconfig -u=infodba -p=infodba -g=dba -file=C:\temp\occmgmt.xml -client_scope_URI="Awb0OccurrenceManagement"</p>
<p>9. Start AW Client, check the result</p>
<p>域特定事例包含与特定域相关的属性。最终用户了解这些域特定属性并与之进行交互。这些属</p>
<p>性将从 BOMLine 或 ModelElement 类型映射到事例。此映射由业务建模器 IDE 中定义的属性常</p>
<p>数提供，并且属性常数都只限于 Awb0Element 类型。默认属性通过 Awb0Element 及其子类型上</p>
<p>提供，但是可以添加实施所需的定制属性。</p>
<p>必须将所有定制属性映射到通过 Awb0BOMToOccurrence 类型常数中指定的类型定义的属性。然后，</p>
<p>通过 Awb0BOMToOccurrence 属性常数实现属性映射。此属性常数的值可继承并可在任意级别替代。</p>
<p>例如，Awb0PositionedElement 业务对象的 awb0BoundingBox 属性具有值 bl_bounding_boxes。</p>
<p>此外，它具有针对 Awb0BOMToOccurrence 类型常数的值 BOMLine。因此，每当在</p>
<p>Awb0PositionedElement 对象上请求 awb0BoundingBox 属性时，都会从 BOM 行的</p>
<p>bl_bounding_boxes 属性调取值。</p>
<p></p>
<p></p>
<p>请参照以下AWC文档内容</p>
<p><a href="https://docs.plm.automation.siemens.com/tdoc/aw/4.0/aw_html_collection/#uid:xid920489">https://docs.plm.automation.siemens.com/tdoc/aw/4.0/aw_html_collection/#uid:xid920489</a></p>
<p><a href="https://docs.plm.automation.siemens.com/tdoc/aw/4.0/aw_html_collection/#uid:xid1477747">https://docs.plm.automation.siemens.com/tdoc/aw/4.0/aw_html_collection/#uid:xid1477747</a></p>
<p><a href="https://docs.plm.automation.siemens.com/tdoc/aw/4.0/aw_html_collection/#uid:xid920545">https://docs.plm.automation.siemens.com/tdoc/aw/4.0/aw_html_collection/#uid:xid920545</a></p>
<p><a href="https://docs.plm.automation.siemens.com/tdoc/aw/4.0/aw_html_collection/#uid:xid920547">https://docs.plm.automation.siemens.com/tdoc/aw/4.0/aw_html_collection/#uid:xid920547</a></p>
<p></p>
<p></p>
<p></p>
<p></p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>
