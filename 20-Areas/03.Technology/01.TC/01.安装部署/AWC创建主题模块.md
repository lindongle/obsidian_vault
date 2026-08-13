---
title: AWC创建主题模块
updated: 2026-06-06T10:09
created: 2018-09-28T15:38:40
tags:
  - TC安装部署
---

1.  **配置MBSE入口块**
Infodba用户新建文件夹名字Tile
搜索Awp0TileCollection，把搜索结果Site-TileCollection和dba-TileCollection放进去，其他删除
新建文件夹类型Folder，名字：PATAC MBSE Data Library
![image1](457ae7c29fe54e049d500015c67a66a1.png)
记录该文件夹的UID：xMTpmNuK4H4nEB
![image2](7c516d7e94f440259d71dd68abd9f3b7.png)
创建图块模板
文件-新建-其他-Tile Template
![image3](35d1934fe48f4c58846124ef3833cb96.png)
| 主题索引：2 |
|----|
| 名称：MBSETemplate（自定义） |
| 图标：folder |
| 操作：（目标对象指定连接，方法：打开该对象，取URL地址后面部分）com.siemens.splm.clientfx.tcui.xrt.showObject?uid=xMTpmNuK4H4nEB |
| 操作类型：0 |
| 模板ID：Awp0MBSETemplate |
下图是打开某一文件夹
![image4](a7eb929e72cb40af8cdc87ba7af27f56.png)
下图是打开某一模块
![image5](447b262eba874103bbdd95057ef3c653.png)
复制创建的对象
创建图块
文件-新建-其他-Tile
![image6](8e2501f3c2e943099b15e8dfad3e564a.png)
| 名称：MBSETile(自定义)                                |
|-------------------------------------------------------|
| 图块ID：Awp0MBSETile（自定义：唯一性）                |
| 图块模板：复制出来                                    |
| 显示名称：PATAC MBSE Data Library（网页上显示的名称） |

![image7](ace125716d6f48e4868059e1e838e619.png)
复制创建的TUKUAI对象
系统内搜索常规搜索-类型选择TileCollection。
选择Site-TileCollection对象，菜单栏-选择性黏贴
| 选择性粘贴：  |
|---------------|
| 受保护的：是  |
| 尺寸：0       |
| 图块组：主要  |
| 活动的：是    |
| 订单编号：990 |

![image8](24903b902bea469bb149f7debce55752.png)

![image9](f862cba928214f318f8e7d3ddca5a3fa.png)
