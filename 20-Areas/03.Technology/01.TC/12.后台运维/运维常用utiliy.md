---
title: 运维常用utiliy
updated: 2026-08-14T10:43:05
created: 2026-07-05T17:04:47
---

有用的管理工具
以下是一些在执行维护活动时可能会有用的实用程序：am_install_tree将访问管理器树安装到数据库中。
1.  backup_modes以不同的模式设置Teamcenter TCFS进程。 Blobby卷模式用于Teamcenter热备份。
2.  backup_xmlinfo为Teamcenter中的临时卷生成文件管理系统（FMS）ID标签。 还在运行FMS ID的文件夹中创建XML文件。
3.  clearlocks从数据库中清除死进程。 建议使用-verbose选项。 使用-assert_all_dead参数时要格外小心。
4.  dataset_cleanup从数据库中删除未引用的数据集对象。 定期运行此实用程序以清理孤立的数据库对象index_verifier验证数据库表上的索引。 使用安装实用程序添加到数据库的自定义索引也可以使用此工具进行跟踪。
5.  make_user在Teamcenter组织应用程序中创建人员，用户，组和角色对象。
6.  purge_datasets从数据库中删除旧版次的数据集。 定期在Teamcenter数据库上运行此实用程序。
7.  purge_invalid_subscriptions从Teamcenter数据库中删除对对象的无效订阅。 定期运行此实用程序，以从Teamcenter数据库中清除无效的订阅对象。
8.  purge_volumes从操作系统中删除未引用的文件。 这些文件未附加到Teamcenter数据库中的任何有效数据集。 定期运行此实用程序以清理操作系统上的文件，以增加磁盘空间。
9.  report_volume列出所有现有Teamcenter卷的操作系统路径。 该路径不包括网络节点名称。
10. reset_user_home_folder修复从数据库中删除用户时可能发生的损坏。 （损坏会将用户的主文件夹，邮箱文件夹和新的东西文件夹重定向到执行删除操作的个人的文件夹。）
11. review_volumes显示有关Teamcenter卷的详细信息，并允许您从这些卷中删除未引用的操作系统文件。
12. verify_tasks查找所有损坏的CM任务，作业和其他关联的内部任务模型对象，以将其从数据库中删除。 如果在文件夹中引用了损坏的对象（例如作业），则将删除引用并删除作业。
