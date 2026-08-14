---
title: EPM-attach-related-objects
updated: 2026-06-06T10:05:37
created: 2026-07-05T17:04:42
---

将目标对象的指定相关对象附加为工作流程的目标/引用附件。此处理程序搜索所
有目标对象，查找具有指定关系或采用指定引用属性和类型（如果已指定）的次对
象，然后将它们添加为目标/引用附件。如果次对象已经是目标列表的一部分，则
其将被忽略.
-relation，查找的关系，包括 IMAN_manifestation、IMAN_specification、IMAN_reference、 PSBOMViewRevision，常用的为规格和BOMview，如将数据集或下级BOM对象进入流程。
-include_related_type，允许进入流程的对象类型，如ItemRevision、dataset、Document等，多个值用，隔开。
-exclude_related_type，流程中排除的对象类型。如item，与-include_related_type不能组合使用。两者互斥。
-attachment，放到哪个位置，target流程目标中，reference引用参考中
-allowed_status，允许进入流程的对象的发布状态。null，表示无状态，all，表示所有状态，可以设置具体状态的名称。
-disallowed_status，不允许进入流程的对象状态。与-allowed_status互斥。
-lov
值REV RULE=版本规则名称，遍历BOM时的版本规则

CMHasSolutionIte
KY6ECNRevision
KY6ECNPC,KY6ECNSZ,KY6ECNPC,KY6ECNSZ,KY6ECNJSWT

![image1](b60ce46612ac4406bd618094647a89a8.gif)

