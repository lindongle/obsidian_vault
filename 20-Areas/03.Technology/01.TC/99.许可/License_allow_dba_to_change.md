---
title: License_allow_dba_to_change
updated: 2026-09-02T16:30:05
created: 2026-07-05T17:04:50
---

License\_allow_dba_to_change
设置为true，则具有dba特权的用户在登录时会检查本地的环境变量SPLM_LICENSE_SERVER的值与组织中许可证服务器中Default Local License Server的地址是否一致，如果不一致则会将环境变量的值更新到Default Local License Server。
设置为false，则不会更新，但对于用户infodba，无论设置为什么都会自动更新。

所以出现部分情况下，Default Local License Server的地址会出现自动更新或修改的情况。
2020年1月8日
10:43

