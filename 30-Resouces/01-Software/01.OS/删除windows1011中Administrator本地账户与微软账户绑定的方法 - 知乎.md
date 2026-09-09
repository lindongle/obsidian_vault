---
title: 删除windows10/11中Administrator本地账户与微软账户绑定的方法 - 知乎
updated: 2026-06-06T10:05
created: 2023-08-03T06:24:13
---

下午
已剪辑自: <https://zhuanlan.zhihu.com/p/615669076>
当我们在windows系统或软件中登陆过微软账户，电脑设置以及edge浏览器等地方便留下了该记录，尽管你用的是本地账户。不影响使用，但如果你的电脑要卖，这就是个问题了。彻底删除的方法如下：
微软账号是个邮箱。运行-regedit，进入注册表，查找“你的邮箱”，删除；继续“查找下一个”，删除......直到全部删完，一般是两三个。注销电脑。
继续，删除
HKEY_CURRENT_USER\Software\Microsoft\IdentityCRL
HKEY_USERS\\DEFAULT\Software\Microsoft\IdentityCRL
注销电脑。
设置-账户-电子邮件和账户，点击你微软账户那个邮箱，出现“删除”菜单，点击。
这样，就彻底没了。
![image1](c478585926dc418ba3f96666a3300d86.png)
