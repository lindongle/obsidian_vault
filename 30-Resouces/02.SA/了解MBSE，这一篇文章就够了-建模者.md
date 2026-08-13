---
title: 了解MBSE，这一篇文章就够了-建模者
updated: 2026-06-05T21:44
created: 2026-04-09T09:18:22
---

了解MBSE，这一篇文章就够了-建模者

[源网页](http://www.uml.org.cn/modeler/20190911.asp)
<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><strong>编辑推荐:</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>本文主要介绍了什么是MBSE？ 为什么要做MBSE？ 以及我们怎么做MBSE的相关内容，希望对大家能有所帮助 。<br />
本文来自于公众号SZHCYBJ，由火龙果软件微微编辑、推荐。</td>
</tr>
</tbody>
</table>
引言
基于模型的系统工程(MBSE)作为未来工业研发数字化的重要发展方向之一，需要大量相关技术人才支撑其在各行各业的应用。从目前来看，国内掌握MBSE技术的人才数量远远低于需求量，各行业MBSE实践项目受制于人才短缺的现象明显。
![image1](b9e6070f515bc1de.png)
可预见的未来几年，随着行业应用需求的增强，将会有越来越多的技术人员投入MBSE方向。这些技术人员的来源，要么是原本各研发岗位上的工程师，通过学习这方面的技术应用到研发工作中；或者是应届毕业生或其他技术方向从业者转向MBSE领域。
不管未来这些技术人员来自哪个方向，在最初接触MBSE这一概念的时候，都不可避免的要了解这一领域方方面面的概念和知识，来实现“入门”。
鉴于此，特将近期做的一次科普性质的MBSE培训部分内容整理如下，希望能够通过一篇文章，用最简单、易懂的语言讲清楚MBSE，为希望了解MBSE的人提供一个大概轮廓和入门导航。
本文章节安排如下：
什么是MBSE？
为什么要做MBSE？
怎么做MBSE？示例
掌握MBSE需要学习哪些内容？
学习资料推荐
1\. 什么是MBSE
基于模型的系统工程(MBSE)是相对于传统基于文档的系统设计而言的，传统设计方式中，系统方案设计阶段多数通过撰写方案设计文档来对系统进行定义，如下图所示：
![image2](de82d48e88964fc5a699da60ae97c3dc.png)
MBSE(基于模型的系统工程) = 用数字化建模代替写文档进行系统方案设计，把设计文档中描述系统结构、功能、性能、规格需求的名词、动词、形容词、参数全部转化为数字化模型表达。
![image3](f79a471bb96f4bfd9cc47748416bc4b8.png)
以下例子可帮助直观理解如何从文档转换到数字化模型：
1\) 名词（描述系统结构）
基于文本的设计：
“该系统由发动机、通信系统、控制系统、生命保障系统等子系统构成”
MBSE中的数字化模型表达：
![image4](0af55683dfb747579ea385da48017a5b.png)
2\) 动词（描述系统行为）
基于文本的设计：
“系统的启动过程为：首先启动发动机，然后依次检查控制系统、生命保障系统、通信系统状态，如一切正常，则进入工作状态；如发现异常，则由操作人员进行故障排查。”
MBSE中的数字化模型表达：
![image1](b21827cce68e46d7b9e6070f515bc1de.png)
3\) 参数（对系统规格、系统性能等的定量描述）
基于文本的系统设计：
“需求A：系统总重量不能超过100kg。”
MBSE中的数字化模型表达：
![image3](f79a471bb96f4bfd9cc47748416bc4b8.png)
4\) 形容词（需要被量化）
形容词是文档中的特殊产物，在模型中不存在对应内容。
原因在于形容词是模糊描述，无法明确表达，也意味着无法准确验证。因此，理论上，在系统设计和需求规格描述中，不应该使用形容词。否则可能导致下图中的后果：
![image3](f79a471bb96f4bfd9cc47748416bc4b8.png)
2\. 为什么要做MBSE
1\) 当前的挑战
在当前航空、航天、汽车等行业，对工业产品易用性、舒适性、安全性等方面要求的提高，导致当前工业产品电气化、智能化程度越来越高，产品复杂度的量级不断跃升。
![image2](de82d48e88964fc5a699da60ae97c3dc.png)
基于文本的系统设计方式存在天然局限，导致其越来越难以应对当前的复杂产品设计挑战，比如：
基于自然语言描述的设计文档一致性差，沟通效率低且容易出现歧义；
自然语言容易引入形容词等模糊描述，很难保证准确性
文本描述的设计元素之间无法实现追溯分析，当出现设计变更时很难对变更影响进行准确评估
基于文本的设计方案无法进行前期仿真验证
设计方案无法与详细设计阶段的数字化模型（如CAD）关联...
而MBSE技术的出现为应对这些问题提供了有效的应对手段。
2\) MBSE带来的价值
一项新技术最终的价值体现，一般有：
节省成本，省钱
提高效率，省时间
保证产品质量，提高产品竞争力
产品质量提升→产品问题减少→研发周期&运维成本降低→省钱&省时间
产品竞争力提高→销量提升→企业利润提高
基于上述几个角度，我们分别从几个系统设计活动– 需求分析&验证、系统设计、系统验证，来具体分析MBSE到底可以为企业带来哪些价值：
（红色代表文本无法实现而MBSE能够实现的功能，蓝色代表MBSE相对文本的优势功能）
![image5](fb84cdb777e94d2390cabd28b8a786ca.png)
3\. 怎么做MBSE？示例
MBSE是系统设计工作通过数字化设计手段的实现，因此在工作流程上与传统系统工程并无太大差异，仍然分为需求分析、系统设计、系统验证、需求确认四个步骤。
具体实现方式案例如下：
1\) 需求分析
实现需求条目化分类，并对特殊需求（性能需求）进行量化描述：
![image1](b21827cce68e46d7b9e6070f515bc1de.png)
需求类型示例
![image2](de82d48e88964fc5a699da60ae97c3dc.png)
需求量化描述
2\) 系统设计
依照特定的系统设计逻辑方法，完成系统功能、结构设计，以及参数化表征，并将设计内容与需求进行关联，确保追溯关系完整。
![image2](de82d48e88964fc5a699da60ae97c3dc.png)
系统设计
![image4](0af55683dfb747579ea385da48017a5b.png)
系统设计与需求的关联追溯
3\) 系统验证
基于数字化系统设计模型进行系统仿真，根据设计需求进行系统验证工作
![image2](de82d48e88964fc5a699da60ae97c3dc.png)
系统模型仿真验证
4\) 需求确认
将设计参数值与量化的需求约束进行验证
![image5](fb84cdb777e94d2390cabd28b8a786ca.png)
需求确认
4\. 掌握MBSE需要学习哪些内容
MBSE的三大支撑：方法论、系统设计语言、系统建模工具。
1\) MBSE方法论
MBSE方法论是设计师进行系统设计活动的指南，不同行业、不同产品在实际产品研发方面都有其特殊的地方，因此在方法论方面会有不同的选择。
以下提供了当前MBSE方法论方面能够查找到的部分公开资料，可作为企业在实践MBSE项目时的参考。
企业在实际项目中选择哪一种方法论、对方法论做哪些特定的裁剪，需要基于企业当前研发流程的实际需求来分析和确定，而不能直接照搬某个“理论模型”。
关于MBSE方法论，2008年有相关研究汇总了当时的相关理论 - "Survey of Model-BasedSystems Engineering (MBSE) Methodologies", 报告中涵盖了以下6类不同的MBSE方法论：
INCOSE Object-Oriented SystemsEngineering Method (OOSEM)
IBM Rational Telelogic Harmony-SE
IBM Rational Unified Process for Systems Engineering (RUP-SE)
Vitech Model-Based Systems Engineering (MBSE) Methodology
JPL State Analysis (SA) Methodology \| JPL State Analysis (SA)
Dori Object-Process Methodology (OPM)
在此之后，作为补充，http://www.omgwiki.org/MBSE中的“Methodology and Metrics”文章里又增加了几类MBSE方法论的介绍，包含：
Weilkiens Systems Modeling Process (SYSMOD)
Fernandez Process Pipelines in OO Architectures (PPOOA)
An Ontology for State Analysis: Formalizing the Mapping to SysML
ISO-15288, OOSEM and Model-Based Submarine Design
Alstom ASAP Methodology
Pattern-Based Systems Engineering (PBSE)
Arcadia, a model-basedengineering method
以上这些仅仅为MBSE方法论的部分内容，在此之外，仍有一些公司或研究者针对特定应用场景提出了自己的方法论。比如，当前在国内工程界应用广泛的MagicDraw工具，其母公司NoMagic(现被达索析统公司收购)也独立提出自己的MagicGrid方法论。
2\) 系统设计语言
系统设计语言是描述系统设计的标准"语法"，当前MBSE领域主流的系统设计语言是OMG维护和发布的SysML – System Modeling Language，该语言基于UML发展而来，并专门针对系统设计领域特点进行了扩展。
(SysML虽为主流MBSE建模语言，但仍有部分软件工具通过非SysML语言进行模型描述，此处不做展开。)
SysML是一种图形化设计语言，共包含9类图，如下所示：
![image2](de82d48e88964fc5a699da60ae97c3dc.png)
9类图分别用来描述系统设计过程中的需求、系统结构、系统行为和系统参数:
![image6](5a4f7065f63a43d7be9981c3553f0ddd.png)
3\) 系统建模工具
目前国内工程领域主要的MBSE工具为NoMagic(达索) MagicDraw和IBM Rhapsody，其他如Sparx Systems的Enterprise Architecture, 达索CATIA RFLP, Siemens PLM, ANSYS Scade等也有部分应用。
更多MBSE建模工具可参考：
<https://mbse4u.com/sysml-tools>
<https://mbseworks.com/mbse-tools>
MBSE建模工具的选择需要考虑因素过多，需要根据不同企业具体情况具体分析，此处不做过多展开。
