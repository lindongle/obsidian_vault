---
title: CATIA集成首选项
updated: 2026-09-02T16:30:05
created: 2026-07-05T17:04:43
---

CATIA集成首选项
2018年6月25日
9:18
没有的需要新建。
CATIA_credential_sharing_for_racless_connection：需新建，bool型，true。CATIA集成不需要重新登录TC
CATIA_Bom_name：CATIA中创建BOM的view类型，改为view，默认view。
CATIA_computeGeometry_option：false，不自动计算重量，改为默认不选中。
CATIA_checkIn_option：改为true，保存时自动签入。
CATIA_createJT_option：默认选中创建JT文件选项。
![image1](2d5f5b9375dc489ebce52a4834b12a3b.png)
CATPART_item_type：CATPART的零组件类型，总成图
CATPRODUCT_item_type：CATPRODUCT的零组件类型，零件图
CATDRAWING_item_type：CATDRW的零组件类型，二维工程图
TC_register_internal_service_modules：注册外部服务模块，将CATIA上移。
CATIA_pv_dataset_owner：可视化数据集的默认所有者是转换代理账户还是CAD集成账户，改为CAD。
==CATIA_ETS_catiav5tojtdirect_available：改为true，使用调服服务转换。==
==ETS_available：新建，改为true，同上一个一块用。按照完==
![image2](24fd26332d7d479ea1108bd463628e78.png)
CATIA_translation_service_name：转换调度服务器名称，默认即可。
ETS.TRANSLATORS.SIEMENS：可用的转换器列表，增加catiav5tojtdirect
COMMONcatiatojt_ets_ds_types：转换JT的文件类型，增加变形件图，去掉product，即总成图不转JT。- CATProduct + CATPart + CATShape
CATIA_component_dataset_types，增加part图和shape图类型。+ CATPart + CATShape
COMMONcatiatojt_CATShape_ets_nr_types：默认即可，变形件类型
Dataset_defaultChildProperties：数据集默认的关系属性增加catia_alternateShapeRep。增加变形件关系。
CATIA_manage_foreignfiles_on_save：默认即可，保存时是否保存外部文件。
CATIA_saveActiveShapeName：是否默认选择保存激活的形状数模。默认不选中，需要手动选择。
CATIA_cache_managed_on_load：加载CATIA时，自动创建CGR可视化文件，改为true。
CATIA_cache_managed_on_save：保存CATIA时，自动创建CGR可视化文件，改为true。
注：Cgr”格式是三维设计软件Catia的文件保存格式之一。该格式的文件是一种特殊的可视化文件，它只保存了零件的外形信息，不包含任何参数化的数据。这种文件是不能直接编辑，也是不能直接打开的。用于轻量化的浏览，跟JT文件效果差不多。
CATIA_cache_path：CATIA缓存的路径，需要新建首选项。
CATIA_savemanager_map_ir_item_id：默认保存时Itemid的映射属性。改为partNumber
CATIA_savemanager_map_ir_item_revision_id：默认保存时Item版本id的映射属性。改为revision

