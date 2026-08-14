---
title: Handler
updated: 2026-07-05T17:09:19
created: 2026-07-05T17:09:19
---

**TCPB-AH-createJobFile**
此操作处理程序始终与 Create Image Server 一起部署。它为CreateImage服务器生成作业（订单），以生成 CGM、HPGL、TIFF 等。
<img src="8c1f557a5b0f40c88b25543137fb88ab.png" alt="image1" />

<table style="width:100%;">
<colgroup>
<col style="width: 3%" />
<col style="width: 33%" />
<col style="width: 36%" />
<col style="width: 22%" />
<col style="width: 3%" />
</colgroup>
<thead>
<tr>
<th>参数</th>
<th>参数</th>
<th>值</th>
<th>默认值</th>
<th>是否必填</th>
</tr>
</thead>
<tbody>
<tr>
<td></td>
<td><span style='color:#FA0000'>-win_destination_path=</span> [win_destination_path]</td>
<td>如果未指定，则从首选项 (TCPB_CJF_DESTINATION_PATH) 中读取。可以使用路径变量 (%xxx%\...) 进行指定。如果此条目不存在，则使用 %TEMP%\job，如果未定义变量 %TEMP%，则使用 c:\temp\job。</td>
<td></td>
<td>否</td>
</tr>
<tr>
<td></td>
<td><p>-unix_destination_path=</p>
<p>[unix_destination_path]</p></td>
<td><p><span style='color:black'>如果未指定，则从首选项 (TCPB_CJF_DESTINATION_PATH) 中读取。可以使用路径变量 ($xxx/…) 进行指定。</span></p>
<p><span style='color:black'>如果此条目不存在，则使用 /tmp/job。</span></p></td>
<td></td>
<td>否</td>
</tr>
<tr>
<td></td>
<td><p><span style='color:#FA0000'>-options</span>=[approve | complete | delete |</p>
<p>STAMPTYPE=&lt;stamptype&gt;]</p></td>
<td><p>-options由 CreateImageServer 中的这些组件使用：</p>
<p>-tcpb_set_decision：approve | complete或delete ，</p>
<p>-Stamp：传输 stamp 配置（上图对应位tdd_pdf.xml文件）</p>
<p>-Custom-Convert：传输选项文件</p></td>
<td>空</td>
<td>否</td>
</tr>
<tr>
<td></td>
<td><span style='color:#FA0000'>-typ=</span>[&lt;dataset_type&gt; | Item | all ]</td>
<td><p>Item或数据集或所有类型，指定要为其生成作业文件的数据集类型。这里也可以使用“分号”来指定多个类型。</p>
<p>关键字“item”：生成包含Item信息的作业文件。如果不存在数据集，也会创建它。</p>
<p>“关键字“all”：为使用条目“-rel”的关系指定的所有数据集创建作业文件。注意：考虑了参数 -all_types！</p></td>
<td>UGPART;UGMASTER</td>
<td>否</td>
</tr>
<tr>
<td></td>
<td>-all_types=&lt; true | false &gt;</td>
<td>确定是为参数类型的所有数据集类型生成作业文件，还是仅为找到的第一个类型生成作业文件</td>
<td>false</td>
<td>否</td>
</tr>
<tr>
<td></td>
<td>-target=&lt; true | false &gt;</td>
<td>此参数确定是应为所有版本附件生成作业文件，还是仅为那些作为目标对象附加到工作流的附件生成作业文件。</td>
<td>true</td>
<td>否</td>
</tr>
<tr>
<td></td>
<td>-relation=</td>
<td>此关系确定应为其生成作业文件的目标版本附件。 &lt;all|以“;”分隔的有效 TC 关系列表&gt;</td>
<td>Specification</td>
<td>否</td>
</tr>
<tr>
<td></td>
<td>-file_flag=&lt; true | false &gt;</td>
<td>仅供 SPLM 内部使用</td>
<td>false</td>
<td>否</td>
</tr>
<tr>
<td></td>
<td>-file_only_pid=&lt; true | false &gt;</td>
<td>仅供 SPLM 内部使用</td>
<td>false</td>
<td>否</td>
</tr>
<tr>
<td></td>
<td>-status=&lt;status&gt;</td>
<td>如果将 Create Image Server 转换的数据重新导入到 Teamcenter 中，则此状态将分配给相应的数据集。这里的 IREV 值代表 ItemRevision 的状态。（转换后的数据集的发布状态）</td>
<td>空</td>
<td>否</td>
</tr>
<tr>
<td></td>
<td>-owner=&lt;owner&gt;</td>
<td>如果将由 Create Image Server 转换的数据重新导入到 Teamcenter 中，则该所有者组将分配给相应的数据集。这里的 IREV 值代表 ItemRevision 的所有者组。</td>
<td>空</td>
<td>否</td>
</tr>
<tr>
<td></td>
<td>-group=&lt;group&gt;</td>
<td>如果将由 Create Image Server 转换的数据重新导入到 Teamcenter 中，则该所有者组将分配给相应的数据集。这里的 IREV 值代表 ItemRevision 的所有者组</td>
<td>空</td>
<td>否</td>
</tr>
<tr>
<td></td>
<td>-additional_info=&lt; true | false | yes | no &gt;</td>
<td>确定是否将更多信息存储在作业文件中。此信息由以下参数更精确地指定</td>
<td>false</td>
<td>否</td>
</tr>
<tr>
<td></td>
<td>-user= [ SIGNOFF | JOBOWNER | true | false ]</td>
<td>输出用户信息，其中可以使用以下关键字：&lt;SIGNOFF | JOBOWNER&gt; true 和 false 仅出于与旧版本处理程序兼容的原因才被允许。此处，true 与 SIGNOFF 含义相同</td>
<td>false</td>
<td>否</td>
</tr>
<tr>
<td></td>
<td>-mailto={ true | false }</td>
<td>人员的电子邮件地址（工作文件中的 ASCII 文本）</td>
<td>false</td>
<td>否</td>
</tr>
<tr>
<td></td>
<td>-city={ true | false }</td>
<td>人员所在城市（工作文件中的 ASCII 文本）</td>
<td>false</td>
<td>否</td>
</tr>
<tr>
<td></td>
<td>-jobtype=&lt;user defined string&gt;</td>
<td>作业类型字符串（作业文件中的 ASCII 文本）</td>
<td>空</td>
<td>否</td>
</tr>
<tr>
<td>放置位置</td>
<td>任何任务的“开始”上</td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>限制</td>
<td>当使用 –options=approve 时，审批流程仅支持直接在 Root 任务（第一级）中定义且不在较低级别任务中定义的 Review 任务。</td>
<td></td>
<td></td>
<td></td>
</tr>
</tbody>
</table>
TCPB-AH-storeSignoffData
去签字/日期信息放到流程目标的版本属性中；
![image2](78283c5eafd34f63bacfca81eaac5b62.png)
支持多人会签
![image3](aa52ddbd9f.png)

![image4](229484c5d1d44ba0b27dedc462d2c30a.png)

