---
title: ubuntu添加用户到root组 - 空空dream - CSDN博客
updated: 2026-06-06T00:27:26
created: 2026-07-05T17:04:53
---

下午

已剪辑自: <https://blog.csdn.net/lglglgl/article/details/46932001>
版权声明：本文为博主原创文章，未经博主允许不得转载。 <https://blog.csdn.net/lglglgl/article/details/46932001>
以root身份登录，然后输入
usermod -g root username ，执行完后username即归属于root组了，可以再输入
id username查看输出验证一下，如果看到类似下面的输出：
uid=502(username) gid=0(root) 组=0(root)
就表示OK了
