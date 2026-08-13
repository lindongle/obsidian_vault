---
title: AWC搜索无法反应
updated: 2026-06-05T23:50
created: 2021-06-22T11:30:39
---

1、solr_admin密码不对；
2、报错：
syslog:
ERROR - 2021/06/22-03:28:18.003 UTC - :82scf1y88vk-1624332497856.Mux.Svr - 141161: 由于当前搜索文本语法的原因，使用 Solr 搜索发生了错误。若在搜索文本中使用特殊字符（如：空格、,'-'），确保用引号括起文本（如：字符串 \<A - B\> 的搜索文本为 \<"A - B"\>）。请参考 Solr 日志以获取更多详细信息。 - 由于当前搜索文本语法的原因，使用 Solr 搜索发生了错误。若在搜索文本中使用特殊字符（如：空格、,'-'），确保用引号括起文本（如：字符串 \<A - B\> 的搜索文本为 \<"A - B"\>）。请参考 Solr 日志以获取更多详细信息。 - Teamcenter.ActiveWorkspace.awp0aws2.Solr
solr服务端log：
2021-06-22 03:28:13.998 ERROR (qtp343856911-17) \[ x:collection1\] o.a.s.h.RequestHandlerBase org.apache.solr.common.SolrException: Unable to range facet on field:TC_0Y0_Schedule_0Y0_finish_date{type=ignored,properties=omitNorms,omitTermFreqAndPositions,multiValued,useDocValuesAsStored,uninvertible}

解决：
部署模板要合并新的TC_SOLR_SCHEMA.xml文件；

manage_model_files -u=infodba -p=Y#pp#2020 -g=dba -syncToDb

bmide_generatetcplmxmlschema.bat -u=infodba -p=Y#pp#2020 -g=dba

bmide_setupknowledgebase.bat -u=infodba -p=Y#pp#2020 -g=dba -regen=false

bmide_modeltool.bat -u=infodba -p=Y#pp#2020 -g=dba -tool=all -mode=install -target_dir="%TC_DATA%" -model_file=%TC_DATA%\model\model.xml

cd /d C:\Siemens\Teamcenter11\solr-7.7.0
映射tcdata共享为网络磁盘Z:\\

o TcSchemaToSolrSchemaTransform.bat Z:\ftsi\solr_schema_files

