---
title: 保存到 Teamcenter 可能失败。  所需的对象属性策略不在服务器的缓存中。
updated: 2026-06-06T00:15:47
created: 2026-07-05T17:04:43
---

保存到 Teamcenter 可能失败。 所需的对象属性策略不在服务器的缓存中。

其他错误
所需的对象属性策略不在服务器的缓存中。

初始异常详细信息
com.teamcenter.schemas.soa.\_2006_03.exceptions.InternalServerException:
所需的对象属性策略不在服务器的缓存中。
at com.teamcenter.soa.internal.client.ExceptionMapper.parseExceptionString(Unknown Source)
at com.teamcenter.soa.internal.client.ExceptionMapper.parseExceptionString(Unknown Source)
at com.teamcenter.soa.internal.client.XmlRestSender.invokeImpl(Unknown Source)
at com.teamcenter.soa.internal.client.XmlRestSender.invoke3(Unknown Source)
at
com.teamcenter.services.strong.cad.StructureManagementRestBindingStub.getRevisionRules(Unknown
Source)
at
com.transcendata.cadpdm.soa.SOARevisionRuleManager.initialize(SOARevisionRuleManager.java:93)
at
com.transcendata.cadpdm.soa.SOARevisionRuleManager.refresh(SOARevisionRuleManager.java:429)
at
com.transcendata.cadpdm.soa.SOAServiceManagerImpl.refresh(SOAServiceManagerImpl.java:583)
at
com.transcendata.ipemsoa.ServiceManagerImpl.setOperationType(ServiceManagerImpl.java:613)
at com.transcendata.ipemsoa.Operations.checkInModified(Operations.java:1544)
at
com.transcendata.ipemsoa.pe.CheckInActionListener.executePECommand(CheckInActionListener.java:42)
at
com.transcendata.cadpdm.pe.PEAbstractCommandActionListener.OnCommand(PEAbstractCommandActionListener.java:46)
at com.ptc.wfc.Implementation.WFCRemoteCommImpl.dispatch(WFCRemoteCommImpl.java:406)
at com.ptc.cipjava.CIPRemoteComm.processMessages(CIPRemoteComm.java:116)
at com.ptc.wfc.Implementation.WfcStarter.serverLoop(WfcStarter.java:61)
at com.ptc.wfc.Implementation.WfcStarter.main(WfcStarter.java:39)

最终异常详细信息
com.transcendata.cadpdm.soa.SOARuntimeException: 所需的对象属性策略不在服务器的缓存中。
at
com.transcendata.cadpdm.soa.SOAExceptionHandler.handleException(SOAExceptionHandler.java:46)
at com.teamcenter.soa.internal.client.XmlRestSender.invokeImpl(Unknown Source)
at com.teamcenter.soa.internal.client.XmlRestSender.invoke3(Unknown Source)
at
com.teamcenter.services.strong.cad.StructureManagementRestBindingStub.getRevisionRules(Unknown
Source)
at
com.transcendata.cadpdm.soa.SOARevisionRuleManager.initialize(SOARevisionRuleManager.java:93)
at
com.transcendata.cadpdm.soa.SOARevisionRuleManager.refresh(SOARevisionRuleManager.java:429)
at
com.transcendata.cadpdm.soa.SOAServiceManagerImpl.refresh(SOAServiceManagerImpl.java:583)
at
com.transcendata.ipemsoa.ServiceManagerImpl.setOperationType(ServiceManagerImpl.java:613)
at com.transcendata.ipemsoa.Operations.checkInModified(Operations.java:1544)
at
com.transcendata.ipemsoa.pe.CheckInActionListener.executePECommand(CheckInActionListener.java:42)
at
com.transcendata.cadpdm.pe.PEAbstractCommandActionListener.OnCommand(PEAbstractCommandActionListener.java:46)
at com.ptc.wfc.Implementation.WFCRemoteCommImpl.dispatch(WFCRemoteCommImpl.java:406)
at com.ptc.cipjava.CIPRemoteComm.processMessages(CIPRemoteComm.java:116)
at com.ptc.wfc.Implementation.WfcStarter.serverLoop(WfcStarter.java:61)
at com.ptc.wfc.Implementation.WfcStarter.main(WfcStarter.java:39)
