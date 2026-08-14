---
title: 重复安装fundation多出站点ID
updated: 2026-06-13T22:12:00
created: 2026-07-05T17:04:40
tags:
  - TC安装部署
---

修改站点ID数据库表
备份
查找数据库中包含site_id的表
select \* from tc10prod.dbo.sysobjects where id in(select id from tc10prod.dbo.syscolumns Where name='site_id')

select \* into POM_BOOT_bak from POM_BOOT;
select \* into POM_ROOT_bak from POM_ROOT;
select \* into eim_uid_generator_root_bak from eim_uid_generator_root;
select \* into EXPORT_TO_SITE_TABLE_bak from EXPORT_TO_SITE_TABLE;

select \* from POM_ROOT

SELECT \* FROM PPOM_IMC

select \* from eim_uid_generator_root

select \* from EXPORT_TO_SITE_TABLE

