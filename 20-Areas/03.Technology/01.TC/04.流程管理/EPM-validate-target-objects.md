---
title: EPM-validate-target-objects
updated: 2026-06-06T10:05:37
created: 2026-07-05T17:04:42
---

![image1](d47dde2ff03a447e89cbdabc9015ba17.gif)
可以限制发起流程的对象（只针对选中节点）
描述
限制可添加为目标对象的对象类型。它始终阻止将 Home、Newstuff 和邮箱文件夹
添加为目标对象。
注释
使用 TC_HANDLERS_DEBUG 环境变量为此处理程序启用调试功能。
语法
EPM-validate-target-objects
\[-include_type =type-of-workspace-object\[, type-of-workspace-object2,..\]\]
\[-exclude_type =type-of-workspace-object\[, type-of-workspace-object2,..\]\]
\[-latest_rev\]
参数
-include_type
定义可作为目标对象添加到工作流程的对象类型。您可定义多个类型，方法是用
逗号或 EPM_ARG_target_user_group_list_separator 首选项指定的字符分隔各
个类型。此参数为可选参数。
接受有效的 Teamcenter 对象类型，如 ItemRevision、UGMASTER 和 UGPART。
在将任何对象类型或类作为目标添加时，也将包括其所有子类型。要显式排除任何子
类型，请使用 -exclude_type 参数。
例如，如果将此参数指定为 ItemRevision，则允许使用任意类型的零组件版本（例
如，DocumentRevison 等以及任意定制零组件版本类型）。
不接受使用括号式() 类表示法来区分类和类型。
-exclude_type
定义无法作为目标对象添加到工作流程的对象类型。您可定义多个类型，方法是用逗
号或 EPM_ARG_target_user_group_list_separator 首选项指定的字符分隔各个类型。
接受有效的 Teamcenter 对象类型，如 ItemRevision、UGMASTER 和 UGPART。
如果该参数指定为 ItemRevision，则不允许使用任意类型的零组件版本（例如，
DocumentRevison 等类型以及任意定制零组件版本类型）。
-latest_rev
确保添加到工作流程的所有版本都是其所有权零组件中的最新版本。此参数为可
选参数。
放置
放置在任意任务的任意操作上。
限制
无。
示例
• 该示例仅允许使用零组件版本作为目标：
参数值
-include_type ItemRevision
B-362 工作流设计器 PLM00037 11.2
附录B: Related topics
Related topics
• 此示例允许将 MEOPRevision 对象作为目标，但不允许使用 MENCMachining
Revision 和 METurningRevision 对象：
参数值
-include_type MEOPRevision
-exclude_type MENCMachining Revision、METurningRevision
注释
MEOPRevision 是 MENCMachining Revision 和 METurningRevision 的父类
型（类）。在此示例中，所有 MEOPRevision 子类型都可作为目标，但
MENCMachining Revision 和 METurningRevision 除外。
• 该示例仅允许使用最新的零组件版本作为目标：
参数值
-include_type ItemRevision
-latest_rev
-exclude_type Item,Document,ChangeNotice

