---
title: 处理 alert 日志文件
created: 2026-08-14T09:41:28+08:00
updated: 2026-08-14T10:13:09+08:00
---
![[Pasted image 20260814094207.png]]
```sql
--### 1. 查询归档目标，找到对应 dest_id
SELECT dest_id,destination,status,error FROM v$archive_dest WHERE destination IS NOT NULL;
--### 2. 将该归档目标置为 DEFER（停止向旧备库发起连接，保留配置，生产推荐）,假设查到是 dest_id=2
ALTER SYSTEM SET LOG_ARCHIVE_DEST_STATE_2=DEFER SCOPE=BOTH;
--### 3. 触发 TT00 旧进程退出
alter system switch logfile;
--### 4. 验证结果,status 变为 **DEFERRED** 就成功。
SELECT dest_id,destination,status,error FROM v$archive_dest WHERE dest_id=2;
--如需恢复，执行
ALTER SYSTEM SET LOG_ARCHIVE_DEST_STATE_2=ENABLE SCOPE=BOTH;
```

# 处理 alert 日志文件
报错停止后，把已经膨胀的日志安全截断：
cd $ORACLE_BASE/diag/rdbms/tc/tc/trace
cp alert_tc.log alert_tc.log.$(date +%Y%m%d).bak
echo '' > alert_tc.log
