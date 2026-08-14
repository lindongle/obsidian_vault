---
title: 新建ID时，调用ID生成规则
updated: 2026-06-06T10:08:52
created: 2026-07-05T17:04:44
---

新建ID时，调用ID生成规则
2022年11月27日
0:37
Swim.xml中创建渲染，点击时会弹出输入界面。
\<idgenerator_dialog_style\>
\<ipn name="ITI9_ipnIdGenSiemens"
order="iti9_idGenDepartment:iti9_idGenProductLine:iti9_idGenMakeBuy:iti9_idGenUnit"/\>
\</idgenerator_dialog_style\>
![image1](b5d8b26553a146bdb9402ddce9008364.png)
克隆操作时可以指定哪些属性不被克隆
\<clone_exclude_model_properties\>
\<pdm_property name="item_type"/\>
\<pdm_property name="item_name"/\>
\<pdm_property name="Dataset.object_type"/\>
\<pdm_property name="Dataset.object_name"/\>
\</clone_exclude_model_properties\>

