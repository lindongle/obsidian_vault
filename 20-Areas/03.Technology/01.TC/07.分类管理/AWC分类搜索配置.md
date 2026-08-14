---
title: AWC分类搜索配置
updated: 2026-06-19T15:52:32
created: 2026-07-05T17:04:43
---

1、Tem安装：
Active Workspace→服务器扩展→重用及标准化→分类服务器
Active Workspace→服务器扩展→重用及标准化→新一代分类服务器
Active Workspace→服务器扩展→重用及标准化→库管理服务器
Active Workspace→客户端扩展→重用及标准化→分类客户端
Active Workspace→客户端扩展→重用及标准化→库管理客户端
2、胖客户端维护分类库结构：

3、新建ItemRevision（OOTB），点击右侧分类，选择存储类，输入属性值，保存。
![image1](2aa2997c052c48159efbc165a02889d4.png)
4、添加分类视图
Utility执行：smlutility -create_indexing_views -u = infodba -p = infodba -g = dba -recursive，执行成功，每个存储类下查询视图自动创建：
![image2](45805c2523cc431c9dd96734b0d8fd28.png)
设置首选项ICS_searchindex_view_visible为true
5、设置查询索引
BMIDE中设置业务对象Workspaceobject对象常数wp0SearchClassifSearchEnabled为true
设置业务对象ITem和ItemRevision，业务对象常数Awp0SearchIsClassifyDataIndexed为true，进行热部署。
utility执行：bmide_modeltool.bat -u=infodba -p=infodba -g=dba -tool=all -mode=upgrade -target_dir=％TC_DATA％，执行成功。（步骤最后又执行过一次冷部署）
5.1 BMIDE中添加模板，如下：
![image3](5a107478a6284fd081a1fbf1ce8cecac.png)

![image4](695410ad354741fda92aefff7daff467.png)
5.2 重新加载BMIDE项目
5.3将下面业务对象的常数都改为false。
对象：Cls0ClassBase、Lbr0Library、Lbr0LibraryElement
常数：Awp0SearchIsIndexed、Awp0SearchIsClassifyDataIndexed
6、获取索引状态
utility执行：gettypeconstantvalue -u=infodba-p=infodba-g=dba -typename=WorkspaceObject -constantname=Awp0SearchClassifySearchEnabled。tc_solr_schema.xml文件已被修改。
![image5](f489b58059da40869444439704661482.png)
7、合并Teamcenter和Solr方案
停止solr 和索引编制器服务
和并索引：cmd执行：D:\Siemens\Teamcenter11\solr-6.2.1\>TcSchemaToSolrSchemaTransform.bat "%TC_DATA%\ftsi\solr_schema_files，执行成功（tc_solr_schema.xml修改时间已自动更新）
![image6](0207f015150d4c558d2b197e790816be.png)
启动solr 和索引编制器服务
8、重新编制索引
停止runTcFTSIndexer服务
Cd /d D:\Siemens\Teamcenter11\TcFTSIndexer\bin
清除索引命令：runTcftsIndexer -task=objdata:clear 4 ---输入4，然后输入Y，3次
创建索引命令：runTcftsIndexer -task=objdata:index，均成功。
启动solr 和索引编制器服务
9、TEM中更新Active Workspace 客户端设置
![image7](6a76204f6e4240d7bb69e61c8536a71b.png)
10、登录Weblogic控制台，更新AWC.WAR，激活更改。重启weblogic及四层服务。
11、登录验证，输入查询条件，过滤器中无分类节点。
![image8](1c136646e1184a33bb3f61a74dfc2589.png)

因不生效及安装了库管理模块。
又进行了以下操作：
utility执行：clsutility -u=infodba -p=infodba -g=dba -import -hierarchy -cid=ICM，均成功。
将CLS_auto_sync_node_hierarchy首选项设置为true。
重启四层服务，删除缓存，重新登录客户端仍未生效。

