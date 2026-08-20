---
title: verify_tasks -u=infodba -p=infodba -g=dba
updated: 2026-08-20T10:23:52
created: 2026-07-05T17:04:46
---

检查流程对象的使用情况：verify_tasks-u=infodba-p=infodba-g=dba
删除错误的流程对象：verify_tasks-m=delete-u=infodba-p=infodba-g=dba
查看现有登录用户：list_users
清理所有进程：clearlocks-assert_all_dead-u=infodba-p=infodba-g=dba
清死进程：clearlocks-verbose -assert_dead -u=infodba -p=infodba -g=dba
重新注册schema文件：install-regen_schema_fileinfodbainfodbadba
导出fsc信息：Backup_xmlinfo.exeinfodbainfodbadba
当BMIDE部署时没有勾选生成缓存时，部署后要运行，否则无法登陆：generate_client_meta_cache -u=infodba -p=infodba -g=dba generate all
解锁数据库BMIDE部署锁定：bmide_deployment_lock-u=infodba-p=infodba-g=dba-release

1、清理账户
查询并死进程：clearlocks -verbose，会自动把以下Dead的给清理掉
![[Pasted image 20260820102336.png]]
杀掉所有账户：clearlocks -assert_all_dead 需要重启四层服务
clearlocks -assert_all_dead -u=infodba -p=infodba -g=dba

杀掉某个pool服务的所有进程：clearlocks -assert_all_dead -nodenames=Pool的主机名 -u=infodba -p=infodba -g=dba
显示所有在线用户：list_users -u=infodba -p=infodba -g=dba
2、重建客户端缓存：(登录提示找不到version.mem_deploy not exit)
generate_client_meta_cache -u=infodba -p=infodba -g=dba -t delete all
generate_metadata_cache -u=infodba -p=infodba -g=dba -delete
generate_metadata_cache -u=infodba -p=infodba -g=dba -force
generate_client_meta_cache -u=infodba -p=infodba -g=dba -t generate all

generate_client_meta_cache-u=infodba-p=infodba-g=dbadeleteall
generate_client_meta_cache-u=infodba-p=infodba-g=dbagenerateall

导出实时BMIDE信息：
business_model_extractor

3、删除某用户所有用户首选项
首选项，必须退出该登录用户
preferences_manager -u=infodba -p=infodba -g=dba -scope=User -target=infodba -mode=clear

**检查有无损坏的工作流**
在Teamcenter命令窗口，输入以下命令
**verify_tasks -u=infodba -p=infodba -g=dba**
![image1](434271684c344c3688fd0beb5d7697c3.jpg)
如果有损坏的工作流，则使用verify_tasks -m=delete -u=infodba -p=infodba -g=dba

