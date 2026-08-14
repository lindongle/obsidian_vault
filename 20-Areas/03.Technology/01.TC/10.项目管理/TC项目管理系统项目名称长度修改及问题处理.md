---
title: TC项目管理系统项目名称长度修改及问题处理
updated: 2026-06-05T23:23:17
created: 2026-07-05T17:04:46
---

问题描述：TC项目管理系统的project_name字段默认为为36个字符，实际项目名称长度需要超过36个字符

解决办法：修改36个字符为256个字符
1.  通过TC的后台cmd命令执行installalter_str_leninfodbainfodbadbaTC_Projectproject_name256    
install-regen_schema_fileinfodbainfodbadba
1.  确认是否修改成功
查看TC数据库TC_Project表project_name字段的varchar2值由36修改为了256

问题描述：修改项目名称长度后，TC安装新模块报错

解决办法：
1.  安装部署前，先修改delta.xml文件，文件中project_name搜索，把值36修改为256

*来自 \<<https://mp.weixin.qq.com/s?__biz=MzIwNTYxMDE5Nw==&mid=2247483770&idx=1&sn=150a7a0b86f441de5a4c644335afcdf5&chksm=96fe1afcea4b4f858f011dad289e33fa588506a122c0b9885d14dcfd7036ff7a97f899b8c0db&mpshare=1&scene=1&srcid=0923SXxBL6Vsr1fS2A6t3HSf&sharer_shareinfo=5b2d41609e9b166d33dab385d06f89ca&sharer_shareinfo_first=4c3963dda37fce3034ab9c87103572d3&from=industrynews&version=4.1.27.6032&platform=win&nwr_flag=1#wechat_redirect>\>*

