---
title: CREATE OR REPLACE PROCEDURE PROC_FindValueInDB (st...
updated: 2026-06-13T22:12:00
created: 2026-07-05T17:04:38
tags:
  - TC安装部署
---


```sql

CREATE OR REPLACE PROCEDURE PROC_FindValueInDB (str in VARCHAR,results out sys_refcursor)AUTHID CURRENT_USER

AS
--执行SQL语句
sqlStr VARCHAR(4000);
--判断表是否存在
tableExist number;
BEGIN
--查询表是否存在
select count(1) into tableExist from user_tables where table_name=upper('temp_Table');
if tableExist = 0 then
--创建表
sqlStr := 'CREATE TABLE temp_Table (
tablename VARCHAR(64),
columnname VARCHAR(64)
)';
execute immediate sqlStr;
else
--清空表数据
sqlStr := 'delete temp_Table';
execute immediate sqlStr;
end if;
--定义游标
`declare`
`CURSOR tables is`
`SELECT o.table_name, c.column_name`
`FROM user_tab_columns c`
`INNER JOIN user_tables o ON c.table_name = o.table_name`
`WHERE c.data_type in ('NVARCHAR2','CHAR','VARCHAR2')`
`AND o.TABLESPACE_NAME in('IDATA')`
`ORDER BY o.table_name, c.column_name`;
--定义当前行
table_row tables%rowtype;
BEGIN
--打开游标
OPEN tables;

--遍历游标
LOOP
--当没有数据的时候就退出循环
EXIT WHEN tables%NOTFOUND;
--游标赋值给变量
FETCH tables INTO table_row;
sqlStr := 'insert ';
sqlStr := sqlStr \|\| 'when (exists(SELECT NULL FROM ' \|\| table_row.table_name \|\| ' WHERE RTRIM(LTRIM("'\|\| table_row.column_name \|\|'")) LIKE ''%' \|\| str \|\| '%'')) ';
sqlStr := sqlStr \|\| 'then into temp_Table select ''' \|\| table_row.table_name \|\| ''', ''' \|\| table_row.column_name \|\| ''' from dual ';
execute immediate sqlStr;

--结束循环
END LOOP;
--提交事务
commit;
--关闭游标
CLOSE tables;
END;