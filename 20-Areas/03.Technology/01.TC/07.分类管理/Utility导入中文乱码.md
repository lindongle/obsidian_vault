---
title: Utility导入中文乱码
updated: 2026-06-06T10:09
created: 2018-12-03T13:20:45
---

使用Utility导入，需要本地文件的编码格式要与Oracle数据库字符集一致，如Oracle字符集为AL32UTF8，但本地为中文导出的xml文件，需需要用记事本打开xml文件，另存为，将文件格式保存为utf8，再执行导入。
或导入分类时提示解析XML文件时失败。
解析 XML 时出错
at com.teamcenter.rac.classification.icadmin.xmlutil.ICAdminXmlICOSchema.getSchemaFileName(Unknown Source)
at com.teamcenter.rac.classification.icadmin.xmlutil.ICAdminXmlImportOperation.executeOperation(Unknown Source)
at com.teamcenter.rac.aif.AbstractAIFOperation.runEx(Unknown Source)
at com.teamcenter.rac.kernel.services.impl.TCOperationService.performOperation(Unknown Source)
at com.teamcenter.rac.aif.kernel.AbstractAIFSession.performOperation(Unknown Source)
at com.teamcenter.rac.aif.AbstractAIFOperation.run(Unknown Source)
at org.eclipse.core.internal.jobs.Worker.run(Worker.java:54)

ERROR: 11:05:00,788 - TcLogger\$IC_PrintStream.logButCheckForException:?
org.xml.sax.SAXParseException
org.xml.sax.SAXParseException; systemId: <file:///C:/Users/lenovo/Desktop/test.xml>; lineNumber: 7; columnNumber: 8; Invalid byte 2 of 2-byte UTF-8 sequence.
at org.apache.xerces.parsers.DOMParser.parse(Unknown Source)
at com.teamcenter.rac.classification.icadmin.xmlutil.ICAdminXmlICOSchema.getXmlDocument(Unknown Source)
at com.teamcenter.rac.classification.icadmin.xmlutil.ICAdminXmlICOSchema.getSchemaFileName(Unknown Source)
at com.teamcenter.rac.classification.icadmin.xmlutil.ICAdminXmlImportOperation.executeOperation(Unknown Source)

![image1](a7016faba17344af8d62ba87a3f764b6.png)

