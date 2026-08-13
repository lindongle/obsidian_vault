---
title: Office转换及报表生成
updated: 2026-06-06T10:09
created: 2023-04-23T16:11:13
---

![image1](2f6905b3ad2842658395604894cf28d2.png)
1.  工作流程
使用 PLMEasy-Workflow-Handler，TCPB-AH-createJobFile，创建作业文件夹。使用哪个作业队列以及文件 options.txt 的内容是使用处理程序的参数定义的。
对于每个“Report”或“Stamp”，参数 -options=report=\<report\> 是预期的。此信息允许 CreateImage 决定应触发哪个特定逻辑。
![image2](208ed7a270ba4e47bdf178cce6408c72.png)
2.  PLMEasy 工具包允许为创建job文件夹定义自定义菜单条目。要使用哪个作业队列以及文件 options.txt 的内容，在文件夹 %TC_ROOT%\portal\plugins\com.tcpb.rac.config_10.1.0\com\tcpb\rac\commands\createjobfile 的属性文件createjobfile_user.properties 中定义
![image3](8e6d35497e314e30a15440b2afbf5255.png)

![image4](23fe5865376d49ddb799f70668a68b74.png)
3.  Job队列作业文件夹下的文件：
![image5](8472e094ab2b4831bb559c625d4fd37f.png)
**xxx.job：**标识要处理的 Teamcenter 对象。例如，ItemID、ItemRevisionID、关系类型、数据集类型；
![image6](ef0dca85351b4e0196fd5105f0a8b56e.png)
**jobtag.txt：**包含 EPMJob 的 UID。当 CreateImage 队列应设置决定以在成功处理后继续工作流时，将使用此 UID。如果-options参数包含关键字 approve，例如 -options=approve (...)，则仅从工作流创建此文件；
![image7](217f54fc039942ff9f31fb739980e3be.png)
**options.txt：**列出指定的选项。
![image8](44e621f1d89d48bf895e84ccadddc543.png)
5.  CreateImage Watchdog 进程选取每个作业文件夹，读取作业文件内容以及选项文件。然后作业文件夹从队列文件夹移动到临时区域 (%CR_HOME%\temp)。此临时文件夹包含生成的日志和/或在处理过程中创建的临时文件。这些内容允许支持和/或开发团队分析问题。
![image9](7f48949d80214ef59bfae41380793b3e.png)
6.  PDF创建
    1.  在处理 Office 文档时，受影响的 office 数据集将从 Teamcenter 导出到临时文件夹中。使用 tcpb_export_file.exe 实用程序执行导出。成功导出后，使用 Teamcenter Visualization 的转换工具（prepare.exe）将 Office 文档转换为 PDF。此转换期间使用的参数在 %CR_HOME%\bin\CRServerEnv.bat 中定义。
    2.  对于 MSWord 文档的转换，使用自定义开发程序 ds4_print_pdf.exe，以确保将文档中的书签（签名等信息）签到 PDF 文档中。
7.  PLMXML导出
    1.  当在给定选项 (report=\<report\>) 中请求附加Report或Stamp逻辑时，CreateImage 在文件夹 %CR_HOME%\plmxml\bin 中启动提供的脚本。此文件夹中的脚本在 %CR_HOME%\plmxml\reports 中搜索适当的自定义逻辑。自定义逻辑应包含在文件 \<report\>.xml 中。自定义逻辑作为 Apache ANT 构建文件实现。如下图report=tdd_pdf，则在%CR_HOME%\plmxml\reports文件夹下存在tdd_pdf.xml的配置文件
![image2](208ed7a270ba4e47bdf178cce6408c72.png)

1.  Apache ANT 是一种广泛使用的基于 XML 的脚本工具
8.  报表逻辑
    1.  自定义逻辑通常从从 Teamcenter 导出 PLMXML 开始，不管有或没有 Office 和/或 PDF 文件。然后，XML 数据以多种方式进行转换和处理。
    2.  目前已实施的报告（逻辑）文件
        1.  BOM Reports
            1.  elr_pdf.xml
            2.  eql_pdf.xml
            3.  tdd_pdf.xml
            4.  tddtool_pdf.xml
        2.  首先，原始的 PLMXML 文件使用 XSLT 样式表 %CR_HOME%\plmxml\stylesheets\plmxml2packed.xsl进行转换。PLMXML 文件及关联的PDF文件，以 BOM 结构数的方式被打包，包括用于某些报告/逻辑的附加 PDF 文件。
        3.  然后将打包后的plmxml 文件进一步转换为 XSL-FO 格式。 XSLT 样式表是基于报告/逻辑的：plmxml2tdd.xsl、plmxml2elr.xsl 或 plmxml2eql.xsl。
        4.  然后将打包后的plmxml 也会转换为 Excel XML 文件。此 XSLT 样式表也是特定于报告/逻辑的：plmxml2tddexcel.xsl、plmxml2elrexcel.xsl 或 plmxml2eqlexcel.xsl。
        5.  由于结构数据的分层性质，不可能实现交替的灰色和白色背景色。因此，必须对 XSL-FO 文件和 Excel XML 文件进行后处理。这是由 XSLT 样式表 fop2shaded.xsl 和 excel2shaded.xsl 执行的。
![image10](6a7e6f8eebce4652bfc741dd72c6f3cf.png)
6.  然后将 XSL-FO XML 文件（后处理）作为输入传递给 Apache FOP (v1.0)，并创建一个 PDF 文件。
7.  由于从 Teamcenter 导出的 PDF（工程图等）可能没有正确命名，因此它们也在此处重命名。原始 PLMXML 文件由 plmxml2movefiles.xsl 重新转换。这将创建一个批处理文件，然后执行该文件。
8.  这些额外的 PDF 以及新创建的 Excel 和 PDF 报告被添加到新创建的 Zip 文件中。
9.  Zip 文件最终作为 IMAN_reference（通过菜单）或 IMAN_specification（发布工作流）在选定的装配版本下引用的数据集重新导入到 Teamcenter。
10. Zip 文件和数据集使用命名约定 {TYP}-DS4_PARTNO}\_ID{item_id}\_{timestamp} 命名。
![image11](925a9b1945764170a5c2b4cc431cdc0e.png)
![image12](5976009c2a6a4b16b24d0234b80c259c.png)
11. 导入由 PLMEasy 实用程序 tcpb_import_file.exe 执行。
12. Stamping
    1.  StampEsdMon.xml
    2.  StampEsdPartRel.xml
    3.  StampPdf.xml
13. 首先，使用 XSLT 样式表 %CR_HOME%\plmxml\stylesheets\plmxml2stamp.xsl 转换原始 PLMXML 文件。此 XSLT 样式表根据报告/逻辑读取给定的配置文件（stamp_configs_esd_mon.xml、stamp_configs_esd.xml 或 stamp_configs.xml）。生成的属性文件随后由 Apache ANT 解析：
![image13](2e75e74c16e34e5b9d51bf62e3b8f7ef.png)
14. 使用自定义 (DSG) 标记工具 (%CR_HOME%\bin\ds4_stamp.exe)，在 PDF 上标记文本。 ds4_stamp.exe 工具本身基于 activePDF 的 PDF 工具包。
15. 签字后的 PDF 文件被重新导入到 Teamcenter 中，替换现有的 PDF。导入由 PLMEasy 实用程序 tcpb_import_file.exe 执行。
9.  导入
    1.  从 Office 文档创建 PDF 时，生成的 PDF 也会重新导入到 Teamcenter 中。
    2.  此导入的配置（关系、数据集类型、命名引用……）在文件 %CR_HOME%\bin\CRServerEnv.bat 中执行。导入由 PLMEasy 实用程序 tcpb_import_file.exe 执行
10. 工作流程确认/批准
    1.  当-option参数包含关键字“approve”时，“CreateImange”将尝试继续工作流。这是使用 PLMEasy 实用程序tcpb_set_decision.exe执行的。

