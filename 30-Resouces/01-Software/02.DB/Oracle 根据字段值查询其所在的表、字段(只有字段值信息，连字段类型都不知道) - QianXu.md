---
title: Oracle 根据字段值查询其所在的表、字段(只有字段值信息，连字段类型都不知道) - QianXu...
updated: 2026-06-06T00:30
created: 2018-11-30T03:51:47
---

Oracle 根据字段值查询其所在的表、字段(只有字段值信息，连字段类型都不知道) - QianXun - CSDN博客
星期四, 十一月 29, 2018
7:51 下午
已剪辑自: <https://blog.csdn.net/m0_37941193/article/details/80622896>
今天一哥们求助，oracle的我只知道ziduan字段的值，连类型，大小设置全都不知道，如何查询到该字段所在的表，以及该字段名。以下是我编写的实际脚本：
1.假设该字段是varchar2或者char类型
1.  DECLARE
2.  CURSOR cur_hh IS
3.  SELECT table_name, column_name, data_type FROM user_tab_columns;
4.  LN_COUNT NUMBER;
5.  LN_SQL VARCHAR2(2000);
6.  LS_COUNT NUMBER;
7.  BEGIN
8.  FOR V_CUR IN cur_hh LOOP
9.  LN_COUNT:=0;
10. IF V_CUR.data_type ='VARCHAR2' OR V_CUR.data_type='CHAR' THEN
11. LN_COUNT := 1;
12. END IF;
13. IF LN_COUNT\>0 THEN
14. LN_SQL := '';
15. LN_SQL := 'SELECT count(\*) FROM '\|\| V_CUR.table_name \|\|' where '
16. \|\|V_CUR.column_name\|\| ' like''0.86''';--字段值
17. dbms_output.put_line(LN_SQL);
18. EXECUTE IMMEDIATE LN_SQL INTO LS_COUNT;
19. IF LS_COUNT \> 0 THEN dbms_output.put_line('\[字段值所在的表.字段\]:\['\|\|V_CUR.table_name\|\|'\].\['\|\|V_CUR.column_name\|\|'\]');
20. END IF;
21. END IF;
22. END LOOP;
23. END;
2.由于未查到，继续假设为number类型
1.  DECLARE
2.  CURSOR cur_hh IS
3.  SELECT table_name, column_name, data_type FROM user_tab_columns;
4.  LN_COUNT NUMBER;
5.  LN_SQL VARCHAR2(2000);
6.  LS_COUNT NUMBER;
7.  BEGIN
8.  FOR rec1 IN cur_hh LOOP
9.  LN_COUNT:=0;
10. IF rec1.data_type ='NUMBER' THEN
11. LN_COUNT := 1;
12. END IF;
13. IF LN_COUNT\>0 THEN
14. LN_SQL := '';
15. LN_SQL := 'SELECT COUNT(\*) FROM '\|\| rec1.table_name \|\|' WHERE ' \|\|rec1.column_name \|\| '=0.86';--字段值
16. dbms_output.put_line(LN_SQL);
17. EXECUTE IMMEDIATE LN_SQL INTO LS_COUNT;
18. IF LS_COUNT \> 0 THEN
19. dbms_output.put_line('\[字段值所在的表.字段\]:\['\|\|rec1.table_name\|\|'\].\['\|\|rec1.column_name\|\|'\]');
20. END IF;
21. END IF;
22. END LOOP;
23. END;
查询到结果，很多条满足条件的反馈SQL，需要一一确认。
如果还未查到，就需要查询int，CLOB等诸多类型了，需要继续换个类型继续编写，笔者就不继续实验了，简单的很。
