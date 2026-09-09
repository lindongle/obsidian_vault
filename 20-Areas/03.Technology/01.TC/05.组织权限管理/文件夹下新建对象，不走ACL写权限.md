---
title: 文件夹下新建对象，不走ACL写权限
updated: 2026-06-06T10:05
created: 2018-06-08T15:05:31
---

检查该文件夹在BMIDE中的GRM规则，可附加性、可拆离默认Unrestricted，添加关系是不判断是否有写权限，改为WriteAccessReq后才判断。
![image1](821e09c3d8a84db4a3a039db5009858d.png)

