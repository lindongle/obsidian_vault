---
title: 首选项及handler
updated: 2026-06-05T23:39:58
created: 2026-07-05T17:04:50
---

1.  IMM_RECENTLY_CREATED_DAYS
设置最近创建的材料文件夹下显示的最近多少天的材料版本；
2.  IMM_SHOW_ONLY_CURRENT_USER
设置最新创建的材料文件夹下是否只显示自己创建的材料版本，默认显示全部（false）
3.  IMM_CREATE_REL_WITH_MATERIAL_ON_NXSAVE
从NX保存后，控制在Teamcenter中创建材料版本和零件版本之间的关系。 有效值为：
\* true：将创建关系。 这是默认值。
\* false：将不会创建关系
4.  MATERIALMGMT_material_creator_groups
5.  MATERIALMGMT_material_creator_roles 设置允许创建材料的组和角色
6.  MATERIALMGMT_check_if_inactive_cas_valid创建物质时，是否判断CAS号的检查，默认true，必须复合CAS编码规则；
7.  IMM_IMPORT_WIZARD_OBJECT_TYPES定义在材料导入界面显示要创建的材料的材料类型。
8.  IMM_IMPORT_WIZARD_SUBSTANCE_TYPES，导入时创建物质的类型；
9.  IMM_NX_PrimaryMaterialRelation定义从NX保存到TC时，零组件版本和材料版本的关系

IMM-set-parameter
向材料中添加参数

