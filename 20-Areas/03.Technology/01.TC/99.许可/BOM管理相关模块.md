---
title: BOM管理相关模块
updated: 2026-06-17T11:30:15
created: 2026-07-05T17:04:50
tags:
  - 许可
  - BOM
---

![image1](2732ab4c72fe4a08bb1424b16fdedce5.png)
TC030781Teamcenter EBOM Level I Unit (前置是作者):
包含了TC030755 Multi-Structure Foundation（前置是作者），用于DesignPart模式，D-Ebom，==2512后还需要BOM Unit Consumer (TC030782)==
TCM055020 Teamcenter Manufacturing Planning Base 包含了TC030501 Context Management User 和TCM55086 MBOM Manager（前置是TC030755和TC030501）的feature的

TC030755Teamcenter BOM Multi-Structure Foundation是设计 eBOM 对齐管理器（TC030750，前置为作者）​ 和 MBOM 管理器（TCM55086）​ 的必要前提条件。

方案一：
TeamcenterEBOMUnitLevel1-Part、Design模式
TeamcenterEBOMUnitLevel2-UsageBOM，通常E转M，把Design转Part，相互表达关系；Usage，则Design和Par存到特殊Item中，这个特殊Item也有版本；
方案二：
Multi-BOM模块在AWC上没有；TCM的Base中包含了BOM转换（E--\>M）的功能，如果工艺人员转BOM可以只用TCMBase即可；如果专门做BOM的工程师，可以配置3个模块，包括：MBOM及2个前置模块（Fundation、Context）；

