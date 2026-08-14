---
title: 【Teamcenter password首选项】密码策略2025-06-28T17:17:24.52...
updated: 2026-07-05T17:08:54
created: 2026-07-05T17:08:54
tags:
  - TC
---

【Teamcenter password首选项】密码策略2025-06-28T17:17:24.523Z

源网页：https://mp.weixin.qq.com/s?\_\_biz=Mzk2NDc1NDIyOQ==&mid=2247483911&idx=1&sn=8050ba6e548e78f07b329df356ca612b&chksm=c5a5d7a93321e8c71c5eb517878baa9dc78c937d26f64996d7a83ee5c1ab32000a0ad21c579a&mpshare=1&scene=1&srcid=0628zYIo5MltorDwWWEqEOQY&sharer_shareinfo=6f9839ec40a2012018cf49b4ce569813&sharer_shareinfo_first=6f9839ec40a2012018cf49b4ce569813#rd
**网页内容：**
公众号名称：小明学Teamcenter
作者名称：chenjiaming
发布时间：2025-04-19 14:04
企业对密码策略往往有要求，为了数据安全，IT部门会对密码策略有所要求，现在讲讲PLM的密码策略控制配置内容。  

![image1](a5d2273b7f9842cbb6a6dc0777c44bb4.png)
首选项1：PASSWORD_minimum_alpha  
确定密码中所需字母字符的最小数量。有效值：一个正整数，其值与密码数据库中分配给密码的最大存储空间的其他最小长度值相加，不得超过最大值。值为0表示不需要最小长度。
![image2](93ca710bfcc646148b07ed347e1d8073.png)
首选项2：PASSWORD_minimum_characters定义新密码所需的最小长度。有效值：一个正整数，其值不得超过数据库中分配给密码的最大存储空间。值为0表示不要求最小长度。  

![image3](8220573ff2fc4c61972a9904e4884c4b.png)
首选项3：PASSWORD_minimum_digits  
确定密码中所需数字的最小数量。有效值：一个正整数，其值与其他最小密码长度值的总和不得超过数据库中分配给密码的最大存储空间。值为0表示不要求最小值。
![image4](71375ffa2fd34558bbf46a80634118a8.png)
首选项4：PASSWORD_minimum_special_chars确定密码中所需特殊字符（在PASSWORD_special_characters首选项中定义）的最小数量。有效值：一个正整数，其值与其他最小密码长度值的总和不得超过数据库中分配给密码的最大存储空间。值为0表示不要求最小值。  

![image5](a0218b085d9c48b2adcc8f6e39100005.png)
![image6](be90722d871e4cd5a5535f929b5f72dd.png)

**网页截图：**
[Webpage.html](85293ce5b6af4e2a98623b17c19a5f6b.html)
