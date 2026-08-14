---
title: zypper mr -da
updated: 2026-06-06T00:29:19
created: 2026-07-05T17:04:53
---

zypper mr -da
zypper addrepo -f <http://mirrors.aliyun.com/opensuse/distribution/leap/15.0/repo/oss/> Aliyun-openSUSE-15.0-Oss
zypper addrepo -f <http://mirrors.aliyun.com/opensuse/distribution/leap/15.0/repo/non-oss/> Aliyun-openSUSE-15.0-Non-Oss
zypper addrepo -f <http://mirrors.aliyun.com/opensuse/update/leap/15.0/oss/> Aliyun-openSUSE-15.0-Update-Oss
zypper addrepo -f <http://mirrors.aliyun.com/opensuse/update/leap/15.0/non-oss/> Aliyun-openSUSE-15.0-Update-Non-Oss
zypper update
