---
title: 保存到 Teamcenter 可能失败。  意外抛出 IFail。
updated: 2026-06-06T10:08
created: 2023-07-18T10:58:26
---

保存到 Teamcenter 可能失败。 意外抛出 IFail。

其他错误
意外抛出 IFail。

初始异常详细信息
com.teamcenter.schemas.soa.\_2006_03.exceptions.InternalServerException: 意外抛出 IFail。
at com.teamcenter.soa.internal.client.ExceptionMapper.parseExceptionString(Unknown Source)
at com.teamcenter.soa.internal.client.ExceptionMapper.parseExceptionString(Unknown Source)
at com.teamcenter.soa.internal.client.XmlRestSender.invokeImpl(Unknown Source)
at com.teamcenter.soa.internal.client.XmlRestSender.invoke3(Unknown Source)
at com.teamcenter.services.strong.cad.DataManagementRestBindingStub.createOrUpdateParts(Unknown Source)
at com.transcendata.cadpdm.soa.SOACheckInHelper.createAndUpdate(SOACheckInHelper.java:1385)
at com.transcendata.cadpdm.soa.SOACheckInHelper.createAndSaveAs(SOACheckInHelper.java:3756)
at com.transcendata.cadpdm.soa.SOAOperationHandlerImpl.checkIn(SOAOperationHandlerImpl.java:1006)
at com.transcendata.swimsoa.CheckInWorkerCommand.checkInWorker(CheckInWorkerCommand.java:268)
at com.transcendata.swimsoa.CheckInWorkerCommand.execute(CheckInWorkerCommand.java:172)
at com.transcendata.swimsoa.CloneCommand.invokeCommand(CloneCommand.java:323)
at com.transcendata.cadpdm.AbstractCommand.execute(AbstractCommand.java:183)
at com.transcendata.swimsoa.MainSwim\$12.execute(MainSwim.java:332)
at com.transcendata.cadpdm.cs.CSOperations.processCIC(CSOperations.java:80)
at com.transcendata.cadpdm.cs.CSOperationsController.processEvents(CSOperationsController.java:134)
at com.transcendata.cadpdm.cs.CSOperationsController.start(CSOperationsController.java:65)
at com.transcendata.swimsoa.MainSwim.main(MainSwim.java:735)

最终异常详细信息
com.transcendata.cadpdm.soa.SOARuntimeException: 意外抛出 IFail。
at com.transcendata.cadpdm.soa.SOAExceptionHandler.handleException(SOAExceptionHandler.java:46)
at com.teamcenter.soa.internal.client.XmlRestSender.invokeImpl(Unknown Source)
at com.teamcenter.soa.internal.client.XmlRestSender.invoke3(Unknown Source)
at com.teamcenter.services.strong.cad.DataManagementRestBindingStub.createOrUpdateParts(Unknown Source)
at com.transcendata.cadpdm.soa.SOACheckInHelper.createAndUpdate(SOACheckInHelper.java:1385)
at com.transcendata.cadpdm.soa.SOACheckInHelper.createAndSaveAs(SOACheckInHelper.java:3756)
at com.transcendata.cadpdm.soa.SOAOperationHandlerImpl.checkIn(SOAOperationHandlerImpl.java:1006)
at com.transcendata.swimsoa.CheckInWorkerCommand.checkInWorker(CheckInWorkerCommand.java:268)
at com.transcendata.swimsoa.CheckInWorkerCommand.execute(CheckInWorkerCommand.java:172)
at com.transcendata.swimsoa.CloneCommand.invokeCommand(CloneCommand.java:323)
at com.transcendata.cadpdm.AbstractCommand.execute(AbstractCommand.java:183)
at com.transcendata.swimsoa.MainSwim\$12.execute(MainSwim.java:332)
at com.transcendata.cadpdm.cs.CSOperations.processCIC(CSOperations.java:80)
at com.transcendata.cadpdm.cs.CSOperationsController.processEvents(CSOperationsController.java:134)
at com.transcendata.cadpdm.cs.CSOperationsController.start(CSOperationsController.java:65)
at com.transcendata.swimsoa.MainSwim.main(MainSwim.java:735)

![image1](cac2729b672e4171883425082d6f4101.png)

