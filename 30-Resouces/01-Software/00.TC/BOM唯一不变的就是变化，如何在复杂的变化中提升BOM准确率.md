---
title: BOM唯一不变的就是变化，如何在复杂的变化中提升BOM准确率?
updated: 2026-06-06T10:08
created: 2020-07-30T23:05:10
tags:
  - TC
---

## <span style='color:#2E75B5'>BOM唯一不变的就是变化，如何在复杂的变化中提升BOM准确率? </span>
![image1](e6e09d7d86e74850bffbde225e528fc9.jpg)
<span style='font-weight: bold;background:#ADFBBF'>本文导读</span>
<span style='background:white'>“BOM唯一不变的就是变化”，如何在复杂的变化中保持较高的准确率，满足各业务部门的需求？</span>
<span style='background:white'>注：资料来源网络，品质人生质量开讲平台搜集整理，仅供学习所用。</span>

![image2](71681a8d9e3c47fa89c874a01664ef71.gif)
<span style='background:white'>BOM（Bill of Material，BOM）早就不仅仅是物料清单的概念，而是一个跨领域、跨专业的管理体系。是制造业信息化系统中核心的基础数据，贯穿于销售、研发、工艺、计划、制造、采购、仓库、物流、财务、售后等全价值链的整个产品生命周期的几乎所有职能部门。BOM是唯一将这些环节联系在一起的纽带。</span>

<span style='background:white'>在整车研发过程中，不同的阶段、不同的使用部门，BOM存在不同的形态，不同的部门有着不同的BOM数据需求。</span>

<span style='background:white'>本文的观点为：“</span><span style='font-weight:bold; color:#FF8124;background:white'>BOM唯一不变的就是变化</span><span style='background: white'>”，如何在复杂的变化中保持较高的准确率是本文研究的课题。</span>

<span style='background:white'>首次冻结EBOM后，随后在产品及工艺验证、预试生产、试生产等过程发现EBOM数据中存在的问题时，必须走工程变更，并修改EBOM数据和产品相关文件。首次交付给生产制造部门时，BOM准确率一定是100%，后期随着业务的开展，数据准确率慢慢下降，严重的程度导致库存呆滞、资金大量占用、生产线停产等情况发生。</span>

<span style='background:white'>BOM数据从TG1阶段开始走EWO变更，而EWO的Open、Draft、Approve、Process、Implementation、Close的六个阶段是按照公司的业务定制的流程，从流程上看是符合公司的标准的、闭环流程管理。问题产生的关键在于执行过程中没有有效的按照流程去执行。</span>

<span style='background:white'>本文归纳BOM易出错误的类型及实际的业务现状进行分析，</span><span style='font-weight:bold;color:#FF8124;background:white'>归纳总结BOM准确率的管理机制</span><span style='background:white'>，保证开发各阶段的BOM准确率，满足各业务部门的需求。保证企业经营管理中各项任务的顺利完成与各项管理成本的降低。</span>

«span style='background: \#59BFBA'»BOM数据错误类型归纳«/span»

<span style='font-weight:bold;background: white'>1. BOM管理形态分析</span>
<span style='background:white'>随着BOM数据的演变，从传统的单一车型BOM逐一演变成如下形式的BOM：</span>

<span style='color:#EE4141;background: white'>⏩ 传统的单车BOM：</span><span style='background:white'>包括单层展开、缩行展开、汇总展开、单层跟踪、缩行跟踪、汇总跟踪等形式，即一车一表形式；单一车型BOM管理的内容针对性较强，适用于改装车、工程车、以及船舶、飞机等规格单一固定，且各车型间关联度很小的车型数据管理。各个单一车型BOM在PDM系统单独存在，因此各个BOM之间没有直接关系，有多少种车型规格则就有多少种单一车型BOM，可变性不强，数据冗余度大；</span>

<span style='color:#EE4141;background: white'>⏩比较式BOM：</span><span style='background:white'>是以标准产品为基准，并规定还可增加哪些零件或去掉哪些零件，能有效地描述不同产品之间的差异，即基础表+增减单（Basebom+A/DList）形式；</span>

<span style='color:#EE4141;background: white'>⏩超级BOM：</span><span style='background:white'>是对具有大量通用零件的产品系列进行数据合并后得到的一种BOM，可用来识别和组合一个产品系列中的通用型零件；也称全配置BOM；根据车型配置代码表编制零部件所属车型，既需要考虑当前车型的配置需求，也需要考虑产品结构树中对其他车型的影响。车型配置中零部件间的组成关系对配置管理的复杂度有很大的影响。</span>

<span style='color:#EE4141;background: white'>⏩模块化BOM：</span><span style='background:white'>可用于由许多通用零件制成的并有多种组合的复杂产品，按照装配最终产品的要求来组建模块，通过不同的模块选择就可以组合成不同的最终产品。</span>

<span style='background:white'>对于产品较单一、配置数量较少、用户个性化需求较少的传统制造加工企业，单车BOM与比较式BOM用法较多。对于产品丰富、配置数量较多、用户个性化需求较多的大型制造企业后两种用法较多。根据调研国内大型的OEM，多数选择第三种BOM管理模式，本文针对第三种BOM管理模式进行分析。</span>
![image3](468f6586d2a449ca929d6b39fff0e591.jpg)

<span style='font-weight:bold;background: white'>2. BOM数据主要错误类型</span>
<span style='background:white'>根据BOM在产品设计制作中的用途，可以分为3种类型，即</span><span style='color:#EE4141;background:white'>设计物料清单（EBOM）</span><span style='background:white'>、</span><span style='color:#EE4141;background:white'>工艺物料清单（PBOM）</span><span style='background:white'>和</span><span style='color:#EE4141;background:white'>制造物料清单（MBOM）</span><span style='background:white'>。EBOM由基础组件、逻辑总成和独立总成组成，体现产品功能；通过拆解重建BOM结构、增加工艺合件将EBOM转换为PBOM，进而体现工艺设计；在PBOM基础上增加库位、库存、成本、有效日期等生产控制需要的信息，即形成MBOM。如下错误类型涵盖了三种用途BOM的常见错误，把问题分类有利于发现问题，解决问题。</span>

<span style='font-weight:bold;background:white'>零件属性：</span><span style='background: white'>单位、数模编号、数模版本、图纸号、图纸版本、一些部门需求的标识等错误；</span>

<span style='font-weight:bold;background:white'>零件数量：</span><span style='background: white'>BOM中1级零部件及下级零部件数量错误；</span>

<span style='font-weight:bold;background:white'>配置问题：</span><span style='background: white'>市场配置表中的配置（DMS）、工程配置（BOM系统）、生产配置（SAP、APS、MES、LES）三者不符情况；</span>

<span style='font-weight:bold;background:white'>UCString：</span><span style='background:white'>因变量条件描述不准确导致BOM错误情况；</span>

<span style='font-weight:bold;background:white'>模块问题：</span><span style='background: white'>模块件产生的BOM数据错误；</span>

<span style='font-weight:bold;background:white'>采购状态：</span><span style='background: white'>因货源问题引起的BOM数据错误；</span>

<span style='font-weight:bold;background:white'>BOM结构：</span><span style='background: white'>IA、VPPS、FNA、结构标识、以及多件、少件、错件、层级结构等引起的BOM数据错误；</span>

<span style='font-weight:bold;background:white'>结构方案：</span><span style='background: white'>因结构标识、VPPS、FNA、父件、子件等维护错误造成的不能生成完整结构的问题；</span>

<span style='font-weight:bold;background:white'>BP管控：</span><span style='background: white'>EWO在各生产基地大线上实施的BP与系统BP不一致情况；</span>

<span style='font-weight:bold;background:white'>数据应用：</span><span style='background: white'>BOM数据正确，现场未按照系统数据使用情况；</span>

<span style='font-weight:bold;background:white'>工位错误：</span><span style='background: white'>系统工位与实际装车不符情况；</span>

<span style='font-weight:bold;background:white'>业务流程：</span><span style='background: white'>未按照业务流程操作引起BOM数据错误情况；</span>

<span style='font-weight:bold;background:white'>正常差异：</span><span style='background: white'>使用部门对BOM数据存疑，经反馈无问题或业务流程允许情况；</span>

<span style='font-weight:bold;background:white'>基础数据：</span><span style='background: white'>包括车型系列、车型、车型配置、发动机表、分组和部位等信息。</span>

«span style='background: \#59BFBA'»BOM数据准确率设定«/span»

<span style='background:white'>1. 以车型超级BOM行数为基数统计；准确率=BOM正确条数/BOM总条数X100%；</span>

<span style='background:white'>2. 构错误，按一条错误统计；如相同零部件号出现两行结构错误，则错误条数为两条；</span>

<span style='background:white'>3. 零部件结构正确，零部件属性错误，如同一行发生三处零件属性错误，则错误条数为三条错误。因为每一个属性都影响到下游的使用；</span>

<span style='background:white'>4. 每月统计一次，其它等临时指令除外。</span>
![image4](0f6770be1050433e97479ef12742e11a.jpg)

«span style='background: \#59BFBA'»BOM数据标准、考核方式«/span»

<span style='background:white'>处理业务过程中所产生的数据是帮助企业决策的主要因素，不正确或不完整的数据可能会导致决策错误或失败，这就使得</span><span style='font-weight:bold;color:#FF8124;background:white'>数据质量对企业来说十分重要</span><span style='background:white'>。</span>

<span style='background:white'>企业经营环境中的管理方法会直接影响企业数据的质量，所以数据质量管理方法的应用研究对企业的数据质量就变得非常有意义，根据开发阀点不同，产生的数据状态就会不同，因此考核的标准及方式应该不同。</span>

<span style='font-weight:bold;background: white'>1. 规划至工程发布阶段：</span>

<span style='color:#EE4141;background:white'>数据标准：</span><span style='background: white'>产品配置表冻结，TG2数据100%发布完成，BOM结构100%冻结，零部件号、零部件名称、VPPS、FNA、一些部门需求的标识应该确定；</span>

<span style='color:#EE4141;background:white'>考核方式：</span><span style='background: white'>此阶段属于数据验证阶段，装车验证未开始，错误数据对下游部门影响较小。BOM管理小组根据需求检查BOM数据的准确性。并在开发组内通报，限期整改；产品设计阶段决定了产品总成本的80％，降低成本的最好时机应该是产品的设计阶段。设计的产品成本估算、分析、控制等的研究，有助于企业达到大大降低成本的目的。此阶段虽然考核力度小，但是影响较大，应更加加以重视；</span>

<span style='font-weight:bold;background: white'>2. 工程发布至生产导入阶段：</span>

<span style='color:#EE4141;background:white'>数据标准：</span><span style='background: white'>产品配置表冻结，TG2数据100%发布完成，BOM结构100%冻结，一些关键性标识字段应该确定；</span>

<span style='color:#EE4141;background:white'>考核方式：</span><span style='background: white'>此阶段BOM数据已经完成冻结。并已输出给下游部门，此阶段的错误数据会对下游有一定的影响，BOM准确率应保持96%以上，BOM管理小组定期检查BOM数据的准确性。并通报，限期整改；检查手段可以用差异件清单与系统数据变化对比（将前后两个不同日期下载的EBOM数据进行对比，对比信息主要有：零件结构变化、配置变化、货源变化、零件名称、用量等信息。</span>

<span style='font-weight:bold;background: white'>3. 生产导入至量产后阶段：</span>

<span style='color:#EE4141;background:white'>数据标准：</span><span style='background: white'>产品配置表冻结，TG2数据100%发布完成，BOM结构100%冻结；采购属性、工艺属性应该确定；</span>

<span style='color:#EE4141;background:white'>考核方式：</span><span style='background: white'>此阶段BOM数据已经传输至下游部门及生产系统，此阶段的错误数据对管理成本影响较大；BOM准确率应保持99%以上。检查手段同上，BOM管理小组编制BOM运行定期统计报表。并将BOM数据错误明确到产品、部门、责任人，反馈给绩效管理部门，绩效管理部门以QCD标准扣除责任部门的当月绩效当量。</span>

«span style='background: \#59BFBA'»责任界定、反馈机制«/span»

<span style='font-weight:bold;background: white'>1. 成立BOM数据问题工作组</span>
<span style='background:white'>涉及跨业务、跨平台、跨产品的数据，需要各部门之间相互协商解决，成立BOM数据问题工作组将最快的解决问题。</span>

![image5](dafbda094cd94077bab91b829771b325.jpg)
<span style='background: white'>图：BOM问题工作小组</span>

<span style='font-weight:bold; background:white'>工作组职责</span>

<span style='color:#EE4141;background:white'>领导组：</span><span style='background:white'>跨业务、跨平台、跨产品等疑难问题仲裁；</span>

<span style='background:white'>工作组：</span>
- <span style='background:white'>负责产品相关指令的下发；</span>
- <span style='background:white'>负责产品内BOM问题的协调；</span>

<span style='background:white'>BOM管理组：</span>
- <span style='background:white'>负责BOM问题的检查；</span>
- <span style='background:white'>负责BOM问题的收集；</span>
- <span style='background:white'>负责BOM运行定期统计报表编制；</span>

<span style='color:#EE4141;background:white'>专业组：</span><span style='background:white'>负责本专业部门BOM问题协调、整改；</span>

<span style='color:#EE4141;background:white'>采购组：</span><span style='background:white'>负责采购部门BOM问题协调、整改；</span>

<span style='color:#EE4141;background:white'>生产组：</span><span style='background:white'>负责生产部门BOM应用问题协调、整改；</span>

<span style='color:#EE4141;background:white'>工艺组：</span><span style='background:white'>负责生产工艺部门BOM应用问题协调、整改；</span>

<span style='color:#EE4141;background:white'>售后组：</span><span style='background:white'>负责生产售后部门BOM应用问题协调、整改；</span>

<span style='color:#EE4141;background:white'>销售组：</span><span style='background:white'>负责生产销售部门BOM应用问题协调、整改；</span>

<span style='font-weight:bold;background: white'>2. BOM数据运行反馈流程</span>

<span style='background:white'>BOM数据是研发部门输出，几乎所有职能部门使用，所有的应用部门发现问题及时反馈，BOM准确率需要整个公司全员参与，发现问题、分析问题、解决问题，通过问题管理透明实现数据的闭环管理，最终实现解决问题的目的，促进公司研发、采购、生产经营管理各项任务的顺利完成与各项管理成本的降低。</span>

<span style='background:white'>从传统的最简单的电话、邮件、到公司内部流转的各类报表、各种形式的文件等，都对实现问题透明发挥了重要作用，每个岗位的员工都应熟练运用这些工具，达到沟通信息、互通有无、求同存异。这些传统的信息交流方式对解决公司生产过程中出现的问题的作用是举足轻重的。</span>

<span style='background:white'>随着形势的发展，传统的信息沟通、问题透明的方式已远远不能满足公司要求。面对公司生产的快节奏，新问题新矛盾以新的形态不断涌现，如何实现信息共享，达到问题透明的高效率，是各公司都要面临的问题。</span>

<span style='background:white'>个别OEM为了提高问题的反馈及处理的高效率上线了问题管理系统（IMS），影响开发进度的情况，以精细化管理的思想来设计出一套问题管理系统，对问题进行记录，分配，核查，评定，验收等，大大减少了管理中的混乱情况，实现了计划管理，时间管理，绩效管理，流程管理，成本管理，发展管理等全面的管理系统。公司内全员参与，员工认为在生产经营中出现的问题都可以记录系统中，科室主管对问题类型、重要性、影响范围进行确认，部门对问题确认，最终形成公司级别的问题反馈清单。指导公司生产经营改进；针对BOM数据问题，有条件的公司可以通过IMS反馈、解决。</span>

<span style='background:white'>也可以在BOM系统中的知识管理模块进行反馈解决，也可以用传统的电话、邮件进行反馈解决。如上述几种反馈方式不同，但反馈流程如图3所示，应该是全员参与，实现闭环管理。</span>

![image6](1abfa801500e4b69b2578fff8364ce99.jpg)
<span style='background: white'>图：BOM运行反馈流程</span>

«span style='background: \#59BFBA'»结论«/span»

<span style='background:white'>困扰各OEM的管理问题，BOM问题出现的频率一定不低，因BOM的存在环节太多，几乎所有的数据运行都与BOM有关，听到最多的结论就是BOM问题。通过本文对BOM数据问题的产生及应用介绍可以说明BOM只是错误结果的一个展示，因不当的业务操作、流程产生错误的过程才是要解决的问题，本文提供了问题的反馈流程及问题解决的工具、方法，将提高公司的BOM运行效率及准确率。</span>

<span style='background:white'>BOM准确率需要公司全员参与，发现问题、分析问题、解决问题，其中发现问题是前提，分析问题是关键，解决问题是目的。要通过问题透明化来加快分析问题、研究问题的进程，最终解决问题，促进公司研发、采购、生产经营管理各项任务的顺利完成与各项管理成本的降低。</span>

<span style='background:#CFF1ED'>1</span>
<span style='font-weight: bold;background:#BBD6B0'>END</span>
<span style='background:#CFF1ED'>1</span>
