---
title: handler
updated: 2026-06-06T10:09
created: 2019-05-08T18:24:48
---

E:\TC\09.帮助文档\T4S18.2\Teamcenter_Gateway-Generic_Configuration_Guide.pdf（==总结用到的handler==）
**T4S-transfer-ChangeNumber**
-check_EPM_Targets，默认false，如果设置为true，则会从每一步流程节点的目标附件中均读取数据。缺省即可。不需要此参数
<span style='color:red'>-UPDATE_EXISTING，默认true，如果设置为false，则会检查该更改单是否在SAP存在，如果存在则直接终止，不会更新。需要设置为false，一旦设置了false，将不会有任何提示，也不会更新SAP的变更信息。当更新02状态的handler，设置为true。</span>
-use_EPM_objects_as_targets，将流程任务对象当做传输对象，默认是根任务root_task，可以设置current_task，缺省即可。不需要此参数
<span style='color:red'>-collect_all_errors，设置为true将所有目前的错误统一展示，而不是逐个展示</span>
-target_condition_preference，值为首选项的名称，首选项的值为BMIDE设置的条件，只对参数中设置的首选项中对应的条件满足时生效，其他自动跳过。需要再匹配首选项T4S_process_CM_pseudofolder_names4DZ8_DJ_ECNRevision，否则设置发送物料和 BOM的handler不起作用（即没法单独发BOM和物料）。---此参数可以不用设置，通过首选项T4S_ChangeMasterTypeList删除不需要下发的类型即可。
![image1](aef74142bf76446b96e679cb1c2ce2a7.png)

![image2](d034b47035bb46989080596fdb0eefa4.png)

![image3](3c6e846e57d549cdb2985893da19e0d9.png)
**变更附加物料及BOM的下发逻辑：**
选择ECN，将解决方案中的item版本一块带入流程目标附件。使用传输变更的handler，并设置条件参数（只取变更版本对象，且只创建不更新）传到SAP，然后根据设置发变更时解决方案文件夹的内容同时下发的首选项，配合传输物料和传输BOM的handler，将物料和BOM（单层）发下去。然后只将变更版本对象的更改单状态改为02，然后再使用传输变更的handler，并设置条件参数（只取变更版本对象，可以更新）将SAP的更改单状态更新为02.
![image4](2a4886876509461caf6b6473603a16fd.png)

![image5](d4606f16980c4cc6ba39afdaedcca498.png)
T4S-validate-ChangeNumber，检查变更单号在SAP中是否存在。--几个validate不需要，开发handler检查。

![image6](396914eac8c543a79c7170ee6d075213.jpg)

**下发参数：**
-continue_on_error设置为True，表示流程目标中所有数据遍历完成后才报错，即中间数据报错程序不会停止
-collect_all_errors设置为True，将所有报错均展示
如果不设置两个参数，则提交流程时，遇到一个错误即返回报错，后续的数据不会再执行。

**T4x Rule Handler**
<span style='color:#BFBFBF'>• CLM4T-validate-EALogon - Examination of the EA login.</span>
<span style='color:#BFBFBF'>• T4EA-validate-EALogon - Examination of the EA login.</span>
<span style='color:#BFBFBF'>• T4O-validate-BillOfMaterial - Check information for an Oracle EBS bill of materials transfer.</span>
<span style='color:#BFBFBF'>• T4O-validate-ChangeOrder - Validate ChangeOrder.</span>
<span style='color:#BFBFBF'>• T4O-validate-EBSLogon - Examination of the Oracle EBS login.</span>
<span style='color:#BFBFBF'>• T4O-validate-GenericObject - Check information for an Oracle EBS generic object transfer.</span>
<span style='color:#BFBFBF'>• T4O-validate-Item - Check information for an Oracle EBS item transfer.</span>
• T4S-check-T4SFolderExists - Check for T4S folder.
检查管理流程目标附件的T4S文件夹是否存在。
<span style='color:red'>• T4S-validate-BillOfMaterial - Validate information for bill of materials transfer.</span>
检查物料信息的必填
• T4S-validate-BusinessPartner - Validate information for business partner transfer.
• T4S-validate-ChangeNumber - Validate ChangeNumber.
检查更改单号在SAP中是否存在。
• T4S-validate-DocumentInfoRecord - Validate information for document info record transfer.
• T4S-validate-DocumentStructure4BomView - Validate information for document structure transfer.
• T4S-validate-EquiBillOfMaterial - Validate information for equipment bill of materials transfer.
• T4S-validate-EquipmentMaster - Validate information for equipment master transfer.
• T4S-validate-FunctionalLocation - Validate information for functional location master transfer.
• T4S-validate-FunctionalLocationBillOfMaterial - Validate information for functional location bill of materials transfer.
• T4S-validate-GenericObject - Validate information for generic object transfer.
• T4S-validate-MaterialMaster - Validate information for material master transfer.
检查物料信息的必填
• T4S-validate-OrderBillOfMaterial - Validate information for order bill of materials transfer.
• T4S-validate-PIR - Validate information for purchase info record transfer.
• T4S-validate-SAPLogon - Examination of the SAP login.
检查SAP是否登录
• T4S-validate-Schedule - Validate information for schedule transfer.
• T4S-validate-Vendor - Validate information for vendor transfer.
• T4S-validate-WBS-BillOfMaterial - Validate information for work breakdown structure bill of materials transfer.
• T4X-attach-LogfileDataset - Creates a log file for the workflow.
创建日志文件
• T4X-validate-GenericObject4TargetType - Check whether all the necessary information for generic object transfer is defined.
**T4x Action Handler**
<span style='color:#BFBFBF'>• T4EA-SessionProxy - Manage a proxy to forward the EA login data.</span>
<span style='color:#BFBFBF'>• T4EA-transfer-GenericBillOfMaterial4Relation - Generic bill of materials transfer based on a TC relation based structure.</span>
<span style='color:#BFBFBF'>• T4EA-transfer-GenericObject - Generic object transfer.</span>
<span style='color:#BFBFBF'>• T4EA-transfer-GenericObject4BomLine - Generic object transfer for each position of a bill of material.</span>
<span style='color:#BFBFBF'>• T4O-SessionProxy - Manage a proxy to forward the Oracle EBS login data.</span>
<span style='color:#BFBFBF'>• T4O-define-PreferredEBSSystem - Define the preferred Oracle EBS connection.</span>
<span style='color:#BFBFBF'>• T4O-transfer-BillOfMaterial - Bill of materials transfer to Oracle EBS.</span>
<span style='color:#BFBFBF'>• T4O-transfer-CC-BOM - CC Bill of materials transfer.</span>
<span style='color:#BFBFBF'>• T4O-transfer-ChangeOrder - Create an ECO in Oracle EBS.</span>
<span style='color:#BFBFBF'>• T4O-transfer-GenericObject - Generic object transfer.</span>
<span style='color:#BFBFBF'>• T4O-transfer-Item - Create an item in Oracle EBS.</span>
<span style='color:#BFBFBF'>• T4O-transfer-Item4BomLine - Item transfer for each position of a bill of material.</span>
<span style='color:#BFBFBF'>• T4O-transfer-Routing - Routing transfer.</span>
• T4S-SessionProxy - Manages a proxy to forward the SAP login data.
此处理程序管理代理，以便在不同TC用户之间转发SAP登录数据（如果它们涉及一个工作流），即只有第一个用户必须键入他或她的SAP登录数据，并且同一工作流作业中的每个SAP事务都将完成 与相同的SAP用户。 在SAP Logon Task之后添加“-Mode = Save”。 如果另一个TC用户获得工作流程（例如审阅者），则在其任务中添加“-Mode = READ”，以使他能够使用与启动工作流的TC用户相同的SAP用户向SAP发送数据，而无需单独登录。 那时，这个TC用户也会在任何工作流之外自动使用相同的SAP登录，你应该添加“-Mode = FORGET”来避免这种情况。 这也可用于恢复先前的首选连接。即所有数据下发流程都使用统一账号，可以使用-mode=SAVA，如果审批者同样使用该用户，使用-mode=READ。
-mode
SAVE将当前的ESAP登录保存到T4S代理中

READ从T4EA代理读取EA登录

FORGET从T4S代理删除登录数据而不删除T4S代理本身

DELETE删除T4S代理（\*）

处理程序可用于任何任务，最好是在“完成”操作中。

• T4S-add-Form2CC - Add form to CC object.
• T4S-create-Folder - Create folder to manage workflow targets.
此处理程序创建一个文件夹以管理工作流目标。原因是它将所有工作流目标添加到新创建的工作流文件夹中并删除所有完成的工作，因此如果出现错误，当前目标不会从该文件夹中删除，因此可以轻松检查哪个目标有错误：那些仍然在那个文件夹中
![image7](bf590bbc43934905952e525e5ed9d99c.png)
• T4S-define-PreferredSapSystem - Define the preferred SAP connection.
<span style='color:red'>• T4S-transfer-BillOfMaterial - Bill of materials transfer to SAP.</span>
- «span style='color:#212529'»**-use_SAP_client  **
  设置登录的客户端，如211«/span»
- «span style='color:#212529'»**-use_SAP_system  **
  设置用户的系统的实例编号，如10«/span»
- «span style='color:#212529'»**-use_VariantRuleTransfer  **
  是否传递变更规则«/span»
- «span style='color:#212529'»**-bom_rev_rule  **
  设置BOM获取的版本规则«/span»
- **-bomview_prio_list  **
  允许传输的bomview列表，跟首选项T4S_BillOfMaterialTypeList匹配，如果未找到对应的bomview，则会过滤，多个view用逗号隔开。
- **-closure_rule  **
  <span style='background:white'>This parameter specifies the </span><span style='background:yellow;mso-highlight:yellow'>closure</span><span style='background:white'> rule applied to the structure.</span>
- **-hide_GDELines  **
  <span style='background:white'>If set to TRUE, T4x will hide GDE BOM positions.</span>
- «span style='color:#212529'»**-hide_incremental_changes_bomlines  **
  如果设置为true，隐藏增量更改（新增的件）«/span»
- «span style='color:#212529'»**-hide_substitutes  **
  如果设置为true，隐藏替代件«/span»
- «span style='color:#212529'»**-hide_suppressed_bomlines  **
  如果设置为true，隐藏抑制的BOM行。«/span»
- «span style='color:#212529'»**-hide_unconfigured_bomlines  **
  如果设置为true，隐藏未配置的变量«/span»
- «span style='color:#212529'»**-hide_variants_bomlines  **
  如果设置为true，隐藏变量«/span»
- <span style='color:red'>**-no_transfer_of_empty_bom，处理单零件下发报错的问题。**</span>
- <span style='color:#212529'>如果设置为true，则忽略空BOM，否则会创建一个空的BOM。必须跟mapping文件中对应设置一致。</span>
- «span style='color:#212529'»**-scan_max_bom_level  **
  遍历的BOM层级数，默认1层。==仅在配置了多级BOM传输时才生效。设置为0，则传空BOM。可以不用配置，用PS-attachmenthandler将下级一块做为目标附件后应该可以自动处理的。==«/span»
- «span style='color:#212529'»**-skip_bomlines_by_condition  **
  设置条件来过滤不需要的BOM行，如外购件的下级不发等。«/span»
- «span style='color:#212529'»**-skip_bomlines_by_condition_prefix  **
  设置XX开头的条件来过滤不需要的BOM行«/span»
- «span style='color:#212529'»**-skip_unconfigured_bomlines  **
  过滤未配置的BOM行.«/span»
- «span style='color:#212529'»**-unpack_all_bomlines  **
  如果设置为True，则解包BOM行。«/span»
- «span style='color:#212529'»**-unpack_bomlines_by_condition  **
  通过条件来设置哪些BOM行解包下发。«/span»
- «span style='color:#212529'»**-use_attached_rev_rule  **
  设置多级时，不同类型的item使用不同的版本规则，通过首选项对应。«/span»
- <span style='font-weight:bold;background:white'>- - -</span>
- «span style='color:#212529'»**-AddObject4Mapping  **
  This parameter allows T4x reading additional Teamcenter data during the transaction.  
  Syntax: -AddObject4Mapping=\[EPM_attachment_type\]:\[ObjectType\]\[:\[RelationType\]:\[ObjectType\]\]\[:PropertyName\]  
  For \[EPM_attachment_type\] use value EPM_target_attachment, EPM_reference_attachment, EPM_signoff_attachment or EPM_release_status_attachment.  
  Specify e.g. -AddObject4Mapping=EPM_target_attachment:ItemRevision:CMHasSolutionItem:ChangeNoticeRevision  
  to read attribute values of a TC object in the mapping that have not been configured (i.e. set in the corresponding Mapping4 preference).  
  Specify e.g. -AddObject4Mapping=EPM_target_attachment:ChangeNoticeRevision  
  or -AddObject4Mapping=EPM_reference_attachment:ItemRevision:IMAN_reference:T4S Status Info:#\_\_getAllProperties\_\_#:Properties  
  to read attribute values of a TC object e.g. added via action handler EPM_attach_related_objects to workflow task or manually in the "New Process Dialog".  
  In case of several needed objects the syntax is -AddObject4Mapping=usePreference:\[PreferenceName\].  
  The preference \[PreferenceName\] contains the definition for all needed objects,  
  e.g. -AddObject4Mapping=usePreference:T4X_AddObject4MappingPref with  
  T4X_AddObject4MappingPref =  
  EPM_target_attachment:ItemRevision:CMHasSolutionItem:ChangeNoticeRevision  
  EPM_reference_attachment:ItemRevision:IMAN_reference:T4S Status Info:#\_\_getAllProperties\_\_#:Properties  
  In mapping use function ::T4X::TC::MAPPING::RootTaskFieldMapping to read the object attribute value,  
  e.g. set AttrValue \[::T4X::TC::MAPPING::RootTaskFieldMapping "RootTask:EPM_target_attachment:ItemRevision:CMHasImpactedItem:ChangeNoticeRevision" "object_desc"\]  
  or set AttrValue \[::T4X::TC::MAPPING::RootTaskFieldMapping "RootTask:EPM_target_attachment:ChangeNoticeRevision" "object_name"\]  
  or set AttrValue \[::T4X::TC::MAPPING::RootTaskFieldMapping "RootTask:EPM_reference_attachment:ItemRevision:IMAN_reference:T4S Status Info" "T4S_Free1"\]  
  Specify -AddObject4Mapping=root_task:EPMTask to read workflow task attributes in the mapping.  
  In mapping get the task attribute from the TcData buffer, e.g. set GovClassification \[::T4X::TC::MAPPING::RootTaskFieldMapping RootTask:root_task:EPMTask gov_classification\]  
  (Check preferences T4X_Property2IgnoreList4EPMTask and T4X_Property2ProcessList4EPMTask for the attribute and adapt them accordingly).«/span»
- <span style='font-weight:bold;background:white'>- - -</span>
- **-useSpecialMode  **
  <span style='background:white'>If set to REVERSEMAPPINGONLY, the handler skips the transfer after the mapping and calls directly the reverse mapping procedure.</span>
- <span style='font-weight:bold;background:white'>- - -</span>
- «span style='color:#212529'»**-collect_all_errors  **
  如果设置为true，会将所有数据的报错一起提示，否则就会挨着提示错误。«/span»
- «span style='color:#212529'»**-continue_on_error  **
  出现错误后是否继续，true继续。«/span»
- **-on_error_set_task_result  **
  <span style='background:white'>If set to TRUE, the parameter enables the update of the EPM Task result property in the error case.</span>
- **-on_error_use_task_result  **
  <span style='background:white'>This parameter defines the string that is stored to the EPM Task result property if the transfer was not successful. If not specified the value "Unable_to_complete" is used. Prerequisite is that the argument -on_error_set_task_result=true.</span>
- **-on_ok_use_task_result  **
  <span style='background:white'>This parameter defines the string that is stored to the EPM Task result property if the transfer was successful. If not specified the value "Completed" is used. Prerequisite is that the argument -on_error_set_task_result=true.</span>
- «span style='color:#212529'»**-process_target_dataset  **
  将文档同时进入流程目标，通过T4S_DocumentInfoRecordTypeList限制，必须在mapping配置好对应的item类型。«/span»
- «span style='color:#212529'»**-target_condition_preference  **
  根据某个首选项中定义的条件中定义的限制来控制哪些数据进入流程目标«/span»
- **-target_condition_preference_prefix  **
  <span style='background:white'>This prefix is extended by the object_type name to generate the final preference name to retrieve the condition name \[Preference Prefix\]\[TransferObjectTypeName\].</span>

• T4S-transfer-BillOfMaterial4Relation - Bill of materials transfer based on a TC relation based structure.
• T4S-transfer-BusinessPartner - Create or change a business partner in SAP S/4HANA.
• T4S-transfer-CC-BOM - CC Bill of materials transfer.
• T4S-transfer-ChangeNumber - Create a change number in SAP.
-UPDATE_EXISTING：设置为false，可以对于已经有的更改单直接跳过，不进行更新；
• T4S-transfer-DocumentInfoRecord - Create or change a document info record in SAP.
• T4S-transfer-DocumentStructure4BomView - Document structure transfer to SAP.
• T4S-transfer-EquiBillOfMaterial - Equipment bill of materials transfer to SAP.
• T4S-transfer-EquipmentMaster - Create or change an equipment master record in SAP.
• T4S-transfer-FunctionalLocation - Create or change a functional location master record in SAP.
• T4S-transfer-FunctionalLocationBillOfMaterial - Functional location bill of materials transfer to SAP.
• T4S-transfer-GenericObject - Generic object transfer.
• T4S-transfer-MaterialMaster - Create or change a material master record in SAP.
• T4S-transfer-MaterialMaster4BomLine - Create a material master record in SAP for every Bill of materials position.
• T4S-transfer-OrderBillOfMaterial - Order bill of materials transfer to SAP.
• T4S-transfer-PIR - Create or change a purchase info record in SAP.
• T4S-transfer-Routing - Routing transfer.
• T4S-transfer-Schedule - Create or change a schedule in SAP.
• T4S-transfer-VariantCharacteristic - Create a characteristic in SAP.
• T4S-transfer-VariantClass - Create a class of type 300 in SAP.
• T4S-transfer-VariantValueRestriction - Restrict characteristic values for a SAP class.
• T4S-transfer-Vendor - Create or change a vendor in SAP.
• T4S-transfer-WBS-BillOfMaterial - Bill of materials transfer to work breakdown structure bom in SAP.
• T4S-transfer-iPPE-Node4BomLine - Bill of materials transfer to iPPE structure node in SAP.
• T4S-transfer-iPPE-Structure - Bill of materials transfer to iPPE structure node in SAP.
• T4X-attach-RevisionRule - Attaches a dynamically created revision rule to an workflow job.
• T4X-copy-Attributes-to-Task - Copy attributes to task object.
• T4X-create-AIObject4CC - Create an Application Interface Object.
• T4X-create-T4X-BatchJob - This handler creates a job in the T4x BGS environment.
• T4X-manage-Connection4Session - Manage a proxy to store and reset preferred connections during a workflow.
• T4X-transfer-GenericObject4TargetType - Generic object transfer based on the specified arguments.
• T4X-transfer-ProductConfigurator - Transfer product configurator objects to an external system.

