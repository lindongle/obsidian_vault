---
title: 蓥石方案学习-Part零件管理
updated: 2026-06-06T10:09
created: 2018-06-21T16:28:45
---

![image1](7690851750824441a9095e71cef84273.png)

![image2](dbbf830c9d144830a952aa570654e43e.png)
<span style='color:black'>==EWO中描述该零件有图纸，Design对象版本发布状态为2还是3？三维模型只有012，三维到2状态，才能发布图纸，图纸发布成3状态。==</span>
![image3](fc29fc71e9f14abc9472150c70453561.png)
<span style='background:yellow;mso-highlight:yellow'>一对多的场景？左右对称件。共图件。数模修改后，图纸不改。</span>
<span style='color:black'>==图纸下挂两个对称件，图纸下有product和drawing两个数据集。==</span>
![image4](1937921856d5424abf79e082e4623518.png)
<span style='color:black'>==这里的定位件是指post虚拟件吗？，如果变形件使用变形件item管理，一对多变为一对一？==</span>
<span style='color:black'>==零件和数模两种item类型如何操作使用同一个编号？--新建-零件，勾选设计。==</span>
<span style='color:black'>==如果数模升版后对于关系中的part如何处理，引用还是不复制，如何确定版本的一一对应关系？手动复制？--数模是零件的一部分（关系）。--不复制。==</span>
<span style='color:black'>==同样如果图纸升版后，下级装配中的数模版本如何控制？-不处理。==</span>
