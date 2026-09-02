---
title: BOM数量显示真实数量
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:04:52
tags:
  - TC
---

BOM数量显示真实数量
2019年7月10日
0:36

## Teamcenter 技术技巧 
***1. 无法注册bat 文件为数据集***
问题：
无法注册bat 文件为数据集，Batch 文件可以成功创建数据集，但是没有Imanfile （没有命名的引用）。
方法：
需要重写需要增加batch 文件的数据集的业务对象常量
"Fnd0DatasetFileExtensionRestrict"，在BMIDE 中将“bat”从属性字符串中移除
![image1](0e75c39969934c7fba2e4d56d8ff21f5.jpg)
***2. 如何移除被抑制BOM行的图标***
问题：
如何移除被抑制BOM 行的图标？
方法：
当你抑制某个BOM 行：编辑→切换抑制
你将会看到下面的图标：
![image2](27d5881cb9d94b288b1e4ffab492dcf1.jpg)
你需要右击这个BOM 行“受抑制”列，并点击“移除关联替代”
![image3](e43a4618f005460c8f8f20a11ac8682f.jpg)
***3. 如何配置BOM行数量属性显示数字1 而不是空值***
问题：
在结构管理器中，如果数量值为1，那么数量列会显示为空白。目前系统设计如此。用户期望当单位设置为每个后，数量显示为数字1。否则从结构管理器导出到Excel 后，空值不能表示任何意义。如何能够找到一个可靠的方法来保证导出TC 后，数量显示为数字1而不是空白。
方案：
系统中存在另一个属性“bl_real_quantity”，这是它的内部名，它的显示名为“RealQuantity”用户需要在BMIDE 中的BOMLine 对象上设置该属性可见。
如下图配置：
![image4](82c6b5fb33364a679d5746983fd40c74.jpg)
部署BMIDE 的更改到Teamcenter 数据库。
登录富客户端，在结构管理器中查看该列。
![image5](4be2483547374fbca8aaff75ddf9073d.jpg)

阅读
分享 在看
**已同步到看一看**
[取消](javascript:;) [发送](javascript:;)
[我知道了](javascript:;)
#### *朋友会在“发现-看一看”看到你“在看”的内容 *
确定
![image6](53e5079dbd814e0999bff95ea32caf6c.png)
已同步到看一看[写下你的想法](javascript:;)
最多200字，当前共字 发送
已发送
#### *朋友将在看一看看到 *
确定
写下你的想法...
取消
#### *发布到看一看 *
确定
最多200字，当前共字
发送中

微信扫一扫  
关注该公众号

微信扫一扫  
使用小程序
[取消](javascript:void(0);) [允许](javascript:void(0);)
即将打开一个新页面
[取消](javascript:void(0);) [允许](javascript:void(0);)
[\<From: http://mp.weixin.qq.com/s?\_\_biz=MzAwMjUyOTUwMw==&mid=2649882395&idx=1&sn=d94698a8b5d01f892efe7b67c12feba6&chksm=82cc5eabb5bbd7bd5de42659735d83865a487ea52af267075b2c443cf018e83eb937a49226ce&mpshare=1&scene=1&srcid=#rd\>](http://mp.weixin.qq.com/s?__biz=MzAwMjUyOTUwMw==&mid=2649882395&idx=1&sn=d94698a8b5d01f892efe7b67c12feba6&chksm=82cc5eabb5bbd7bd5de42659735d83865a487ea52af267075b2c443cf018e83eb937a49226ce&mpshare=1&scene=1&srcid=#rd)
