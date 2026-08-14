---
title: 部署BMIDE报错
updated: 2026-06-06T10:08:50
created: 2026-07-05T17:04:46
---

部署BMIDE报错
2021年4月19日
9:29

主服务器文件的完整路径：C:\Siemens\tcdata\model
应生成指向文件的完整路径：C:\Siemens\tcdata\model\model.xml
合并出错
org.xml.sax.SAXParseException; lineNumber: 3561; columnNumber: 1; Content is not allowed in trailing section.
at org.apache.xerces.parsers.DOMParser.parse(Unknown Source)
at org.apache.xerces.jaxp.DocumentBuilderImpl.parse(Unknown Source)
at com.teamcenter.bmide.base.core.util.DOMHelperBase.createDocument(Unknown Source)
at com.teamcenter.bmide.base.core.util.DOMHelperBase.createDocument(Unknown Source)
at com.teamcenter.bmide.base.core.util.DOMHelperBase.readXmlFile(Unknown Source)
at com.teamcenter.bmide.foundation.core.consolidator.Consolidator.consolidateModel(Unknown Source)
at com.teamcenter.bmide.foundation.core.consolidator.Consolidator.consolidateModel(Unknown Source)
at com.teamcenter.bmide.foundation.core.consolidator.ProcessTemplates.consolidateModel(Unknown Source)
at com.teamcenter.bmide.foundation.core.consolidator.ProcessTemplates.bmideDbSetup(Unknown Source)
at com.teamcenter.bmide.foundation.core.internal.consolidator.ProcessTemplatesMain.execute(Unknown Source)
at com.teamcenter.bmide.foundation.core.internal.consolidator.ProcessTemplatesMain.main(Unknown Source)

![image1](af4121727ba44aa89f69ea89e3f9065b.png)

![image2](baa9fd65df684e278d4a0bfe780a5ae0.png)

![image3](8d2fbe9956e347caa6a9ff02654797e0.png)

![image4](38721fe9129a40e082e6085ed5141cc4.png)
部署步骤 6（共 9 步）:
---------------------------------------------------------------------------------------------------------------------
描述：将允许的实时更新元素列表从数据库抽取
到 live_update_preference.xml 文件。

结果：未执行

Tao窗口会提示哪个文件有问题：
修改
C:\Siemens\tcdata\model\foundation_template.xml
C:\Siemens\tcdata\model\nx0tcin_template.xml
C:\Siemens\tcdata\model\lang\foundation_template_en_US.xml
C:\Siemens\tcdata\model\lang\foundation_template_zh_CN.xml
C:\Siemens\tcdata\model\lang\nx0tcin_template_en_US.xml
C:\Siemens\tcdata\model\lang\nx0tcin_template_zh_CN.xml
C:\Siemens\tcdata\model\lang\model.xml
C:\Siemens\tcdata\model\lang\model_dbextract_lang.xml
C:\Siemens\tcdata\model\lang\model_backup.xml
model_backup_lang.xml
foundation_template_zh_TW.xml
foundation_template_ru_RU.xml
foundation_template_pt_BR.xml
foundation_template_pl_PL.xml
foundation_template_ko_KR.xml
foundation_template_ja_JP.xml
foundation_template_it_IT.xml
…
C:\Siemens\tcdata\model\baselines\foundation_tcbaseline.xml

以下为TC中数据库中对应的模型文件，找到model.xml、model_lang.xml、foundation_template.xml删除空行

![image5](76414386bc69487088a597cf5f071b3b.png)

，删除最后的空行和空格。
