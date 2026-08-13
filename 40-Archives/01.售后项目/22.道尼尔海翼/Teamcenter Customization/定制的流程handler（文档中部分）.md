---
title: 定制的流程handler（文档中部分）
updated: 2026-06-05T22:25
created: 2023-04-23T14:43:55
---

**DS4_WF_CreateBOMReports**
用于启动作业队列来生成DS Part版本，zip文件包含：
1.  使用版本规则 DS4_at_Release 的 BOM 的 PDF 和 XLM EXCEL 文件
2.  其“Represented by”关系下的 DS Design或 DS Drawing的 PDF
**DS4_WF_ToolTDD**
用于启动作业队列来生成DS Tool版本，zip文件包含：
1.  使用版本规则 DS4_at_Release 的 BOM 的 PDF 和 XLM EXCEL 文件
2.  其“Represented by”关系下的 DS Design或 DS Drawing的 PDF
**DS4_SUB_ReleaseParts**
用于在发布 MON （变更通知单）时将所有“Solution Items”关系下的 DS Part版本和 DS Design版本发布。仅在工作流程 DS4_MON_Release 中使用。
**DS4_WF_SetSProperyToSolutions**
用户发布MON时，将MO的ID和MON的版本信息更新到 “Solution items” 关系下的对象版本的属性中；
**DS4_WF_SetStatusPlanned**
对于选定的Item版本对象、BOM及其“Specification”关系下的所有数据集对象设置状态为设置状态为Planned
**DS4_WF_SetStatusChecked**
对于选定的Item版本、BOM及其“Specification” 和 “Rendering”关系下的所有数据集对象设置状态为Checked
**DS4_WF_SetStatusReleased**
对于选定的Item版本、BOM及其“Specification” 和 “Rendering”关系下的所有数据集对象设置状态为Released
**DS4_WF_SetStatusRejected**
对于选定的Item版本、BOM及其“Specification” 和 “Rendering”关系下的所有数据集对象设置状态为Released
DS4_WF_SetStatusChecked_WP
**DS4_WF_CreateBOMReports**
用于启动作业队列来生成DS Part版本，zip文件包含：
1.  使用版本规则 DS4_at_Release 的 BOM 的 PDF 和 XLM EXCEL 文件
2.  其“Represented by”关系下的 DS Design或 DS Drawing的 PDF
**DS4_WF_ToolTDD**
用于启动作业队列来生成DS Tool版本，zip文件包含：
1.  使用版本规则 DS4_at_Release 的 BOM 的 PDF 和 XLM EXCEL 文件
2.  其“Represented by”关系下的 DS Design或 DS Drawing的 PDF
**DS4_SUB_ReleaseParts**
用于在发布 MON （变更通知单）时将所有“Solution Items”关系下的 DS Part版本和 DS Design版本发布。仅在工作流程 DS4_MON_Release 中使用。
**DS4_WF_SetSProperyToSolutions**
用户发布MON时，将MO的ID和MON的版本信息更新到 “Solution items” 关系下的对象版本的属性中；
**DS4_WF_SetStatusPlanned**
对于选定的Item版本对象、BOM及其“Specification”关系下的所有数据集对象设置状态为设置状态为Planned
**DS4_WF_SetStatusChecked**
对于选定的Item版本、BOM及其“Specification” 和 “Rendering”关系下的所有数据集对象设置状态为Checked
**DS4_WF_SetStatusReleased**
对于选定的Item版本、BOM及其“Specification” 和 “Rendering”关系下的所有数据集对象设置状态为Released
**DS4_WF_SetStatusRejected**
对于选定的Item版本、BOM及其“Specification” 和 “Rendering”关系下的所有数据集对象设置状态为Rejected
**DS4_WF_SetStatusChecked_WP**
对于选定的Item版本，其BOM，BOM中消耗的第一级Item版本，如果他们不存在数据集设置状态为Checked。
仅用于DS工作计划版本的发布（用户工作流程：DS4_WorkPlan_Checked）
**DS4_WF_SetStatusObsolete**
在发布MON时，对已选择的附加了“过时零件”的Item版本，设置状态为Checked。
从用户工作流程DS4_MON_Release中使用。
**DS4_WF_SetStatusObsolete_1**
当发布MON时，对于附加为“过时零件”的目标Item版本，设置状态为Obsolete。
从用户的工作流DS4_Part_Obsolete中使用。
**DS4_WF_SetStatusProhibited**
当发布MON时，对已选择的附加为“禁止零件”的Item版本，设置状态为Checked。
从用户的工作流DS4_MON_Release中使用。
**DS4_WF_SAP_Transfer_Planned**
通过T4S，将状态为Planned的对象传输到SAP。
**DS4_WF_SAP_Transfer_Checked**
通过T4S，将状态为Checked的对象传输到SAP。
**DS4_WF_SAP_Transfer_Released**
通过T4S，将状态为Released的对象传输到SAP。
**DS4_WF_SAP_Transfer_Approved**
通过T4S，将状态为Approved的对象传输到SAP。
**DS4_WF_SAP_Transfer_Obsolete**
通过T4S，将状态为Obsolete的对象传输到SAP。
**DS4_WF_SAP_Transfer_Prohibited**
通过T4S，将状态为Prohibited的对象传输到SAP。
**DS4_Create_NXDwg_PDF_TIFF**
启动作业队列来创建已选择的DS设计版本的UGPART的PDF和TIFF。
**DS4_Delete_NXDwg_PDF_TIFF**
删除已选择的DS设计版本的UGPART的PDF和TIFF。
**DS4_Create_PDF_MSExcel**
启动作业队列，基于已选择的Item版本下附加为Specification的XLS\*创建PDF。
**DS4_Create_PDF_MSWord**
启动作业队列，基于已选择的Item版本下附加为Specification的DOC\*创建PDF。
**DS4_Create_PDF_MSPowerpoint**
启动作业队列，基于已选择的Item版本下附加为Specification的PPT\*创建PDF。
**DS4_Create_PDF_and_Stamp**
启动作业队列，基于已选择的Item版本下附加为Specification的DOC\*创建PDF并且基于
检查器属性（ds4_author\*，ds4_checker\*,etc）的值，在其第二页上盖章签字 。
**DS4_Create_PDF_MSAll_and_Stamp**
结合了DS4_Create_PDF_and_Stamp, DS4_Create_PDF_MSExcel and DS4_Create_PDF_MSPowerpoint的功能。
**DS4_StampPDF**
启动作业队列，根据已选择的Item版本检查器属性（ds4_author\*，ds4_checker\*,etc）的值，在其附加为Specification的PDF的第二页上盖章签字 。
**DS4_Reset_Author_Information**
注意：要实际扩展以重置所有检查器属性
**DS4_Delete_Status**
删除已选择的Item版本，它的BOM以及所有链接关系为Specification的数据集的状态。
**DS4_Set_Created**
淘汰了。状态“Created”不在DSG上使用。
**DS4_Set_DS90**
对已选择多的Item版本，其BOM以及所有以“Specification”关系关联的数据设置状态DS90。
**DS4_Set_Planned**
对已选择多的Item版本，其BOM以及所有以“Specification”关系关联的数据集设置状态Planned。
注意：不要直接在工程Item版本上使用它，因为有效行将被删除（因为状态已被替换)。
**DS4_Set_Checked**
对已选择多的Item版本，其BOM以及所有以“Specification”关系关联的数据集设置状态Checked。
注意：不要直接在工程Item版本上使用它，因为有效行将被删除（因为状态已被替换)。
**DS4_Set_ConformityConfirmed**
对已选择多的Item版本，其BOM以及所有以“Specification”关系关联的数据集设置状态ConformityConfirmed。
注意：不要直接在工程Item版本上使用它，因为有效行将被删除（因为状态已被替换)。
**DS4_Set_Released**
对已选择多的Item版本，其BOM以及所有以“Specification”关系关联的数据集设置状态Released。
注意：不要直接在工程Item版本上使用它，因为有效行将被删除（因为状态已被替换)。
**DS4_Set_Approved**
对已选择多的Item版本，其BOM以及所有以“Specification”关系关联的数据集设置状态Approved。
注意：不要直接在工程Item版本上使用它，因为有效行将被删除（因为状态已被替换)。
**DS4_Set_Rejected**
对已选择多的Item版本，其BOM以及所有以“Specification”关系关联的数据集设置状态Rejected。
注意：不要直接在工程Item版本上使用它，因为有效行将被删除（因为状态已被替换)。
**DS4_Set_Prohibited**
对已选择多的Item版本，其BOM以及所有以“Specification”关系关联的数据集设置状态Prohibited。
注意：不要直接在工程Item版本上使用它，因为有效行将被删除（因为状态已被替换)。
**DS4_Set_Endorsed**
对已选择多的Item版本，其BOM以及所有以“Specification”关系关联的数据集设置状态Endorsed。
**DS4_Set_Obsolete**
对已选择多的Item版本，其BOM以及所有以“Specification”关系关联的数据集设置状态Obsolete。
注意：不要直接在工程Item版本上使用它，因为有效行将被删除（因为状态已被替换)。
**DS4_SAP_Transfer_Checked**
通过T4S将具有状态为Checked的单个Item版本传递到SAP。
注意：非必要的子工作流程可以被替代吗？？
**DS4_SAP_Transfer_Released**
通过T4S将具有状态为Released的单个Item版本传递到SAP。
注意：非必要的子工作流程可以被替代吗？？
**DS4_SAP_Transfer_Approved**
通过T4S将具有状态为Approved的单个Item版本传递到SAP。
注意：非必要的子工作流程可以被替代吗？？
