---
title: DECLARE
updated: 2026-06-06T00:06
created: 2018-11-29T20:25:32
tags:
  - TC安装部署
---

DECLARE
CURSOR cur_hh1 IS
SELECT table_name, column_name, data_type FROM user_tab_columns;
LN_COUNT NUMBER;
LN_SQL VARCHAR2(2000);
LS_COUNT NUMBER;
BEGIN
DBMS_OUTPUT.ENABLE(buffer_size =\> null);
FOR V_CUR IN cur_hh1 LOOP
LN_COUNT:=0;
IF V_CUR.data_type ='VARCHAR2' OR V_CUR.data_type='CHAR' THEN
LN_COUNT := 1;
END IF;
IF LN_COUNT\>0 THEN
LN_SQL := '';
LN_SQL := 'SELECT count(\*) FROM '\|\| V_CUR.table_name \|\|' where '
\|\|V_CUR.column_name\|\| ' like''-1870005829''';--字段值
dbms_output.put_line(LN_SQL);
EXECUTE IMMEDIATE LN_SQL INTO LS_COUNT;
IF LS_COUNT \> 0 THEN dbms_output.put_line('\[字段值所在的表.字段\]:\['\|\|V_CUR.table_name\|\|'\].\['\|\|V_CUR.column_name\|\|'\]');
END IF;
END IF;
END LOOP;
END;
