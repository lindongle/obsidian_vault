---
title: Impdp/expdp导入导出
updated: 2026-06-06T00:29
created: 2018-06-13T14:31:39
---

样例：
运行cmd
sqlplus /nolog
conn /as sysdba
修改system用户密码为infodba：
alter user system identified by infodba；
创建备份目录：
create directory backup as 'D:\Backup\Ora_exp';
给infodba用户授权：
grant read,write on directory backup to infodba;
Exit

导出用户数据:
expdp infodba/infodba@plmtc schemas=infodba dumpfile=expdptest20190106.dmp DIRECTORY=backup;

登录system账户
system/infodba@plmtc
删除重建infodba用户并授权
@D:\Oracle\product\11.2.0\dbhome_1\assistants\dbca\templates\tc_unpopulate_db.sql
grant read,write on directory backup to infodba;
Exit

修改临时表空间：
select tablespace_name,file_name,bytes/1024/1024 file_size,autoextensible from dba_temp_files;

alter database tempfile 'D:\ORACLE\ORADATA\PLMTC\TEMP01.DBF' autoextend on next 50m maxsize unlimited;

alter database tempfile 'D:\ORACLE\ORADATA\PLMTC\TEMP01.DBF' resize 1000m;

执行导入：
impdp system/infodba DIRECTORY=backup DUMPFILE=infodba201901031028.dmp SCHEMAS=infodba

create directory backup as 'D:\Oracle\OracleData\bakcup';
grant read,write on directory backup to infodba;
impdp infodba/infodba DIRECTORY=backup DUMPFILE=ORACLE_INFODBA20210612.dmp SCHEMAS=infodba

一、创建逻辑目录，该命令不会在操作系统创建真正的目录，最好以system等管理员创建。
create directory dpdata1 as 'd:\test\dump';
二、查看管理理员目录（同时查看操作系统是否存在，因为Oracle并不关心该目录是否存在，如果不存在，则出错）
select \* from dba_directories;
三、给scott用户赋予在指定目录的操作权限，最好以system等管理员赋予。
grant read,write on directory dpdata1 to scott;
四、导出数据
1)按用户导
expdp scott/tiger@orcl <span style='color:red'>schemas</span>=scott dumpfile=expdp.dmp DIRECTORY=dpdata1;
2)并行进程parallel
expdp scott/tiger@orcl directory=dpdata1 dumpfile=scott3.dmp parallel=40 job_name=scott3
3)按表名导
expdp scott/tiger@orcl TABLES=emp,dept dumpfile=expdp.dmp DIRECTORY=dpdata1;
4)按查询条件导
expdp scott/tiger@orcl directory=dpdata1 dumpfile=expdp.dmp Tables=emp query='WHERE deptno=20';
5)按表空间导
expdp system/manager DIRECTORY=dpdata1 DUMPFILE=tablespace.dmp TABLESPACES=temp,example;
6)导整个数据库
expdp system/manager DIRECTORY=dpdata1 DUMPFILE=full.dmp FULL=y;
五、还原数据
1)导到指定用户下
impdp scott/tiger DIRECTORY=dpdata1 DUMPFILE=expdp.dmp <span style='color:red'>SCHEMAS</span>=scott;
2)改变表的owner
impdp system/manager DIRECTORY=dpdata1 DUMPFILE=expdp.dmp TABLES=scott.dept REMAP_SCHEMA=scott:system;
3)导入表空间
impdp system/manager DIRECTORY=dpdata1 DUMPFILE=tablespace.dmp TABLESPACES=example;
4)导入数据库
impdb system/manager DIRECTORY=dump_dir DUMPFILE=full.dmp FULL=y;
5)追加数据
impdp system/manager DIRECTORY=dpdata1 DUMPFILE=expdp.dmp SCHEMAS=system TABLE_EXISTS_ACTION

*来自 \< <https://www.cnblogs.com/huacw/p/3888807.html>\>*
