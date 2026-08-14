---
title: 批量设置复合属性到bomline的BOM属性
updated: 2026-06-06T00:13:47
created: 2026-07-05T17:04:45
---

在PSE中要显示自定义Item属性，通常是在BOMLine中添加复合属性，将自定义Item中的属性复合到BOMLine中，如果属性多的话，这样做就比较麻烦。还有一种更简便的方式就是通过全局常数。
要实现这个功能，在BMIDE中有两个常数：BOMLineRevConfiguredProperties和Fnd0BOMLineRevConfigProps 。前者是针对属性定义在ItemRevisionMaster上，后者是针对属性定义在ItemRevision上。具体设置如下：
1.在BMIDE扩展视图上，点击右键，在弹出的菜单中选择“打开全局常数编辑器”
2.在全局常数页面，如果是将属性定义在ItemRevision Master上的，那么选择BOMLineRevConfiguredProperties常数，如果是将属性定义在ItemRevision上的那么选择Fnd0BOMLineRevConfigProps常数，然后点击“编辑”。
3.点击“添加”，在值中加入自定义ItemRevision，点击“完成”。
4.重新加载数据模型。
5.打开BOMLine对象，可以在属性中看到刚才加入的对象属性。
6.登入TC系统，打开PSE，在BOM行表头点击右键，选择“插入列”，就可以在“可用的列”中找到自定义Item的属性，将其加入到“显示的列”中即可在PSE中显示。
