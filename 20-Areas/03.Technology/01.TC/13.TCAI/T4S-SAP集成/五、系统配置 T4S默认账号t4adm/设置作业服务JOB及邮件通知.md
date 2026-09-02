---
title: 设置作业服务JOB及邮件通知
updated: 2026-09-02T16:30:05
created: 2026-07-05T17:04:48
---

**1、安装及配置作业服务器**
BGS中--配置-作业服务器，设置作业的存储路径、保留天数和并行作业数。
![image1](488be10248cf47769e1e10d13f5f93e7.png)
**2、添加作业代理**
GS中，配置-作业代理-右上角添加
![image2](e1ede2ce0db94ff5a1a905c6bbc4b4df.png)

![image3](4c6d14e1deb2419f90e4adcb3f3f1fa6.png)

**3、添加GS的任务管理，监控tpapps和tps进程**
![image4](0e5abbf602eb414d83fe88a3fd731515.png)
**4、添加BGS的任务管理，监控tps和tpapps进程。**
![image5](e52d395489a6443da18e01518adecb5b.png)
**5、设置流程与工作管理集成**
（由于T4x可能会在一个工作流作业中处理大量事务，因此可能需要一段时间。
为了在此期间不阻止Teamcenter用户，可以将T4x作业服务器配置为在后台处理工作流，以便用户可以在启动工作流后立即继续使用Teamcenter）==类似于dispatcher，但会在前台报错，工作任务也报错。==
可以设置在发送SAP的任务的开始上，在发送前创建工作批处理任务。
对应handler：
T4X-create-T4X-BatchJob
参数：
-JobNamePrefix，作业名称的前缀，可以不设置（默认T4X_WF_BATCH），如
\$SITE
\$USERID
\$USERNAME
\$GROUP
\$ROLE
-JobPrio：任务的优先级，默认50，数值越小，优先级越低。
-tc_user：设置默认任务的创建者，可以不设置，默认责任方（ResponsibleParty），即工作任务创建用户，可以通过，跟OOTB的EPM-auto-assign的-assignee 参数的使用方式一致。
在BGS的配置-作业中可以看到批处理的作业及执行进度（状态）。
![image6](11d88b7052c6486a86add37ed3a5b7d8.png)
如果不添加代理，下面的作业只会创建，不会被执行。
![image7](2aeab7019d064e1d84d73cd624ad24fd.png)
**6、邮件通知**
如果发生错误，会自动发邮件到设置的责任方。可以通过BGS的脚本Mail Proxy Test，测试邮箱是否好使。
注意：通知的内容只是任务执行失败会通知（如任务异常、空间不够等），不会通知具体SAP集成接口反馈的信息。此信息会流程异常后自动发送邮件。
发件人==需要配置首选项Mail_OS_from_address，如果首选项值为空，则会在发件人的人员定义中添加操作系统电子邮件地址（或BGS脚本，E:\PLM\Siemens\T4S_BGS_ROOT\var\test\batchalerts.tcl设置的初始参数mailFromAddress设置的邮箱，不确定）==，设置有有效的邮箱，否则会提示以下内容。
ERROR - ECN-000011/00;3-test (weQx\$h0NZcd\$TCAAAAAAAAAAAAA) not found. Inbox for user (infodba) is empty!
![image8](de1eb305972d490688b33db6a5b35bd9.jpeg)
上述截图中的用户是通过mapping文件中设置的：E:\PLM\Siemens\T4S\var\mmap\t4s_mapping_config\t4s_mapping_config.sd，修改及添加以下内容：
![image9](419fb534fda64b0580beed5d05413abb.png)
为空的原因是，t4s_mapping_config.sd配置的TC的后台监控账号是infodba，但流程中配置的工作任务创建者是责任方，即test1，导致并没有infodba创建的工作任务，即任务列表为空。所有上述流程中的创建工作任务handler的责任方（-tc_user）和此Mapping中的配置tc默认登录账号尽量一致。如果为设置自动登录，handler需要配置T4S-SessionProxy。
可以将批量工作量任务相关的设置，均放到mapping文件中。默认设置即可。
![image10](1e8d4f93759041bdbcc7d01963935522.png)
set ::T4X::WORKFLOW::BATCHJOB::BatchjobDefaults(DefaultRetryTime) "3600"
set ::T4X::WORKFLOW::BATCHJOB::BatchjobDefaults(BatchJobPrio) "50"
set ::T4X::WORKFLOW::BATCHJOB::BatchjobDefaults(BatchJobTimeout) "3600"
set ::T4X::WORKFLOW::BATCHJOB::BatchjobDefaults(T4X_WF_BATCH_DebugSwitch) "OFF"
set ::T4X::WORKFLOW::BATCHJOB::BatchjobDefaults(ConnectMode4ERP) "AUTOLOGIN"
set ::T4X::WORKFLOW::BATCHJOB::BatchjobDefaults(MaxRetryCounter) "0"
set ::T4X::WORKFLOW::BATCHJOB::BatchjobDefaults(InboxRescanTimeSecs4MissingJobs) "60"
set ::T4X::WORKFLOW::BATCHJOB::BatchjobDefaults(StopITK) "TRUE"
set ::T4X::WORKFLOW::BATCHJOB::BatchjobDefaults(TriggerComment) "Triggered by T4x job server"

7、任务的重新执行：
在BGS-作业管理-作业中，选择需要重新执行的作业，点击编辑，将状态修改为就绪，保存即可。
![image11](748c7b0f69aa4306b9c008d53c9c15d6.png)

![image12](166ca66886a14b3ea6f2c39bb726694a.png)

![image13](25f9ff89eb9c4de5853c0f1b08e2b3cb.png)
