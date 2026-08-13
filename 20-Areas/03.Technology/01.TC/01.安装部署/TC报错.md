---
title: TC报错
updated: 2026-06-06T10:05
created: 2018-03-11T11:56:14
tags:
  - TC安装部署
---

1、tem安装报如下错误：
![image1](e61a3b863cf54538b43cae3805a9ac8e.png)
直接确定，忽略就行，不影响。
2、Apache服务起不了
![image2](1ad0ae31fede483687997e110f3362da.png)
默认的80端口被占用。
![image3](1a34964ebd474962ae5fde02934b7383.png)
3、分发方式安装四层客户端时报错。
![image4](113ef4821a0c45849170361768a5f7ea.png)
因为服务器IP自动获取的，导致IP发生改变，后面服务器必须固定IP地址，安装时都选择IP地址，不用主机名。目前解决办法是将此IP维护到网络地址中，然后在host文件中建立主机名与该ip的映射，然后注销。
4、oracle监听服务无法启动，删除重建，提示被其他软件信息占用，但是端口没有被占用。
原因，修改过host文件导致，删掉即可。后面部署是均使用固定IP即可避免此类问题。
5、分发方式安装4层客户端报错。
![image5](5331a01613954b689311146d01177b0a.png)
原因：权限不足无法访问注册表。解决措施：使用管理员身份运行IE，重新安装即可。
6、分发方式安装4层客户端最后一步报错。
![image6](d13581ac6eeb49e7b5e08d54a3bc4e48.png)
没什么影响，手动配置对应环境变量即可。
![image7](f98af83649734a6d84d78c7176d81a26.png)
7、四层客户端点击登录，报错。
![image8](67fbc14f2c3c45719ae1396341281090.png)
解决：连不上网络，重启四层服务即可解决。
8、四层客户端点击登录，报错。
![image9](ca04ef77c17542e2be8f23ef6dfbc63e.png)
web层无法使用导致。重新部署web层。有可能是部分文件被杀毒软件删除造成。
9、weblogic启动不了。
![image10](168df97908634fd0b0c1b0a180c7ece1.png)
运行域配置报以下错误。
![image11](6508bf1298d84b71800449ef8d5816f4.png)
重新安装weblogic软件，重新部署解决。也有可能是license服务未启动。
java安装目录损坏，重新安装jre然后重启电脑解决。
10、2层客户端登录，报错。
![image12](4734d17c9a6040f6a1541ecd5ea652a9.png)
原因：许可证服务未启动。启动后重新登录。
11、四层客户端，使用首选项功能报错。
![image13](96ff1c70e8504c3093d7c24a16e7cd5c.png)

![image14](a3b2ce1b34bb411ead101362e3903cd7.png)
12、2层客户端登录报错
![image15](d235c091933446caae85f64dfb4d42ac.png)

13、新建BMIDE模板，点击完成时，报错
![image16](0b8f8d15c45940f295c5ab1493f21dd3.png)
点击确定，重新点击完成，不再报错，具体原因不知。
14、部署BMIDE模板报错。
![image17](fa1b0fb6652647cd8f44ef93a9da1708.png)
运行TEM，添加changemanager部件。把变更管理模板导入数据库。
15、Winserver2016，运行许可证管理器安装程序报错。
![image18](f695d5a857344784896055cd9562a7f9.png)

![image19](efe657a2ed7f40cc8722182b7253b193.png)
删掉所有的jre，重装jre7.解决。更新新版本license安装程序。
16、瘦客户端，上次文件控件报错。
![image20](853db88de24e4224877e0a74257b8a14.png)
17、运行Creo集成程序，报错。Windows DLL failed to load。
![image21](2f63ea1b5dd9467089a83cc3889bc984.png)
原因：兼容性问题。
解决：选择安装包，右键设置兼容性为Win7即可。删掉所有的jre，重装jre7.解决。
18、BMIDE部署连接报错。
![image22](b230766a2c0642cbae8cbbd2ef43c22e.png)
19.2层客户端登录报错。
![image23](e5f7f008c8f249da89ec216aca45ac04.png)

![image24](2fc4ff4b2aca4b248ff231e70a560fb5.png)
原因：数据库未连接上。
20.2层报错
![image25](e6bc94533a1249eeae21886902a22c47.png)
解决方法：清理客户端缓存，重新登录。
21、登录报错
![image26](fec0bb89c023446b9bcbc0d715a1b0a8.png)
原因：同一电脑已经有其他用户登录，必须单点登录。
22、瘦客户端无法登陆。
![image27](e542b00d6146465783bb556ee5012e9b.png)
23、四层安装报错：
![image28](c2a2e8964ec44e9ea35b79c1947389f3.png)
http后面少了一个/
24、regcteatekey5
![image29](4b20bc6d13c343968320e5599318d1df.png)
解决：管理员身份运行IE
25、时间管理服务无法启动。
![image30](44aee9b5a77f4c0e833e8f9a3ca94e45.png)
没有影响。
26、安装四层客户端提示找不到vis安装目录。
分发实例参数中，将vis的安装路径改为\\共享目录的方式。
27、启动企业服务器，提示端口被占用
错误: 代理抛出异常错误: java.rmi.server.ExportException: Port already in use: 8088; nested exception is:
java.net.BindException: Address already in use: JVM_Bind
![image31](2e0e0fb851b3476a8bdfadb677df192e.png)
与自主PDM系统的更新服务端口8088冲突，停止更新服务即可。
28、双击四层图标，一直显示over the web installer
管理员身份运行客户端图标即可。
29、登陆TC，提示FLEXLM，初始化失败。
原因：license到期或不可用。
30、四层分发，安装vis提示处理返回退出代码1620
![image32](3044e6c464b44064b2e05e4b6ac6e0b8.png)
解决：无法连接vis的共享文件夹，开着共享进行四层安装
31：双击数据集，提示未能创建工作目录。
![image33](62794323f04b447ba44b5c638050d9b3.jpg)
原因：没有创建c:\temp的权限
32、tem安装打包的bmide模板报错。提示还需要另一个文件，coreDataModel2.xml
![image34](a54a4b4da60e453097a51deb46ae5536.png)
原因：tem与bmide模板文件版本不一致（tem版本低于bmide模板版本），打完补丁后再次加载。
33、进行升级时，提示无法读取元素Unrecognized element 'prep'。
不能直接升级补丁，需要先升级tem本身，即复制补丁中的install压缩包解压后的文件到tc_root下的installer文件夹中进行覆盖，再在tem中进行升级。
34、tem更新了bmide模板后，2层客户端无法登陆，提示：com.teamcenter.soa.client.SoaRuntimeException: The **Shared Metadata Cache** **cannot** be updated, because it has not been initialized. Please report this error to your system administrator.
<span style='color:#333333'>处理：关闭TC四层服务poolmanager，到%temp%中找到V11000\*开头的文件夹删掉，如果提示被占用无法删除，则进程中结束掉java.exe及tcserver.exe，删除后，重启服务，重新登录即可。</span>
35、Teamcenter.exe进程无法启动，闪退。
WARN 2017-08-31 11:57:05,085 - Windows 7 (Service Pack 1) - win32.win32.x86_64 - null - Java(TM) SE Runtime Environment (1.7.0_60-b19) - 3.8.0.v20120529-1548
ERROR 2017-08-31 11:57:05,411 - 1 字节的 UTF-8 序列的字节 1 无效。
com.sun.org.apache.xerces.internal.impl.io.MalformedByteSequenceException: 1 字节的 UTF-8 序列的字节 1 无效。
at com.sun.org.apache.xerces.internal.impl.io.UTF8Reader.invalidByte(Unknown Source)
at com.sun.org.apache.xerces.internal.impl.io.UTF8Reader.read(Unknown Source)
at com.sun.org.apache.xerces.internal.impl.XMLEntityScanner.load(Unknown Source)
at com.sun.org.apache.xerces.internal.impl.XMLEntityScanner.scanContent(Unknown Source)
at com.sun.org.apache.xerces.internal.impl.XMLDocumentFragmentScannerImpl\$FragmentContentDriver.next(Unknown Source)
at com.sun.org.apache.xerces.internal.impl.XMLDocumentScannerImpl.next(Unknown Source)
at com.sun.org.apache.xerces.internal.impl.XMLDocumentFragmentScannerImpl.scanDocument(Unknown Source)
at com.sun.org.apache.xerces.internal.parsers.XML11Configuration.parse(Unknown Source)
at com.sun.org.apache.xerces.internal.parsers.XML11Configuration.parse(Unknown Source)
at com.sun.org.apache.xerces.internal.parsers.XMLParser.parse(Unknown Source)
at com.sun.org.apache.xerces.internal.parsers.DOMParser.parse(Unknown Source)
at com.sun.org.apache.xerces.internal.jaxp.DocumentBuilderImpl.parse(Unknown Source)
at javax.xml.parsers.DocumentBuilder.parse(Unknown Source)
at com.teamcenter.rac.util.registry.RegistryXMLLoader.loadXMLRegistry(Unknown Source)
at com.teamcenter.rac.util.Registry.\<clinit\>(Unknown Source)
at com.teamcenter.rac.aif.impl.PerspectiveDef.setLabel(Unknown Source)
at com.teamcenter.rac.aif.impl.PerspectiveDefService.setFieldsFromPerspectiveConfig(Unknown Source)
at com.teamcenter.rac.aif.impl.PerspectiveDefService.loadPerspDefFromRACExtensionPoint(Unknown Source)
at com.teamcenter.rac.aif.impl.PerspectiveDefService.activate(Unknown Source)
at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
at sun.reflect.NativeMethodAccessorImpl.invoke(Unknown Source)
at sun.reflect.DelegatingMethodAccessorImpl.invoke(Unknown Source)
at java.lang.reflect.Method.invoke(Unknown Source)
at org.eclipse.equinox.internal.ds.model.ServiceComponent.activate(ServiceComponent.java:235)
at org.eclipse.equinox.internal.ds.model.ServiceComponentProp.activate(ServiceComponentProp.java:146)
at org.eclipse.equinox.internal.ds.model.ServiceComponentProp.build(ServiceComponentProp.java:347)
at org.eclipse.equinox.internal.ds.InstanceProcess.buildComponent(InstanceProcess.java:620)
at org.eclipse.equinox.internal.ds.ServiceReg.getService(ServiceReg.java:53)
at org.eclipse.osgi.internal.serviceregistry.ServiceUse\$1.run(ServiceUse.java:141)
at java.security.AccessController.doPrivileged(Native Method)
at org.eclipse.osgi.internal.serviceregistry.ServiceUse.getService(ServiceUse.java:139)
at org.eclipse.osgi.internal.serviceregistry.ServiceRegistrationImpl.getService(ServiceRegistrationImpl.java:468)
at org.eclipse.osgi.internal.serviceregistry.ServiceRegistry.getService(ServiceRegistry.java:467)
at org.eclipse.osgi.framework.internal.core.BundleContextImpl.getService(BundleContextImpl.java:594)
at org.eclipse.equinox.internal.ds.InstanceProcess.getService(InstanceProcess.java:730)
at org.eclipse.equinox.internal.ds.model.ComponentReference.getMethod(ComponentReference.java:119)
at org.eclipse.equinox.internal.ds.model.ComponentReference.bind(ComponentReference.java:331)
at org.eclipse.equinox.internal.ds.model.ServiceComponentProp.bindReference(ServiceComponentProp.java:432)
at org.eclipse.equinox.internal.ds.model.ServiceComponentProp.bind(ServiceComponentProp.java:218)
at org.eclipse.equinox.internal.ds.model.ServiceComponentProp.build(ServiceComponentProp.java:345)
at org.eclipse.equinox.internal.ds.InstanceProcess.buildComponent(InstanceProcess.java:620)
at org.eclipse.equinox.internal.ds.ServiceReg.getService(ServiceReg.java:53)
at org.eclipse.osgi.internal.serviceregistry.ServiceUse\$1.run(ServiceUse.java:141)
at java.security.AccessController.doPrivileged(Native Method)
at org.eclipse.osgi.internal.serviceregistry.ServiceUse.getService(ServiceUse.java:139)
at org.eclipse.osgi.internal.serviceregistry.ServiceRegistrationImpl.getService(ServiceRegistrationImpl.java:468)
at org.eclipse.osgi.internal.serviceregistry.ServiceRegistry.getService(ServiceRegistry.java:467)
at org.eclipse.osgi.framework.internal.core.BundleContextImpl.getService(BundleContextImpl.java:594)
at org.eclipse.equinox.internal.ds.InstanceProcess.getService(InstanceProcess.java:730)
at org.eclipse.equinox.internal.ds.model.ComponentReference.getMethod(ComponentReference.java:119)
at org.eclipse.equinox.internal.ds.model.ComponentReference.bind(ComponentReference.java:331)
at org.eclipse.equinox.internal.ds.model.ServiceComponentProp.bindReference(ServiceComponentProp.java:432)
at org.eclipse.equinox.internal.ds.model.ServiceComponentProp.bind(ServiceComponentProp.java:218)
at org.eclipse.equinox.internal.ds.model.ServiceComponentProp.build(ServiceComponentProp.java:345)
at org.eclipse.equinox.internal.ds.InstanceProcess.buildComponent(InstanceProcess.java:620)
at org.eclipse.equinox.internal.ds.ServiceReg.getService(ServiceReg.java:53)
at org.eclipse.osgi.internal.serviceregistry.ServiceUse\$1.run(ServiceUse.java:141)
at java.security.AccessController.doPrivileged(Native Method)
at org.eclipse.osgi.internal.serviceregistry.ServiceUse.getService(ServiceUse.java:139)
at org.eclipse.osgi.internal.serviceregistry.ServiceRegistrationImpl.getService(ServiceRegistrationImpl.java:468)
at org.eclipse.osgi.internal.serviceregistry.ServiceRegistry.getService(ServiceRegistry.java:467)
at org.eclipse.osgi.framework.internal.core.BundleContextImpl.getService(BundleContextImpl.java:594)
at com.teamcenter.rac.util.OSGIUtil.getService(Unknown Source)
at com.teamcenter.rac.util.OSGIUtil.getService(Unknown Source)
at com.teamcenter.rac.aifrcp.Application.runApplication(Unknown Source)
at com.teamcenter.rac.aifrcp.Application.start(Unknown Source)
at org.eclipse.equinox.internal.app.EclipseAppHandle.run(EclipseAppHandle.java:196)
at org.eclipse.core.runtime.internal.adaptor.EclipseAppLauncher.runApplication(EclipseAppLauncher.java:110)
at org.eclipse.core.runtime.internal.adaptor.EclipseAppLauncher.start(EclipseAppLauncher.java:79)
at org.eclipse.core.runtime.adaptor.EclipseStarter.run(EclipseStarter.java:353)
at org.eclipse.core.runtime.adaptor.EclipseStarter.run(EclipseStarter.java:180)
at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
at sun.reflect.NativeMethodAccessorImpl.invoke(Unknown Source)
at sun.reflect.DelegatingMethodAccessorImpl.invoke(Unknown Source)
at java.lang.reflect.Method.invoke(Unknown Source)
at org.eclipse.equinox.launcher.Main.invokeFramework(Main.java:629)
at org.eclipse.equinox.launcher.Main.basicRun(Main.java:584)
at org.eclipse.equinox.launcher.Main.run(Main.java:1438)
at org.eclipse.equinox.launcher.Main.main(Main.java:1414)

解决：从正常客户端拷贝一份进行覆盖就好使了。
36、TEM安装时间表与工作流集成报错，无法创建shedule manager服务
提示：LookupAccountName: 1332
解决：修改了windows主机名导致的，在install文件中的config的xml文件中，将主机名修改正确，然后重新安装即可。
