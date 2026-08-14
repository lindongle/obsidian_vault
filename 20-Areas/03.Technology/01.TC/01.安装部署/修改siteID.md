---
title: 修改siteID
updated: 2026-06-13T22:12:00
created: 2026-07-05T17:04:38
tags:
  - TC安装部署
---

表：POM_BOOT/EIM_UID_GENERATOR_ROOT/POM_INDEXES/POM_ROOT/PPOM_IMC/PGSIDENTITY 共6张表。

1）先解锁被占用的表用户，否则会提示record is locked by another user，使用system登录。
select t2.username,t2.sid,t2.serial#,t2.logon_time from v\$locked_object t1,v\$session t2 where t1.session_id=t2.sid order by t2.logon_time;
alter system kill session '179,40585'；
179为前面的SID，40585为后面的serial#
2）执行，并提交。
UPDATE POM_BOOT set SITE=-1868841713 WHERE SITE =-1868841712;
UPDATE EIM_UID_GENERATOR_ROOT set SITE_ID=-1860005829 WHERE SITE_ID =-1870005829;
UPDATE POM_INDEXES SET SITE =-1860005829 WHERE SITE =-1870005829;
UPDATE POM_ROOT SET SITE_ID=-1860005829 WHERE SITE_ID =-1870005829;
UPDATE PPOM_IMC SET PSITE_ID=-1860005829 WHERE PSITE_ID =-1870005829;
UPDATE PGSIDENTITY SET PLABEL='-1860005829' WHERE PLABEL='-1870005829';
DELETE FROM PPOM_IMC WHERE PSITE_ID=-1876558909;---根据SITEID删除SITE。

重新backup_xmlinfo 导出最新的信息，更新FSCMaster文件的siteID和传输卷ID。

![image1](30da8881119f43fd8b20e88cd1a58dec.png)

![image2](d10daa62cfec42acb79abdde9bcc2d55.png)

![image3](a0b18722e470445c87ae7d33109657fe.png)

![image4](c67bf78e498d4d2abb8495d4256b5417.png)

![image5](f92b228ed4bf4bafbc16d0bfdca37c36.png)

