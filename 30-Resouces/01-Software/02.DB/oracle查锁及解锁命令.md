---
author: 西门运维
source: cnblogs.com
url: https://www.cnblogs.com/Dev0ps/p/9089947.html
Created: 2026-06-26 08:57:29
tags:
  - oracle
  - 数据库
id: db579c69-a47b-49f2-b8ea-89b5bcf437fe
title: oracle查锁及解锁命令
created: 2026-07-05T17:04:54
updated: 2026-06-26T09:38:10
---

\--查询行锁语句

```sql
select sql_text from v$sql a,v$session b
where a.sql_id=b.sql_id and b.event='enq: TX - row lock contention';
```

\--找到被锁定的表

```sql
SELECT object_name, machine, s.sid, s.serial#
FROM gv$locked_object l, dba_objects o, gv$session s
WHERE l.object_id = o.object_id
AND l.session_id = s.sid;
```

![[99-Assets/1d2da054bfdc6c28bc9ee63270fd5d42_MD5.png|Image]]

 --解锁命令

```sql
ALTER SYSTEM KILL SESSION '11,48547';
```

 

![[99-Assets/5c7af386318d1b949e3eb42e7194b750_MD5.png|Image]]

 或者用以下命令查出来后执行ALTER SYSTEM KILL SESSION '''||s.sid||', '||s.serial#||

```sql
select     s.sid,s.machine,o.object_name,l.oracle_username,l.locked_mode,       
'ALTER     SYSTEM     KILL     SESSION     '''||s.sid||', '||s.serial#||''';' Command       
from     v$locked_object     l,v$session     s,all_objects     o       
where     l.session_id=s.sid     and     l.object_id=o.object_id;
```

 ![[99-Assets/c119610004dc38abd23d0daf28bafbaa_MD5.png|Image]]

