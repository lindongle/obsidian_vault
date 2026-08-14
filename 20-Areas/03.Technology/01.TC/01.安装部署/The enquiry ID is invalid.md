---
title: The enquiry ID is invalid
updated: 2026-06-13T22:12:00
created: 2026-07-05T17:04:38
tags:
  - TC安装部署
---

删除缓存然后重建客户端缓存，<span style='color:#FA0000'>后两条必须执行；</span>
generate_client_meta_cache -u=infodba -p=pdm_1234 -g=dba -t delete all
generate_metadata_cache -u=infodba -p=pdm_1234 -g=dba -delete
generate_metadata_cache -u=infodba -p=pdm_1234 -g=dba -force
generate_client_meta_cache -u=infodba -p=pdm_1234 -g=dba -t generate all

![image1](62152f0be06c46758fa25be1a0662a83.png)

