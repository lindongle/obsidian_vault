---
title: 快照发送到结构管理器打开到SW中
updated: 2026-06-06T10:08:52
created: 2026-07-05T17:04:44
---

![image1](034f7a8b5c3e4d00b81714363c228576.png)
从 Teamcenter 打开可能失败。 映射
C:\Users\ADMINI~1\AppData\Local\swim\from_portal.xml：XML document
structures must start and end within the same entity.

其他错误
映射 C:\Users\ADMINI~1\AppData\Local\swim\from_portal.xml：XML
document structures must start and end within the same entity.

初始异常详细信息
com.transcendata.cadpdm.ConfigurationException: 映射
C:\Users\ADMINI~1\AppData\Local\swim\from_portal.xml：XML document
structures must start and end within the same entity.
at com.transcendata.cadpdm.DOMHelper.parse(DOMHelper.java:304)
at
com.transcendata.cadpdm.soa.FromPortalReader.parseFromPortalxml(FromPortalReader.java:217)
at
com.transcendata.cadpdm.soa.SOAOperationHandlerImpl.addInstructionFileContents(SOAOperationHandlerImpl.java:3613)
at
com.transcendata.cadpdm.soa.SOAInstructionFileHelper.addInstructionFileModelsToCollection(SOAInstructionFileHelper.java:221)
at
com.transcendata.swimsoa.CheckOutCommand.displayDialog(CheckOutCommand.java:942)
at
com.transcendata.swimsoa.CheckOutCommand.invokeCommand(CheckOutCommand.java:280)
at
com.transcendata.cadpdm.AbstractCommand.execute(AbstractCommand.java:183)
at
com.transcendata.swimsoa.Operations.postInitializeEvent(Operations.java:3635)
at com.transcendata.swimsoa.MainSwim\$51.execute(MainSwim.java:663)
at
com.transcendata.cadpdm.cs.CSOperations.processCIC(CSOperations.java:80)
at
com.transcendata.cadpdm.cs.CSOperationsController.processEvents(CSOperationsController.java:134)
at
com.transcendata.cadpdm.cs.CSOperationsController.start(CSOperationsController.java:65)
at com.transcendata.swimsoa.MainSwim.main(MainSwim.java:735)
