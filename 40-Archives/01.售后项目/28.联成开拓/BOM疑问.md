---
title: BOM疑问
updated: 2026-06-05T22:54
created: 2024-07-31T16:23:29
---

- 针对产成品/半成品有A/B/C/D样：裸机/PCBA/结构件（含外购-外协结构件）--需要开发的，自己开发或供应商开发的
- A样如何采购/生产组织；不管有没有工单，下发到SAP即可。
- EBOM转状态，MBOM也会转吗，都转状态。各自按需转换。--MBOM在研发环节出，负责状态转换。可以兼职做现场工艺。--研发工艺组织结构的搭建。标准化工作--胥慧（体系）
- ECN变更下发时发的EBOM的变化还是MBOM的变更？只做一个ECR/ECN，只针对MBOM变更，
- 包装在什么时候出？每个阶段的BOM结构大概什么样子？
- A/B样走EBOM，C/D样走MBOM？A/B样BOM不下发SAP
- A样EBOM，B样开始MBOM--SAP顾问。
- <span style='color:#FA0000'>B样为OTS件，B样后进行OTS认证，C样后PV。</span>
- <span style='color:#FA0000'>跟潘总沟通，A/B样不下发（走设计变更），到C样下发SAP，走ECR/ECN（工程变更）</span>
- <span style='color:#FA0000'>EBOM上成品-裸机-PCBA料号先给出来。</span>
- A样阶段，无结构件，只有PCBA
- 成品BOM（带包装）B样才会搭建
- 物料上体现自制/采购/可供
- 只有PCBA/裸机存在ABCD样，结构件及软件先不考虑
- PCBA，A样时通过EBOM下发SAP，B样时做MBOM
- 结构件及软件何时下发SAP？--B样
- ABCD样到量产，通过版本控制，不通过物料号控制。
- 结构件不限制阶段搭建EBOM。
- 对于外购总成，下级单独采购的处理，委外加工（委外镀铬/油漆/机加等，拆半成品）---下周跟SAP顾问沟通。
  - 总成
    - 屏幕
    - 壳体（单独采购发屏幕厂商，组装组成供货）
- 明确EBOM/MBOM/BOP--沟通MES标准术语，及系统职责，MBOM（包括产品辅料）-SAP（跑MRP）-MES，MES出BOP（PCBAD的B面/T面是否分开，跟孙斌沟通，DIP是否需要打包半成品与孙斌沟通，目前是放到PCBA上公式）
- 检测工序不体现在MBOM中，BOP中体现
- 定义A/B/C/D流程，中间A1/A2不管。

