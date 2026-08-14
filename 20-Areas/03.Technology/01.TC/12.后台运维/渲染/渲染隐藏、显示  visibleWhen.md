---
title: visibleWhen 属性
created: 2026-08-13T16:06:59
updated: 2026-08-13T16:23:30
---
# visibleWhen 属性

使用 **visibleWhen** 属性指定何时根据条件显示元素。 选中的值可以为 **null** 或字符串，可以将该值与以下值进行比较：

- ##### 选定对象的属性
    
    ```html
    visibleWhen = "**property-name****==xxx**"  
    visibleWhen="**property-name****==xxx**"
    ```
- ##### 相关对象的属性
    
    使用[动态复合属性](https://docs.sw.siemens.com/zh-CN/product/282219420/doc/PL20240523460057788.Configuration/html/xid1389156)。
    
- ##### Teamcenter 首选项
    
    visibleWhen="{pref:**preference-name**} == **xxx**"  
    visibleWhen="{pref:**preference-name**} !== **xxx**"
    
- ##### BMIDE 全局常数
    
    visibleWhen="{const:**global-constant-name**} == **xxx**"  
    visibleWhen="{const:**global-constant-name**} !== **xxx**"
    
    **xxx** 可以是字符串、**{prop:property-name}** 或 null（表示给定常数未定义）。
    
- ##### BMIDE 类型常数
    
    visibleWhen="{const:**type-name**:**type-constant-name**} == **xxx**"  
    visibleWhen="{const:**type-name**:**type-constant-name**} !== **xxx**"
    
    **type-name** 必须是 BMIDE 类型名称，或等于表示当前业务对象类型的静态字符串 **ContextType**。
    
- ##### BMIDE 属性常数
    
    visibleWhen="{const:**type-name**:**property-name**:**property-constant-name**} == **xxx**"  
    visibleWhen="{const:**type-name**:**property-name**:**property-constant-name**} == **xxx**
    
    **type-name** 必须是 BMIDE 类型名称，或等于表示当前业务对象类型的静态字符串 **ContextType**。
    
- ##### 位置或子位置
    
    visibleWhen="ActiveWorkspace:Location == **xxx**"
    
    visibleWhen="ActiveWorkspace:SubLocation == **xxx**"
    
    查找要检查的位置或子位置的 URL 的最后一部分。
    
- ##### XRT 关联
    
    visibleWhen='ActiveWorkspace:xrtContext=={"**context_field**":**xxx**}'
    

可以：

- 将单个字符串与字符串进行比较。
    
- 将单个字符串与字符串列表进行比较。 不支持数组匹配。
    
    例如：如果 myProp=[string1, string2, string3]
    
    - visibleWhen “myProp==string1” 工作，因为 string1 在 myProp 数组中。
        
    - visibleWhen “myProp==string1, string2, string3” _不_起作用。
        
- 将以下非字符串类型作为单个值（非阵列）比较。
    
    整型、短整型、双精度型、浮点型、字符型、逻辑型
    
- 仅检查以下属性类型的值为空或不为空。
    
    - 类型化和未类型化的引用
        
    - 类型化和未类型化的关系
        
    - 外部引用
        
    - date
        
- 使用逻辑 **AND** 运算符可执行多个检查。 不支持使用 **OR**。
    

# 示例：检查属性

属性在选定对象上时：

visibleWhen="awb0ServiceAdapter == 4G"  
  
visibleWhen="awb0UnderlyingObjectType == Aqc0CharElementRevision"  
  
visibleWhen="awb0Parent!=null"  
  
visibleWhen="ps_parents!=null"

属性在相关对象上时：

visibleWhen="REF(att0CurrentValue,Att0MeasureValue).owning_user!=null"  
  
visibleWhen="REF(root_task, EPMJob).root_target_attachments!=null"   
  
visibleWhen="GRMS2PREL(IMAN_based_on,CAW0Defect).primary_object != NULL"

# 示例：检查首选项

visibleWhen="{pref:CM_ReverseTreeAvailable}==true"  
  
visibleWhen="{pref:AWB_ShowMarkup}==true"

# 示例：检查 BMIDE 常数

visibleWhen="{const:ContextType:Att0EnableComplexValue} == true"  
  
visibleWhen="{const:Att0ParameterPrj:ItemRevision} != null”"

# 示例：检查位置或子位置

visibleWhen="ActiveWorkspace:Location!=com.siemens.splm.clientfx.tcui.xrt.showObjectLocation"

visibleWhen="ActiveWorkspace:SubLocation != com.siemens.splm.client.occmgmt:OccurrenceManagementSubLocation"  
  
visibleWhen="ActiveWorkspace:SubLocation == qualityFmeaSublocation"  
  
visibleWhen="ActiveWorkspace:SubLocation != showObject"

# 示例：检查 XRT 关联

visibleWhen='ActiveWorkspace:xrtContext=={"interfaceTable":"visible"}'  
  
visibleWhen='ActiveWorkspace:xrtContext!={"showLimitedPlanInfo":true}'

# 示例：使用 AND

visibleWhen="{pref:Pma0IsReleaseAtLeast141}==true **和** {pref:Pma0IsMaturitySupportedForDesign}==true"  
  
titleKey="tc_xrt_AuditLogs" visibleWhen="{pref:TC_audit_manager_version}==3 **和** {pref:AWC_show_audit_logs}==true"  
  
titleKey="tc_xrt_Overview" visibleWhen="structure_revisions==null **和** ActiveWorkspace:SubLocation != com.siemens.splm.client.occmgmt:OccurrenceManagementSubLocation"  
  
titleKey="tc_xrt_jt_viewer" visibleWhen="structure_revisions==null **和** IMAN_Rendering!=null and ActiveWorkspace:SubLocation != com.siemens.splm.client.occmgmt:OccurrenceManagementSubLocation"  
  
titleKey="tc_xrt_Overview" visibleWhen="structure_revisions==null **和** ActiveWorkspace:SubLocation != com.siemens.splm.client.occmgmt:OccurrenceManagementSubLocation"  
  
visibleWhen="REF(last_release_status,ReleaseStatus).object_name != Approved **和** REF(last_release_status,ReleaseStatus).object_name != Obsolete"