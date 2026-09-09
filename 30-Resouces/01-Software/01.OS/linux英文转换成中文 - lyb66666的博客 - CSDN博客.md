---
title: linux英文转换成中文 - lyb66666的博客 - CSDN博客
updated: 2026-06-06T00:27
created: 2018-10-15T08:22:18
---

上午

已剪辑自: <https://blog.csdn.net/lyb66666/article/details/78819637>
首先以管理员（root）身份登录
然后在终端输入
\# echo 'LANG=zh_CN.utf8' \>\>/etc/profile  
\# source /etc/profile  
\# su -l
完成后重新启动即可
