---
title: 如何导出/导入 Transfer Mode(PLMXML管理器)
updated: 2026-06-06T10:08
created: 2020-06-03T11:47:37
---

**如何导出/导入 Transfer Mode**
1.  假设有A 和B 两个Teamcenter 系统
2.  在系统A 中，用户对ConfiguredDataExportDefault 传递模式进行了修改，现在需要将B 系统中的OOTB 配置恢复到系统A。

<table style="width:86%;">
<colgroup>
<col style="width: 5%" />
<col style="width: 80%" />
</colgroup>
<thead>
<tr>
<th></th>
<th></th>
</tr>
</thead>
<tbody>
<tr>
<td></td>
<td><p><img src="e6adc89c0628b.jpg" alt="image1" /></p>
<p></p></td>
</tr>
</tbody>
</table>
作为测试，在PropertySet 添加一条属性定义
3.  在系统B，创建下面的查询
![image2](f9fdf8f7eb40499396d3145321b44648.jpg)
4.  系统B，在报告构建器模块，新建-报告，创建Summary Report
![image3](5b888eb8fb8a4ff080ffe98d14422c08.jpg)
5.  系统B, Tools \>\> Report \>\> Report Builder Reports
选择TransferModes

|  |  |
|----|----|
|  | ![image4](d5ff87a58a2e422cac5bc241db7a8181.jpg) |
创建数据集，然后点击完成
6.  下载XML，并拷贝至系统 A ，放到C盘根目录
![image5](fa31646e87394da2823cfd560cb98d5d.jpg)
7.  系统A，运行下面命令导入
plmxml_import -u=infodba -p=infodba -g=dba - xml_file="c:\ConfiguredDataExportDefault.xml" - transfermode=incremental_import -import_mode=overwrite
8.  导入成功后，重启Teamcenter，检查 PLMXML 配置
![image6](10976b14ffab4b06b0403c6b1e61bd79.jpg)
