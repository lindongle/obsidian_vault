---
author: 风岭
source: 微信公众号
url: https://mp.weixin.qq.com/s?__biz=MzY4NTMwNzg2OA==&mid=2247483869&idx=1&sn=e952b449d692d2e4f6cde045cf400edc&chksm=f20011a98bfe85d7e1905f735f929cb7797424b5dc4a1c28957cb7d605562769c9af4d214be5&mpshare=1&scene=1&srcid=0722AlfEd8pygQadoGpZyjTw&sharer_shareinfo=b8bdbbd6de77d84012778f5022ce0c9c&sharer_shareinfo_first=b8bdbbd6de77d84012778f5022ce0c9c#rd
Created: 2026-07-22 07:32:55
tags:
  - BOM
  - awc
id: b12bbced-a085-435b-a95d-ea71714d0432
title: 1.1.MBOM工作空间
created: 2026-07-22T08:46:14
updated: 2026-07-22T08:54:06
---

公众号名称：PLM云迹

作者名称：风岭

发布时间：2026-06-08 09:06

**1.**MBOM管理

Teamcenter Web客户端AWC（Active Workspace Client）的EasyPlan模块包含了制造BOM（Bill Of Material）管理、BOP（Bill Of Process）管理等内容，其中制造BOM管理是一种基于任务的解决方案，用于定义和管理制造BOM(MBOM)，并协调来自工程BOM(EBOM)中的更改。制造BOM管理可以方便地实现更改及确认。

制造BOM管理可以提供：

1）MBOM的创建、编辑、分配  

2）EBOM和MBOM之间责信度检查

3）EBOM和MBOM的3D可视化

4）MBOM的审签

5）MBOM变更等

# 1.1.MBOM工作空间

登录AWC，查看工作空间，MBOM默认工作空间如图：

![[99-Assets/51609f1db7a9f8c8a8b3a856692bd89b_MD5.png]]

如果主页为空白或者工作空间不是MBOM时，可以切换工作空间

# 1.2.创建工作包

选择主页的新建工作包或者在文件夹中选择右侧的添加按钮，搜搜工作包

![[99-Assets/8f34ad9d2eb6aff45f1fa0e173c2df60_MD5.png]]

选择**MECollaborationContext**，点击【确定】

![[99-Assets/9b146078f732cf3ef73545a1045c9fd9_MD5.png]]

在弹出的新建工作包窗口中，输入工作包的名称，点击【创建】

![[99-Assets/13a54c779534d624c897eb5b556857a5_MD5.png]]

工作包创建后，自动打开工作包

![[99-Assets/cc9798bfd1495471dbde83b8f50af96d_MD5.png]]

# 1.3.添加EBOM、MBOM

自动打开工作包窗口，点击EBOM部分的添加按钮

![[99-Assets/e5f925990d361da9f4104d48af6f7569_MD5.png]]

在弹出的添加EBOM窗口中，输入EBOM的ID或名称模糊搜索，选中搜索结果中的EBOM顶层对象，点击【添加产品】

![[99-Assets/d9bcd940e9f30ea41db4be24cac54859_MD5.png]]

EBOM添加完成后，在MBOM中点击【添加】按钮，可以选择已存在的MBOM对象或者新建MBOM对象。

![[99-Assets/cd68fedbe1829845f97446b3e84979d8_MD5.png]]

点击【新建MBOM】时，弹出新建MBOM窗口，输入ID、版本、名称，点击【创建】按钮

![[99-Assets/2eece036292142ea6b03dd19236cf214_MD5.png]]

MBOM创建后，点击窗口右上角的【打开MBOM分配页面】

![[99-Assets/0eecde5f6c311e047e4ca937820d33c2_MD5.png]]

# 1.4.MBOM转换  

## 1.4.1.查看MBOM

打开MBOM分配窗口后，左侧为EBOM窗口，右侧为MBOM窗口

![[99-Assets/4ed96b07e28dd014a34fcd0b569ad747_MD5.png]]

在MBOM窗口中可以新建制造元素，可以从EBOM中选择对象指派到MBOM中制造元素下。

![[99-Assets/a45026cdc4e0b5527a5d81db5ecd190c_MD5.png]]

## 1.4.2.新建制造元素

在MBOM中创建制造元素，在MBOM中选择对象，点击【新建制造元素】按钮，可以选择：

Ø创建基于：基于已有的EBOM或MBOM对象创建新的对象，新对象创建后与源对象在同一层级。

Ø创建制造元素：在选中的对象下，创建生成制造元素对象。

系统会自动根据权限判断是否可以在选中对象下创建制造元素，控制显示创建制造元素菜单。

![[99-Assets/b0b8748ce4d2cc161477098a87f6826b_MD5.png]]

选择创建制造元素，弹出创建制造元素窗口，输入制造元素的ID、版本、名称，点击【添加】按钮。

![[99-Assets/21dc3f48af890b7063beaec3fa4af8e1_MD5.png]]

选择创建基于，弹出创建界面，自动带入选择对象的属性，新的ID，确认对象创建的信息，点击【创建】

![[99-Assets/67c53c1412334edf0f5dbcdc81eba1e6_MD5.png]]

对象创建后，在MBOM窗口中可以查看并编辑对象信息

![[99-Assets/20629062b807006f366e393046e1a5b9_MD5.png]]

## 1.4.3.指派EBOM对象

在EBOM中选择指派的零组件对象，在MBOM中选择要分派的位置，点击【指派】按钮，自动将EBOM中的零组件指派至MBOM中对应位置。

![[99-Assets/916996f48cd79a2325aa5623fac8815c_MD5.png]]

## 1.4.4.查看MBOM分配情况

通过EBOM中对象前的图标，可以直观的查看到零组件分配情况，装配的子件是否已经全部指派，零件是否已指派

![[99-Assets/00b2c3ae4b0ed4458dc9bef9f330b0b2_MD5.png]]

如果指派多次，显示红色图标，可以从EBOM中查案到对象指派到MBOM的位置。

![[99-Assets/624b07763a7e77f8c9337ed6a97c2aac_MD5.png]]

EBOM转换为MBOM时，对于转换过程中EBOM到MBOM的分配情况，通过零组件的不同表示图标显示。

![[99-Assets/20eb2ed7ab6d27e9a77b6abf77e3009c_MD5.png]]

![[99-Assets/1239550c4d8bc60c2f7295f7accc1617_MD5.png]]

# 1.5.编辑MBOM属性

点击【编辑】按钮，MBOM中可编辑的属性处于编辑状态，可以编辑修改MBOM属性。如数量、名称等

![[99-Assets/15d47a14ee0e57a9c1c06f7c9317d5e6_MD5.png]]

MBOM属性编辑完成后，点击【保存编辑】按钮，保存MBOM属性

![[99-Assets/0327cd14f5d9950563f982049a52a2b6_MD5.png]]

# 1.6.查看MBOM 3D可视化数据

打开MBOM的汇总视图，切换至可视化中查看3D可视化

![[99-Assets/46b915990bd361b138a719c86e56c2af_MD5.png]]

# 1.7.MBOM审签

选择MBOM对象，点击菜单管理—【提交至工作流程】

![[99-Assets/bc326d16818e3927ef12f955956c6a3e_MD5.png]]

选择工作流模板，选择审核人员，提交审签

![[99-Assets/2427871db9a68c385bd6802e57253c2f_MD5.png]]

---

内容效果不满意？[点此反馈](https://feedback.notebooksyncer.com/feedback/a24f5b04_1784676773307?u=https%3A%2F%2Fmp.weixin.qq.com%2Fs%3F__biz%3DMzY4NTMwNzg2OA%3D%3D%26mid%3D2247483869%26idx%3D1%26sn%3De952b449d692d2e4f6cde045cf400edc%26chksm%3Df20011a98bfe85d7e1905f735f929cb7797424b5dc4a1c28957cb7d605562769c9af4d214be5%26mpshare%3D1%26scene%3D1%26srcid%3D0722AlfEd8pygQadoGpZyjTw%26sharer_shareinfo%3Db8bdbbd6de77d84012778f5022ce0c9c%26sharer_shareinfo_first%3Db8bdbbd6de77d84012778f5022ce0c9c%23rd&s=obsidian)