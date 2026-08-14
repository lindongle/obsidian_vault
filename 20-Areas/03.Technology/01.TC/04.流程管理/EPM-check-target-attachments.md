---
title: EPM-check-target-attachments
updated: 2026-06-06T00:09:27
created: 2026-07-05T17:04:42
---

检查指定目标对象是否包含带有所需状态的所需附件。可将目标对象类型、关系类
型、附加的对象类型以及有效状态提供为处理程序参数。
-include_type
定义要检查的目标对象类型。
-include_related_type
定义要检查的附件类型。
-relation
指定目标对象和附件之间的关系：
• 使用 n IMAN_manifestation 指定表现关系。
• 使用 n IMAN_specification 指定规格关系。
• 使用 t IMAN_requirement 指定需求关系。
• 使用 e IMAN_reference 指定引用关系。
• 使用 n PSBOMViewRevision 指定 BOM 视图附件。
• 使用 m CMHasImpactedItem 指定更改对象的受影响零组件。
• 使用 m CMHasSolutionItem 指定更改对象的解决方案零组件。
• 使用 m CMHasProblemItem 指定更改对象的问题零组件。
• 使用 s CMReferences 指定更改对象的引用零组件。
• 使用 s CMImplements 指定实施另一个更改对象的更改对象。
-allowed_status
指定附件的所需状态。通过列出用逗号或 EPM_ARG_target_user_group_list_separator
首选项指定的字符分隔的有效 Teamcenter 状态，可以检查多个状态。
Y ANY 检查任何状态。 E NONE 检查工作中状态。
