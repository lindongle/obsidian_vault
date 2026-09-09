---
title: PS-attach-assembly-components
updated: 2026-06-06T00:09
created: 2018-03-11T12:14:07
---

为零组件版本发起工作流程时，该处理程序通过遍历附加于 BOM 的零组件版本来
派生目标零组件版本的组件
-depth，遍历的定义应遍历到的深度。指定 1 1 1 以遍历一级。指定 l all 以遍历所有级别。如果未指定，则遍历一级
-owned_by_initiator
将由发起者拥有的所有组件零组件版本作为目标添加到工作流程。
-initiator_has_write_prev
将发起者对其拥有写访问权的所有组件零组件版本作为目标添加到工作流程
-exclude_released（所有状态）
排除已发放的组件零组件版本，不将其添加为目标。如果已发放的组件是子装配，则
处理程序不会遍历已发放组件的组件
-traverse_released_component，遍历已发布的版本零组件的下级结构，只能与 d -exclude_released 参数配合使用。如不设置，默认不遍历已发布的下级结构。
-rev_rule，遍历的版本规则名称
-exclude_related_type，不遍历包含的对象类型名称
-include_related_type
-add_excluded_as_ref，将限制进入流程目标的对象，放到流程引用中。
