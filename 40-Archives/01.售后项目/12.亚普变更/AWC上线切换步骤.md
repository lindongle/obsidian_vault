---
title: AWC上线切换步骤
updated: 2026-06-05T22:15
created: 2021-05-20T16:12:23
---

1.  下发停机通知；
2.  生产环境服务器停机，停企业服务，将所有服务全部关闭，包括主FSC服务，及Tao窗口；
3.  进行数据库备份，同步进行DBA卷和TCDATA备份；
4.  准备VIS服务器，及基础环境配置：
    1.  操作系统安装；
    2.  JDK/JRE1.8/notepad/winrar等；
    3.  环境变量设置，JRE_HOME/JAVA_HOME/JRE64_HOME，license
    4.  拷贝所需安装介质，tc11.2/tc11.6.10/awc4.3.3/微服务框架2.0.3
    5.  检查VIS服务器与生产环境的网络连接及端口开放；
5.  生产环境介质拷贝：awc4.3.3/微服务框架2.0.3/OfficeOnline(.net4.5.2)
6.  启动生产环境FSC服务，安装AWC，按顺序依次安装；
    1.  微服务扩展
    2.  tem勾选微服务，密码使用changeit
    3.  web层insweb添加微服务，并重新生成war包
    4.  weblogic进行web重新部署
    5.  更新AWC补丁
    6.  安装AWC服务端扩展，awc服务端、可视化扩展；
    7.  安装数据库触发器
    8.  安装AWC微服务（3个）
    9.  安装AWC网关，设置https密钥路路径，引导客户端IP需要填写
    10. 安装AWC客户端（确保域名中不包含awc字符）
7.  启动四层服务，AWC登录验证（含https）
8.  关闭四层服务，保留FSC服务，登录生产环境，移除首选项tc_custom中定制开发的dll；
9.  VIS服务器安装：
    1.  确定可以tcdata共享具有读写权限；
    2.  拷贝install到tc11.6.10
    3.  反向tem11.6.10tem安装，依次添加tc11.2介质、微服务扩展、awc补丁
    4.  勾选TC基础环境、AWC服务端扩展、NX基础、AWC Content Structure
    5.  backup_xmlinfo命令，更新主FSC配置文件的FSCID、地址及传输卷ID，重启主FSC服务，启动VIS服务器的FSC服务，并确认启动正常；
    6.  安装可视化扩展，需根据提示勾选内容管理模块；
    7.  安装VIS指派、VIS服务器管理器、VIS数据服务器；
    8.  修改生产主服务器中AWC网关，添加VIS可视化服务器地址；
    9.  测试可视化浏览；
    10. 安装索引器及编制引擎，并进行相关配置；
10. 生产环境主服务器，按测试环境安装其他模块，如工作流程等；
11. 安装OfficeOnline：
    1.  确保对OfficeOnline服务器的访问权限（域名地址测试）
    2.  安装IIS，全部勾选，配置权限及目录浏览
    3.  安装.net4.5.2
    4.  启动微服务；
    5.  tem中勾选5个officeonline相关模块进行安装；
    6.  登录2层客户端创建sponsor用户，密码与上面安装过程一致。
    7.  IIS测试网站，并进行问题处理，修改IIS网站管理绑定，设置为IP；
    8.  添加officeonlineurl首选项，添加OfficeOnline地址；
    9.  修改wopi首选项，主机名改为IP；
    10. 重启四层服务，测试验证；
12. 修改tc_custom，添加开发dll，并将开发dll更新到VIS服务器一份；
13. 部署AWC开发包及配置；
14. AWC和四层胖客户端登录验证，并进行问题处理；
15. 下发服务启动通知；

