---
title: part在结构管理中显示Design的JT，并正确原点位置
updated: 2026-06-13T22:12:21
created: 2026-07-05T17:04:41
tags:
  - bom
  - BOM
---

将Design与Part版本在Myteamcent中关联:
![image1](a88781ad12f64c1cbb82abcb10699b5f.png)
将Design、part分别发送到多结构管理器（Design在上，Part在下），或发送到多BOM管理器或制造工艺规划器。
![image2](c209b389be5a41bb8bf99edf095fdd7a.png)
注：在多BOM管理器和制造工艺规划器中需要将一个PBOM下拽到下放之后，再进行操作。
选择Design的一个子件，再选中Part的对应子件，点击工具-结构对应-发布数据，勾选形状点击确定。会提示创建全局关联，点击是即可。
![image3](68ea3edcfd8d4b909fb29231e542923a.png)

然后将Part将发送到结构管理器中，查看效果。
![image4](9b145a49d8cb49d2bf08482d70844ca7.png)

发布后移除：
![image5](cc158c68a72843948920360902882036.png)

