---
title: 更新传输状态到SAP
updated: 2026-06-05T23:29:49
created: 2026-07-05T17:04:48
---

Mapping文件中的反写方法proc SAP_XXX2TC_Object
::T4X::TC::MAPPING::storeReverseMappingAttribute DocumentInfoRecord \$ItemRev sec8SapComment \$Status

**SAP_DocumentInfoRecord2TC_Object**

<table>
<colgroup>
<col style="width: 33%" />
<col style="width: 66%" />
</colgroup>
<thead>
<tr>
<th><span style='color:#602020'>Status</span></th>
<th><blockquote>
<p><span style='color:black'>- SAP transfer status. The following values are valid:</span></p>
<p><span style='color:black'>SKIPPED-&gt; the transfer was skipped</span></p>
<p><span style='color:black'>ERROR-&gt; the transfer was stopped by an error</span></p>
<p><span style='color:black'>UNKNOWN-&gt; the transfer was stopped by an unknown error</span></p>
<p><span style='color:black'>UPDATED_WITH_ERROR-&gt; the transfer was stopped by an minor error in one of the additional transfer steps</span></p>
<p><span style='color:black'>CREATED,CHANGED,UPDATED-&gt; and some other values are used for a successful transfer</span></p>
</blockquote>
<ul>
<li><p><strong>SAP_BillOfMaterial2TC_Object</strong></p></li>
<li><p><span style='background:white'>SKIPPED-&gt; the transfer was skipped</span></p></li>
<li><p><span style='background:white'>ERROR-&gt; the transfer was stopped by an error</span></p></li>
<li><p><span style='background:white'>EMPTY_BOM_ERROR-&gt; the transfer was stopped by an error</span></p></li>
<li><p><span style='background:white'>UNKNOWN-&gt; the transfer was stopped by an unknown error</span></p></li>
<li><p><span style='background:white'>UPDATED_WITH_ERROR-&gt; the transfer was stopped by an minor error in one of the additional transfer steps</span></p></li>
<li><p><span style='background:white'>CREATED,CHANGED,UPDATED-&gt; and some other values are used for a successful transfer</span></p></li>
</ul>
<blockquote>
<p><span style='color:black'></span></p>
<p><span style='color:black'></span></p>
</blockquote></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

**SAP_ChangeMaster2TC_Object**
<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><p><span style='color:black'>SAP transfer status. The following values are valid:</span></p>
<p><span style='color:black'>SKIPPED-&gt; the transfer was skipped</span></p>
<p><span style='color:black'>ERROR-&gt; the transfer was stopped by an error</span></p>
<p><span style='color:black'>UNKNOWN-&gt; the transfer was stopped by an unknown error</span></p>
<p><span style='color:black'>UPDATED_WITH_ERROR-&gt; the transfer was stopped by an minor error in one of the additional transfer steps</span></p>
<p><span style='color:black'>CREATED,CHANGED,UPDATED-&gt; and some other values are used for a successful transfer</span></p>
<p><span style='color:black'></span></p>
<p><strong>SAP_MaterialMaster2TC_Object</strong></p></th>
</tr>
</thead>
<tbody>
<tr>
<td><p><span style='color:black'>SAP transfer status. The following values are valid:</span></p>
<p><span style='color:black'>SKIPPED-&gt; the transfer was skipped</span></p>
<p><span style='color:black'>ERROR-&gt; the transfer was stopped by an error</span></p>
<p><span style='color:black'>UNKNOWN-&gt; the transfer was stopped by an unknown error</span></p>
<p><span style='color:black'>UPDATED_WITH_ERROR-&gt; the transfer was stopped by an minor error in one of the additional transfer steps</span></p>
<p><span style='color:black'>CREATED,CHANGED,UPDATED-&gt; and some other values are used for a successful transfer</span></p></td>
</tr>
</tbody>
</table>
