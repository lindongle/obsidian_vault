---
title: EDA首选项
updated: 2026-09-02T16:30:05
created: 2026-07-05T17:04:44
---

---
**2.0.6首选项更新**
preferences_manager -u=infodba -p=infodba -g
=dba -mode=import -scope=SITE -action=SKIP -file="C:\TcEDA2.0.6_win64\server_upd
ates\edaserver\install\eda_preferences.xml"

preferences_manager -u=infodba -p=infodba -g =dba -mode=import -scope=SITE -action=SKIP -file="C:\TcEDA2.0.6_win64\server_upd
ates\edaserver\install\eda_preference_desc_updates.xml"

**注：EDA元器件OOTB类型及自定义子类型不能自定义永久属性，需要定义到Itemrevision上继承过来**

**拓普默认首选项:**
![image1](2b51b750ff524aef8fd835ae326d7e1c.png)

---
EDA_CombinedViewableOptionDefault 保存可查看的
默认from pcb

EDA_AddSchematicItemToCCABOM
控制创建或复制原理图设计时是否将原理图设计零组件添加至关联PCA 的BVR

EDA_BOMTemplate_pcb
定义要用作Cadence PCB BOM 模板的文件。将该值指定为包含PCB BOM 模板文件完整路径
的字符串。如果未指定，将使用安装时部署的默认 tcEDAPcbTemplate.bom 文件。

EDA_BOMTemplate_sch
定义要用作Cadence 原理图BOM 模板的文件。将该值指定为包含原理图BOM 模板文件完整
路径的字符串。如果未指定，将使用安装时部署的默认 tcEDASchTemplate.bom 文件。

EDA_CCAItemTypesAllowed
定义可用于PCA 零组件的零组件类型。

EDA_CCAItemTypeDefault
指定用于创建PCA 零组件的默认零组件类型。

EDA_CCABaseItemTypeDefault
指定用于创建PCABase 零组件的默认零组件类型。

EDA_CCABaseItemTypesAllowed
定义可用于PCABase 零组件的零组件类型。

EDA_CheckComponentExistence
定义保存设计前是否要检查Teamcenter 中的组件。

• EDA_CheckinOptionDefault
定义默认的签入选项值。如果设置为 true，此首选项会在另存为和保存对话框中预先
选中签入复选框。

• EDA_CombinedBOMOptionDefault
指定当在ECAD 组合设计工具中选择签入、保存或另存为命令时是否创建BOM。

• EDA_ComponentItemTypes
为受EDA 支持作为组件的整套Teamcenter 基础类型提供支持。

• EDA_CombinedViewableOptionDefault
指定组合ECAD 设计工具中签入、保存和另存为可查看选项的默认状态。

EDA_PreferredLocalTS
改为true，变为dispatcher转换。

指定是否必须在本地运行转换。

EDA_PWBItemTypeDefault
指定用于创建PWB 零组件的默认零组件类型。
• EDA_PWBItemTypesAllowed
定义可用于PWB 零组件的零组件类型。
• EDA_SaveAsFolderDefault
定义保存新的PCA、原理图设计或PCB 设计时使用的默认Teamcenter 文件夹。
• EDA_SaveIntermediateDS
指定是否要保存 ECAD 转换用于生成 XFATF 或 XSCH 不确定性可查看文件的原理图或
PCB 中间数据集。
• EDA_SchematicBOMOptionDefault
指定在ECAD 原理图设计工具中选择签入、保存或另存为命令时是否创建BOM。

EDA_SkipCheckoutDialog
确定选择 Teamcenter→签出菜单命令时是否显示签出对话框。

EDA_ViewType
指定EDA 用于读写产品结构信息的BOM 视图类型。
• EDA_Workflows
指定工作流程模板的名称，供用户选择以在EDA 客户端中启动流程。
