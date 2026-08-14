---
title: 修改oracle密码及密码永不过期
updated: 2026-06-06T00:30:47
created: 2026-07-05T17:04:54
---

ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;
alter user infodba identified by infodba
alter user system identified by asdZXC_123
alter user sys identified by asdZXC_123
