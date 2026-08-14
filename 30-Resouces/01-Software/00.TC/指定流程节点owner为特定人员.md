---
title: 指定流程节点owner为特定人员
updated: 2026-06-13T22:08:30
created: 2026-07-05T17:04:52
tags:
  - TC
---

## <span style='color:#2E75B5'>指定流程节点owner为特定人员 </span>
收录于话题
![image1](43f88398728e474a9a21896d73dea2ce.gif)
<span style='font-weight: bold;background:#59C3F9'>作者：王明皓 审校：柳汉杰</span>
**适用版本：TC11**
![image2](e37c735a32144aa7aa17b14ea1c9059a.png)
<span style='background:#FEFEFE'>Teamcenter中若发起流程，流程节点的owner，默认会是发起人。某些派生的流程，不会在流程发起界面中选择流程节点owner，有些需求为派生后的流程节点，需要将该流程节点owner修改为流程目标中的某个对象属性。</span>
**具体操作步骤**  
**  
  **

![image3](5cac2108aa6a47ea8c65814b0b69cae9.png)
进入工作流程设计器模块，进入对应的流程（如图1）。
![image4](b6bcd6a30a3346aa8f2752dcb0f51025.png)
**图1**
![image3](5cac2108aa6a47ea8c65814b0b69cae9.png)
选中需要修改的节点，上传数据集节点。打开处理程序（如图2）。
![image5](29c664981ac74a15a232bb1302354b77.png)
**图2**
![image3](5cac2108aa6a47ea8c65814b0b69cae9.png)
选择“开始”任务操作，处理程序类型为操作处理程序，输入handler：EPM-auto-assign，并输入参数-from_include_type与值M8_FilingForm;输入参数-assignee与值user:PROP::owning_user（如图3），点击创建。该参数与值的效果为找到流程目标下M8_FilingForm类型对象，将该对象的owning_user值作为该节点的owner。
![image6](6598ff2a2357451896515f15570e75aa.png)
**图3**
![image3](5cac2108aa6a47ea8c65814b0b69cae9.png)
使用其他账号对M8_FilingForm对象发起该流程，到请上传数据集节点可以看到，该节点的owner为M8_FilingForm对象的owning_user（如图4）。
![image7](81bc49bba1aa49d88c02912775516dc8.png)
![image8](2b05eeec541b4517bd352d52d8463159.png)
**图4**
**关注我们**  

![image9](66cdbd9e596a4bebb6910a4d0bb07a81.png)
![image10](b53e6360d8fa421da79d07fc357ae40e.jpg)
预览时标签不可点
收录于话题 \#
个
上一篇 下一篇
阅读
分享 收藏
赞 在看
已同步到看一看[写下你的想法](javascript:;)
前往“发现”-“看一看”浏览“朋友在看”
![image11](f2a5f691a79c4f2ba9a06519c897ea07.png)
前往看一看
**看一看入口已关闭**
在“设置”-“通用”-“发现页管理”打开“看一看”入口
[我知道了](javascript:;)
已发送
取消
#### *<span style='color:#5B9BD5'>发送到看一看 </span>*
发送
指定流程节点owner为特定人员
最多200字，当前共字
发送中
喜欢此内容的人还喜欢

微信扫一扫  
关注该公众号

微信扫一扫  
使用小程序
[取消](javascript:void(0);) [允许](javascript:void(0);)
[取消](javascript:void(0);) [允许](javascript:void(0);)
**微信版本过低**
当前微信版本不支持该功能，请升级至最新版本。
[我知道了](javascript:void(0);) [前往更新](javascript:void(0);)
确定删除回复吗？
[取消](javascript:;) [删除](javascript:;)
[知道了](javascript:;)
**长按识别前往小程序**

[\<From: https://mp.weixin.qq.com/s/vGeAzv6exbYKH1crEpe6AQ\>](https://mp.weixin.qq.com/s/vGeAzv6exbYKH1crEpe6AQ)
