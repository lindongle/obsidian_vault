---
title: nginx超时配置
updated: 2026-06-25T23:07:34+08:00
created: 2025-12-08T14:47:47
tags:
  - TC安装部署
  - nginx
---

| 参数                    | 默认值 | 含义                                   | 超时报错                 |
|-----------------------|-----|--------------------------------------|----------------------|
| proxy_connect_timeout | 60s | Nginx 和后端 Tomcat 建立 TCP 连接的最长等待时间    | 502 Bad Gateway      |
| proxy_read_timeout    | 60s | Nginx 建立连接后，等待后端返回数据的最大间隔（业务处理超时最常见） | 504 Gateway Time-out |
| proxy_send_timeout    | 60s | Nginx 向后端发送请求数据的超时                   | 504                  |
```nginx
location / {
 root html; index index.html index.htm; proxy_pass http://192.168.100.36:9528; 
# 新增超时配置 
proxy_connect_timeout 300s; proxy_read_timeout 300s; proxy_send_timeout 300s; send_timeout 300s; 
# --CORS配置 
add_header Access-Control-Allow-Origin $http_origin; 
add_header Access-Control-Allow-Methods "GET, POST, OPTIONS, PUT, DELETE" always; 
add_header Access-Control-Allow-Headers "Authorization, Content-Type, X-Requested-With" always; 
add_header Access-Control-Allow-Credentials true always; if ($request_method = OPTIONS) { add_header Access-Control-Allow-Origin $http_origin; 
add_header Access-Control-Allow-Methods "GET, POST, OPTIONS, PUT, DELETE"; 
add_header Access-Control-Allow-Headers "Authorization, Content-Type, X-Requested-With"; return 204; 
	} 
}
```
