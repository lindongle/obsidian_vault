---
title: Outlook2010 备份数据、账户、设置 - 哈哈大侠 - 博客园
updated: 2026-06-06T00:20
created: 2019-07-13T06:08:09
---

下午
已剪辑自: <https://www.cnblogs.com/ejin/p/7125471.html>
1\. 邮件内容的备份：使用“导入导出”功能或者直接找到需要备份的数据文件拷贝一份即可（拷贝时需要关闭Outlook2007）。
2\. 联系人的备份：“文件”菜单中的“导入/导出”，选择联系人目录即可。
3\. 个性化签名的备份：将系统盘的Documents and Settings/\[User Name\]/Application Data/Microsoft/Signatures目录中的内容复制到你需要保存备份的地方即可。
4\. 账号的备份：运行regedit打开注册表，展开到\[HKEY_CURRENT_USER/Software/Microsoft/Windows NT/CurrentVersion/Windows Messaging Subsystem/Profiles/Outlook。这个目录下一共有二个项是带子项的，**找到子项以000开头**的那个项（我机上的项名是：9375CFF0413111d3B88A00104B2A6676），将这个项的内容导出到一个.reg文件，则以后但出现故障需要恢复账号的时候双击这个.reg文件即可恢复。
5\. 配置的备份：找到注册表HKEY_CURRENT_USER/Software/Microsoft/Office/14.0/Outlook导出。
