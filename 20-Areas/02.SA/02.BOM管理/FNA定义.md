---
title: FNA定义
updated: 2026-08-31T14:03:05
created: 2026-07-05T17:04:37
tags:
  - BOM
---

完整定义一个零部件要素如下：
**零件号+零件名称+功能区域码+功能位置码+零件描述**
（一）<span style='font-weight:bold'>功能区域码与功能位置码</span>为了更有效地进行零部件范围及用法定义，车企一般引入功能区域码和功能位置码的概念。所谓功能区域码，就是按照整车上具有相对独立的功能的系统部件划分若干功能区域，并通过编制不同的功能区域码进行识别。而同一功能区域下不同用法的零部件则通过功能位置码来描述。在上一节中谈到VPPS，那么<span style='color:#FA0000'>VPPS码与功能区域码、功能位置码</span>是<span style='color:#FA0000'>什么关系</span>呢？同时采用VPPS码以及功能区域码、功能位置码的企业，一般将功能区域码与VPPS码的层级建立关系，并通过相应层级的VPPS码自动进行功能区域编码，如图5-3所示。
![image1](a9ebe10b5168484b9af62a2afa6bbf19.png)
«span style='font-family:"Microsoft YaHei"'»图«/span»<span style='font-family:Calibri'>5-3 VPPS</span>«span style='font-family:"Microsoft YaHei"'»码与功能区域码、位置码的关系在图«/span»<span style='font-family:Calibri'>5-3</span>«span style='font-family:"Microsoft YaHei"'»中，整车的功能区域按照«/span»<span style='font-family:Calibri'>VPPS</span>«span style='font-family:"Microsoft YaHei"'»的第三层级进行划分，并且通过«/span»<span style='font-weight:bold;font-family:Calibri;color:#FA0000'>VPPS</span>«span style='font-weight:bold;font-family:"Microsoft YaHei";color:#FA0000'»第三层的编码形成缩写码作为功能区域码«/span»«span style='font-family:"Microsoft YaHei"'»。相同功能区域码下不同用法的零部件通过功能位置码进行区分。功能位置代码一般有如下使用规定。«/span»
1）同一功能分组代码下，相同使用位置的零部件，但**技术状态不同**，其**功能位置代码相同**。
2）同一功能分组代码下，**相同技术状态**的零部件，但**使用位置不同**，其功能**位置代码不同**。
（二）<span style='font-weight:bold'>零件名称与零件描述</span>管理比较精细的企业，零件名称与零件描述是分开的。零件名称表达零件自身的特性，与零件使用位置无关；而<span style='color:#FA0000'>零件描述则是表达同一零件在不同功能区域的用法</span>。因此，零件描述一般与零件功能区域码+功能位置码一一对应，一个功能区域码+功能位置码确定了唯一一个零件描述，如图5-4所示。
![image2](9244b394f6b14fad966ddca4abf37b83.png)
图5-4 零件描述与功能区域码、位置码的关系功能位置码和零件描述对于<span style='font-weight:bold;color:#FA0000'>标准件和通用件</span>非常有意义，因为标准件和通用件在同一整车上可能用在不同功能位置，这样就可以通过功能位置码和零件描述来<span style='font-weight:bold;color:#FA0000'>唯一标识同一零件号多次出现在BOM上的含义</span>，对于BOM的使用部门非常有帮助。如<span style='color:#FA0000'>工艺部门可以基于功能位置码和零件描述识别相同零件号的不同BOM行</span>，从而针对不同零件用法定义零件工位；如海外业务部门向海外KD件工厂发送零部件清单时，可以把标准件定义得非常准确，避免由于标准件错件或者漏件导致运输费用以及索赔损失。零件描述有指示零件用法的含义，因此，零件描述方式可以按照一定的方式进行规范，以便于应用。以下是一些规范的例子。
1）关键名词必须在前面且与功能及安装位置描述名词以连字符分开。
2）关键名词之后紧跟着是带功能性描述的词语，共同定义零件的基本用法，这些描述性词通常是缩写形式。
