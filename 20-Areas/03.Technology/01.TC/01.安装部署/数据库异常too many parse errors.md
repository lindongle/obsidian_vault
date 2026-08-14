---
title: Parse errors warning in Oracle trace log
created: 2026-08-14T10:56:24
updated: 2026-08-14T10:56:47
---
# Parse errors warning in Oracle trace log

If the Teamcenter database is in Oracle, and any JMX client including the Teamcenter Management Console frequently queries the state of Teamcenter servers, then the Oracle trace log may show a parse errors warning related to Server Manager SQL. This is caused by the JDBC driver appending a row ID to the query.

For example:

2021-01-29T20:10:15.281248-05:00    
WARNING: too many parse errors, count=426 SQL hash=0x60c18596    
PARSE ERROR: ospid=8560, error=937 for statement:     
2021-01-29T20:10:15.282248-05:00 select rowid as "__Oracle_JDBC_internal_ROWID__", COUNT(*) as ELEMENT_COUNT FROM   
SERVERS_1773957227_357170909 WHERE POOL_ID = 'PoolA'    
Additional information: hd=00007FF8E079EEE8 phd=00007FF8ECA7D748 flg=0x20 cisid=94 sid=94 ciuid=94 uid=94 sqlid=c7yd2hjhc31cq    
...Current username=TCCLUSTERDB    
...Application: JDBC Thin Client Action:      
  
2021-01-29T20:11:32.725724-05:00  WARNING: too many parse errors, count=312 SQL hash=0x96b6d88d    
PARSE ERROR: ospid=10028, error=937 for statement:     
2021-01-29T20:11:32.725724-05:00 select rowid as "__Oracle_JDBC_internal_ROWID__", COUNT(*) as ELEMENT_COUNT FROM   
SERVERS_1773957227_357170909 WHERE POOL_ID = 'PoolA' AND STATE = 'warming'    
Additional information: hd=00007FF8EA954610 phd=00007FF8EC900930 flg=0x20 cisid=94 sid=94 ciuid=94 uid=94 sqlid=0bbcb7abbdq4d    
...Current username=TCCLUSTERDB    
...Application: JDBC Thin Client Action:

The parse errors do not affect performance.

To eliminate the parse errors warning, the workaround suggested by Oracle is to set the following parameter on the Oracle server: **_kks_parse_error_warning=0**

This setting is available for Oracle Database version 12.2 and later.

1. Login to SQLPlus using a system administrator account.
    
2. Run the following command:
    
    alter system set "_kks_parse_error_warning"=0 scope=both;