---
title: Oracle查询某个值在哪个表的哪个字段里
updated: 2026-06-06T10:05
created: 2018-11-29T19:08:38
---

1、新建存储过程，根据需要修改下面标红的表空间名称（值类型必须是字符串），直接在SQL窗口中执行：
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
declare
CURSOR tables is
SELECT o.table_name, c.column_name
FROM user_tab_columns c
INNER JOIN user_tables o ON c.table_name = o.table_name
WHERE c.data_type in ('NVARCHAR2','CHAR','VARCHAR2')
AND o.TABLESPACE_NAME in('IDATA')
ORDER BY o.table_name, c.column_name;
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

--返回结果集
open results for 'select \* from temp_Table';

End PROC_FindValueInDB;

2、选中创建存储过程，右键-test，下方输入要查询的值。点击执行。
![image1](4cb8d10236ee4044a4585bda2c82eb52.png)
3.执行完成后，点击下面results后面的方框，查看结果。
![image2](c38d337beee9413db1d9d54ee86ed86d.png)

