---
title: 更新传输状态到SAP
updated: 2026-09-02T16:30:05
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
<th>Status</th>
<th><blockquote>
<p>- SAP transfer status. The following values are valid:</p>
<p>SKIPPED-&gt; the transfer was skipped</p>
<p>ERROR-&gt; the transfer was stopped by an error</p>
<p>UNKNOWN-&gt; the transfer was stopped by an unknown error</p>
<p>UPDATED_WITH_ERROR-&gt; the transfer was stopped by an minor error in one of the additional transfer steps</p>
<p>CREATED,CHANGED,UPDATED-&gt; and some other values are used for a successful transfer</p>
</blockquote>
<ul>
<li><p><strong>SAP_BillOfMaterial2TC_Object</strong></p></li>
<li><p>SKIPPED-&gt; the transfer was skipped</p></li>
<li><p>ERROR-&gt; the transfer was stopped by an error</p></li>
<li><p>EMPTY_BOM_ERROR-&gt; the transfer was stopped by an error</p></li>
<li><p>UNKNOWN-&gt; the transfer was stopped by an unknown error</p></li>
<li><p>UPDATED_WITH_ERROR-&gt; the transfer was stopped by an minor error in one of the additional transfer steps</p></li>
<li><p>CREATED,CHANGED,UPDATED-&gt; and some other values are used for a successful transfer</p></li>
</ul>
<blockquote>
<p></p>
<p></p>
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
<th><p>SAP transfer status. The following values are valid:</p>
<p>SKIPPED-&gt; the transfer was skipped</p>
<p>ERROR-&gt; the transfer was stopped by an error</p>
<p>UNKNOWN-&gt; the transfer was stopped by an unknown error</p>
<p>UPDATED_WITH_ERROR-&gt; the transfer was stopped by an minor error in one of the additional transfer steps</p>
<p>CREATED,CHANGED,UPDATED-&gt; and some other values are used for a successful transfer</p>
<p></p>
<p><strong>SAP_MaterialMaster2TC_Object</strong></p></th>
</tr>
</thead>
<tbody>
<tr>
<td><p>SAP transfer status. The following values are valid:</p>
<p>SKIPPED-&gt; the transfer was skipped</p>
<p>ERROR-&gt; the transfer was stopped by an error</p>
<p>UNKNOWN-&gt; the transfer was stopped by an unknown error</p>
<p>UPDATED_WITH_ERROR-&gt; the transfer was stopped by an minor error in one of the additional transfer steps</p>
<p>CREATED,CHANGED,UPDATED-&gt; and some other values are used for a successful transfer</p></td>
</tr>
</tbody>
</table>
