---
title: Substance物质
updated: 2026-06-06T10:09
created: 2020-02-13T10:29:59
---

物质与材料目录没有任何关系。
新建物质：
文件-新建substance，输入基本信息点击确定。
![image1](d9a2f7b69a3947b09a09dfdc69010f2d.png)
将物质添加到材料上。
选择材料版本，切换到Substance标签页，点击右上方添加物质到材料按钮。
搜索对应的材质，点击确定。
![image2](c6e34efcb2f144829cca34239e45cca3.png)
输入该物质在材料中成分比例和最大比例，点击确定。
![image3](28b94f309af449d2a0aea915d9237056.png)

![image4](a5c493e9c60d4925a57a0691611e6f0d.png)
其中首选项MATERIALMGMT_substance_composition_tolerance_lower和MATERIALMGMT_substance_composition_tolerance_upper（1e-007，即0.0000001）决定了成分的最大和最小的偏差值。
<span style='background:yellow;mso-highlight:yellow'>这些首选项定义了百分比偏差值，其中材料的物质成分可以小于或大于完全含量（100％）。 例如：</span>
<span style='background:yellow;mso-highlight:yellow'>lower如果将下限设置为10％，则表示成分不能少于90％。</span>
<span style='background:yellow;mso-highlight:yellow'>upper如果上限设置为20％，则表示成分不能超过120％。</span>
<span style='background:yellow;mso-highlight:yellow'>这些值还将用于确定材料的实际成分不足。</span>
移除物质，点击右上方移除属性的图标（物质也为材料的一种特殊属性）即可。
![image5](52837a8731a346d5955f98f023b4ea2b.png)

