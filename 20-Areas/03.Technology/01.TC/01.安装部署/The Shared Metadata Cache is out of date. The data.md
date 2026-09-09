---
title: The Shared Metadata Cache is out of date. The data...
updated: 2026-06-06T10:09
created: 2025-07-19T23:45:51
tags:
  - TC安装部署
---

The Shared Metadata Cache is out of date. The dataset version 21 is older
than the version 22 which is deployed in the database, so Metadata is
populated locally in this process. The "generate_metadata_cache" utility will
re-generate the Shared Metadata Cache.

Invalid value for the operation input
![image1](97c1ff72574d46668a363ff59e067492.png)

<span style='background:white'>generate_client_meta_cache -u=infodba -p=password -g=dba -t generate all</span>
<span style='background:white'>generate_client_meta_cache -u=infodba -p=password -g=dba -t update all</span>

![image2](e7f8235b0d464d0abbd649af95fe19b1.png)
删除以上属性
![image3](090ee0c3b18f4654b07c6af40056c92b.png)

