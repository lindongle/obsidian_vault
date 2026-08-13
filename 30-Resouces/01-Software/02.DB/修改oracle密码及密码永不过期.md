---
title: 修改oracle密码及密码永不过期
updated: 2026-06-06T00:30
created: 2019-09-19T14:59:16
---

ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;
alter user infodba identified by infodba
alter user system identified by asdZXC_123
alter user sys identified by asdZXC_123
