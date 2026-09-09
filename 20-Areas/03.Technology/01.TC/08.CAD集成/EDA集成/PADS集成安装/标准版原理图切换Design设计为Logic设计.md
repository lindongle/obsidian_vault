---
title: 标准版原理图切换Design设计为Logic设计
updated: 2026-06-06T10:09
created: 2021-08-16T10:53:19
---

两者区别：
logic和DxDesigner其实差不多，都是绘制原理图的。而DxDesigner的功能相比之下只不过稍微的强大一些。它可以同时几个人完成比较大规模的设计，可以共享自己的设计以及了解别人的进度，进而缩短了研发的周期；它还支持电路复用，简单的说就是将经典电路保存到软件中，随时调用；它的兼容性很好，可以打开Protel、CAD、OrCAD，当然还有logic。应该说DxDesigner的功能更全面一些。
PADS Layout和PADS Router都是PCB布线的，只不过Router主要还是强调布线的一些技巧。logic生成原理图---导入到layout生成PCB---PCB加入边框后----到router中布线。其实到不到router也无所谓，你可以手动布线，而且基本上都是自己手动布线的。router中可以自动布线，而且手动布线有好多技巧方便大家使用，比如：根据环境情况自动改变线宽、蛇形走线、将正在布线的网络高亮显示（其他变灰）、动态显示走线长度等等了，自己去研究吧。

*来自 \<<https://zhidao.baidu.com/question/277776734.html>\>*

标准版默认集成环境会自动启动Designer，如果需要修改为Logic，如下修改，将set UseLogic=0改为1
![image1](8609670c2b9040679e0c28f7bc9e25af.png)

