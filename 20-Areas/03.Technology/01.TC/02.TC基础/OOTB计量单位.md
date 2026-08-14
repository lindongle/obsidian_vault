---
title: OOTB计量单位
updated: 2026-06-06T10:09:02
created: 2026-07-05T17:04:40
---

2406开始计量单位属性不再读取bmide的单位中的配置；
可用的计量单位值使用单位管理系统定义；
管理员可以配置 Teamcenter 中可用的计量单位。此基于分类单位的单位管理系统 (UMS) 首次在 Teamcenter 2406 版中提供。 Teamcenter 安装套件中提供了近 1400 个计量单位的列表。开箱即用，仅安装部分单位，具体取决于安装的应用程序。安装人员和管理员可以配置要添加的单位，并可以添加新单位。
维护：
D:\Siemens\tc_data\unit_definitions.csv
R列“Application:Base”为1的显示在系统中，不同的列设置为1时，标识不同的属性上是否显示
![image1](544325d5627f47e1a4503616faa62833.png)
使用以下命令，可以将旧版 BMIDE 计量单位迁移到新的单位管理系统 (UMS)
ums_mapping -u=infodba -p=infodba -analyze -report_file=c:\temp\mapping_config.csv
生成报告，确认无误后执行
ums_mapping -u=username -p=password -analyze -import_file=c:\temp\mapping_config.csv
将测量单位关系添加到 Teamcenter 数据库
ums_mapping -map -input_file=c:\temp\mapping_config.csv -report_file=c:\temp\mapping_report.csv
从 Teamcenter 数据库中删除测量单位关系，从要删除映射关系的每个单元的第一列中删除“#”符号。
ums_mapping -u=admin-username -p=admin-password -g=dba -unmap -input_file=c:\temp\mapping_config.csv -report_file=c:\temp\mapping_report.csv
创建计量单位

ums_mapping -u=admin-username -p=admin-password -g=dba -create_uom -report_file=c:\temp\unit_report.csv

