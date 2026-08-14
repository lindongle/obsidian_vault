---
title: JIRA-Oracle配置
updated: 2026-06-06T00:26:10
created: 2026-07-05T17:04:55
---

create tablespace jira_space datafile 'D:\app\Administrator\oradata\jira.DBF' size 100M autoextend on next 128k maxsize 6048m;
create user jira identified by jira default tablespace jira_space temporary tablespace temp;
grant dba to jira;
