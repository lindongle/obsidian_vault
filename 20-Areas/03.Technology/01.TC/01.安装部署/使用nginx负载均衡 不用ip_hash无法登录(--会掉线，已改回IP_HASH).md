---
title: 使用nginx负载均衡 不用ip_hash无法登录(--会掉线，已改回IP_HASH)
updated: 2026-06-25T22:45:37
created: 2026-07-05T17:04:38
tags:
  - TC安装部署
---

![image1](9c4ee94973bd45ecbcb31fc6d0278e8b.png)

upstream web_servers { hash \$remote_addr consistent; \# 一致性哈希（替代ip_hash） server 10.30.2.42:7001 weight=2; \# 权重生效 server 10.30.2.43:7001 weight=1; }

*From \<<https://www.doubao.com/chat/32932207204630274>\>*
