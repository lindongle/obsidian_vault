---
title: Oracle官方推荐SGA+PGA的总大小大于4GB，建议使用自动共享内存管理
updated: 2026-06-05T23:35
created: 2025-11-25T15:25:49
---

<span style='color:#4D4D4D'>ALTER SYSTEM SET SGA_TARGET =4G SCOPE = SPFILE;</span>
<span style='color:#4D4D4D'>ALTER SYSTEM SET SGA_MAX_SIZE =4G SCOPE= SPFILE;</span>

<span style='background: lightgrey'>ALTER SYSTEM SETMEMORY_MAX_TARGET = 0 SCOPE = SPFILE;</span>
<span style='color:#4D4D4D'>ALTER SYSTEM SET MEMORY_TARGET = 0 SCOPE = SPFILE;</span>

*From \< <https://www.modb.pro/db/187016>\>*
