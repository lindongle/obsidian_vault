---
title: 2412在Linux部署失败
updated: 2026-06-13T22:11:59
created: 2026-07-05T17:04:38
tags:
  - TC安装部署
---

Command end time: Thu May 22 2025 11:42:19 AM China Standard Time
Command duration: 0.968 second(s)
ERROR: Execution of command 1 failed with error code 1

Install end time: Thu May 22 2025 11:42:19 AM China Standard Time
Install duration: 0.978 second(s)
Script execution failed.
InstallRunner log file is created at: "/infodba/Siemens/Teamcenter2412/teamcenter_root/logs/tc_script_runner_2025_05_22_11-42-18.log"

Thu May 22 11:42:20 CST 2025Execution of "TCEXEC" task failed with tcexec returned: 1

Thu May 22 11:42:20 CST 2025Execution of "IF" task failed with tcexec returned: 1

Thu May 22 11:42:20 CST 2025Execution of "IF" task failed with tcexec returned: 1

Thu May 22 11:42:20 CST 2025Execution of "IF" task failed with tcexec returned: 1

Thu May 22 11:42:20 CST 2025Execution of "databaseUpdate" target of "Feature/Artifact: fnd0_corporateserver (R39JFRQNIL28WXLD0212MFFSKMCCEFVM) - ArtifactType( fnd0_dataModelArtifact ) failed with tcexec returned: 1
Auto Retry is disabled. Deployment will terminate due to the current failure.

End Time: Thu, May 22 2025 11:42:20 AM
Duration: 81.2560 seconds (1.3543 minutes)

\########################
Status: Failed \#########
\########################
com.siemens.deploymentcenter.deployer.ant.exception.AntExecutionException: com.siemens.deploymentcenter.deployer.ant.exception.AntInvocationException: Deployment Failed

Deployment Failed
虚拟化平台中CPU模式改为以下值（或中文直通模式），默认为none
![image1](e4dbe5ba0ae14051b5148d7a20c8945e.png)

![image2](464b0f48bf7441d98957e358de7b7a8f.png)
<span style='color:#333333'></span>
![image3](3e4238ff83594a9cb941a72e16c52f44.jpg)
<span style='color:#333333'></span>
<span style='color:#333333'>兼容模式：将不同的型号物理CPU虚拟成相同型号的vCPU，迁移兼容性好。</span>
<span style='color:#333333'>主机匹配模式：将不同的物理CPU虚拟成不同型号的vCPU，迁移兼容性差，相对于兼容模式可以给虚拟机操作系统提供更优的性能。</span>
<span style='font-weight:bold;color:#333333'>直通模式</span><span style='color:#333333'>：直接将物理CPU暴露给虚拟机使用，迁移兼容性差，相对于兼容模式和主机匹配模式可以给虚拟机操作系统提供更优的性能。 如果 CPU工作模式设置为直通模式，则该虚拟机在迁移时，要求目的主机的与源主机的</span><span style='color:#FA0000'>CPU型号</span><span style='color:#333333'>必须保持一致。</span>

*From \< <https://zhiliao.h3c.com/questions/dispcont/229222>\>*

