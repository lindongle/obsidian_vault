---
title: SSO-SessionAgent
updated: 2026-06-06T10:08:53
created: 2026-07-05T17:04:50
---

三种方式安装：
1、在路径D:\Install\Tc11.3.0_patch_1_wntx64\wntx64\additional_applications\sso\install.exe，找到该文件，直接双击，选择安装路径，进行安装。环境变量TCSSO_SESSION_AGENT_PATH自动添加。
2、通过OTW分发方式安装，在胖客户端实例中添加解决方案Teamcenter Security Service Session Agent。参数中设置安装路径。通过网页进行分发安装，环境变量TCSSO_SESSION_AGENT_PATH自动添加。
![image1](719203943a77445fb712dcf5ad174e03.png)
3、静默安装，通过2中的分发安装方式，得到session agent的安装包（D:\Siemens\Teamcenter11\WebTier\RichClient4\webapp_root\wntx64\sso_sessionagent.zip）。解压到安装路径下。环境变量TCSSO_SESSION_AGENT_PATH手动添加，值为安装路径。

