---
title: TC数据库备份及还原
updated: 2026-06-05T23:56
created: 2025-07-19T15:40:45
tags:
  - TC安装部署
---

数据库备份：
mkdir /infodba/dbbackup
chmod 777 /infodba/dbbackup
sqlplus /nolog
conn /as sysdba;
create or replace directory bak_dir as '/infodba/dbbackup';
grant all on directory bak_dir to infodba;
quit
expdp infodba/infodba@tc directory= bak_dir dumpfile=infodba202507191313 schemas=infodba
卷备份
cd /infodba/Siemens/
cp -r -p volumes volumes_backup_202507171323
tcdata备份
还原数据库：
sqlplus /nolog
conn /as sysdba;
drop user infodba cascade;
@"/infodba/app/oracle/product/19c/db_1/assistants/dbca/templates/create_user.sql"
grant dba to infodba;
exit
impdp infodba/infodba@tc directory=bak_dir dumpfile=infodba202507191313.dmp remap_schema=infodba:infodba full=y
