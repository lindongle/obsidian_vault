---
title: 如何配置选中Item Revision时在查看器不显示JT
updated: 2026-06-06T10:08
created: 2020-11-02T22:50:28
tags:
  - TC
---

## <span style='color:#2E75B5'>如何配置选中Item Revision时在查看器不显示JT </span>
收录于话题
![image1](7bb72e33b3e642868351849ad15ea6d8.gif)
<span style='font-weight: bold;background:#59C3F9'>作者：吴庭韦 审校：李洋</span>
**测试版本：Teamcenter 11**

有的时候，选择零组件版本时，如果零组件版本下面带有JT数据集，在查看器中自动显示JT视图。但是加载JT时有时候有点卡，影响工作效率。

![image2](7e5b837f679c48f59fd3d405838d6b57.png)
**图1**
我们可以通过首选项配置不显示，步骤如下：
![image3](a28717f572724892be23a2e11832df83.png)
首先打开我们的“首选项”并且找到首选项“defaultViewerConfig.VIEWERCONFIG”。然后删除“IMAN_Rendering”关系。
![image4](0706b679d48d44ffaa1eb507a85f3b51.png)
**图2**
![image3](a28717f572724892be23a2e11832df83.png)
首选项配置好后，点击零组件版本在查看器中是看不到JT，如图3
![image5](87bcd575ff564117b5a2823d075782b9.png)
**图3**
![image3](a28717f572724892be23a2e11832df83.png)
如果您想看到JT，点击JT数据集即可看到JT模型，如图4
![image6](430d1e5fe48b4c3c849d983069be6b1e.png)
**图4**
**关注我们**  

![image7](b245eaffc4914c2185549f80fff71235.png)
![image8](64f6e01f7e7e455c8104bda8d263476a.jpg)
预览时标签不可点
收录于话题 \#
个
上一篇 下一篇
阅读
分享 收藏
赞 在看
已同步到看一看[写下你的想法](javascript:;)
前往“发现”-“看一看”浏览“朋友在看”
![image9](d67b007d80154f5f89bffcf6f3f319db.png)
前往看一看
**看一看入口已关闭**
在“设置”-“通用”-“发现页管理”打开“看一看”入口
[我知道了](javascript:;)
已发送
取消
#### *<span style='color:#5B9BD5'>发送到看一看 </span>*
发送
如何配置选中Item Revision时在查看器不显示JT
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

[\<From: https://mp.weixin.qq.com/s/hQ3sF9rkFeL1WAZI3-sjHQ\>](https://mp.weixin.qq.com/s/hQ3sF9rkFeL1WAZI3-sjHQ)
