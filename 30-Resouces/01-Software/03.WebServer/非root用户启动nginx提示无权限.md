---
title: 非root用户启动nginx提示无权限
updated: 2026-06-06T10:05:34
created: 2026-07-05T17:04:54
---

\# 1. 查找Nginx二进制文件路径（先执行，确认路径） find / -name nginx -type f -perm /u+x 2\>/dev/null \# 常见路径：/usr/sbin/nginx（yum/apt安装）、/usr/local/nginx/sbin/nginx（源码编译） \# 2. root用户执行（仅需一次，永久生效） sudo setcap cap_net_bind_service=+ep /usr/sbin/nginx \# 替换为你的实际路径 \# 3. 验证权限是否生效 getcap /usr/sbin/nginx \# 输出：/usr/sbin/nginx = cap_net_bind_service+ep → 成功

*From \<<https://www.doubao.com/chat/32932207204630274>\>*
![image1](009a919c340b4594a1a77a780ca446ac.png)

