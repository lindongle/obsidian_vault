---
title: Teamcenter-解决具有唯一属性值对象的签出问题
updated: 2026-06-06T10:08
created: 2019-12-16T22:04:36
tags:
  - TC
---

## <span style='color:#2E75B5'>Teamcenter-解决具有唯一属性值对象的签出问题 </span>
![image1](12af95024f404780b34a34bf93c5e16a.gif)
**编者荐语：**
![image2](56bb1ae63291458fba620f0542ac9e7b.gif)
Teamcenter提供的BMIDE环境，用于配置特定于用户的业务模型，以便用于表示部件、文档、图纸等对象。在定制这些业务模型对象时，通常会赋予一定的属性，并指定属性值的特性，例如是否允许空、是否唯一等等。但是，一些属性值特性的设置，需要和首选项配合使用，否则会出现报警提示。  
演示版本：Teamcenter11  
Performance<span style='font-family:-apple-system-font;font-size:15.0pt;color:black'>演示步骤</span>«span style='font-family:微软雅黑;font-size:12.0pt;color:white;background:#9CBDE6'»1«/span»«span style='font-weight:bold;font-family:微软雅黑;font-size:13.5pt;color:#9CBDE6'»重现问题«/span»«span style='font-family:宋体;font-size:12.0pt'»  现在来重现一个属性值唯一性带来的业务对象在签出时的报警问题。1)首先在业务对象K3_unique的版本对象上创建一个名为k3_customername的属性，勾选“unique”特性，如下图示，这意味着该属性值不可重复。«/span»
![image3](c0d9270951eb448e90b6a56ba101188b.png)

2)将业务对象部署到系统，此时在新建K3_unique的对话框中，可看到刚才配置的k3_customername属性旁显示一个红色“\*”标记，假设输入“Siemens”，点击确定，这时，该对象是可以正常创建的。
![image4](e118ee420b4e4ce39bc1b9639a0c8765.png)

3)但是，如果对该对象进行签出操作，将弹出图示的报警，那么这个问题该如何解决呢？  

![image5](b76e857f147e45e18a0922ce4a14eae6.jpg)

«span style='font-family:微软雅黑;font-size:12.0pt;color:white;background:#9CBDE6'»2«/span»<span style='font-weight:bold;font-family:-apple-system-font;font-size:13.5pt; color:#9CBDE6'>解决办法</span>«span style='font-family:宋体;font-size:12.0pt'»打开首选项编辑对话框，搜索找到TCCheckoutReserveOnly属性，将新增业务对象的版本添加到值列表中，如图示。通过这个设置，即可解决属性值唯一带来的报错提示。«/span»
![image6](83984fc31b8e40928d177d6a52f59316.jpg)

«span style='font-family:微软雅黑;font-size:12.0pt;color:white;background:#9CBDE6'»3«/span»<span style='font-weight:bold;font-family:-apple-system-font;font-size:13.5pt; color:#9CBDE6'>测试验证</span>
1)先选择unique类型的业务对象，再选择【Check Out】，如图示。
![image7](2a9bf8e3727040b6b9de46a894912114.png)

2)此时可正常签出对象，注意【checked_out】状态已切换为Y，如图示，表明可对该对象进行修改编辑的操作。
![image8](4f014cf9aec74f39b0acc40d1e6cfe73.png)

<span style='color:#3F3F3F'> 本期刊内容仅用于演示操作，不同版本的操作有可能有所偏差。以上就是本期的全部内容，想了解其他更详细的应用操作可以给我们留言，期待与您进一步交流。若你喜欢本文，请分享到朋友圈让更多的人看到哦。</span>

<span style='font-weight:bold;background:white'>转载请注意注明文章来源</span>
<span style='color:#1E9BE8'>-</span><span style='color:#9CBDE6'>END</span><span style='color:#1E9BE8'>-</span>
<span style='color:#4C4C4C;text-align:center'>  ▼关注我们，发现更多精彩▼</span>

<span style='background:#9CBDE6'>关于今宏科技</span>
<span style='color:#3F3F3F'>**广州今宏信息科技有限公司**为致力提升企业竞争力的制造型企业及经理人打造一个综合的技术服务平台。帮助企业建立强大的产品研发体系，促进制造企业技术转型，提高运营效率、降低复杂度，从而帮助制造企业加快产品上市时间。</span>
![image9](a30655b73c464750b733cd4b7b5bb186.gif)

阅读
在看
已同步到看一看[写下你的想法](javascript:;)
前往“发现”-“看一看”浏览“朋友在看”
![image10](4007189d259b426ab3d08e17a70381ef.png)
前往看一看
**看一看入口已关闭**
在“设置”-“通用”-“发现页管理”打开“看一看”入口
[我知道了](javascript:;)
已发送
取消
#### *<span style='color:#5B9BD5'>发布到看一看 </span>*
发送
最多200字，当前共字
发送中
[留言](javascript:;)
相关阅读
[更多文章](javascript:;)

微信扫一扫  
关注该公众号

微信扫一扫  
使用小程序
[取消](javascript:void(0);) [允许](javascript:void(0);)
[取消](javascript:void(0);) [允许](javascript:void(0);)
[知道了](javascript:;)
[确定](javascript:void(0);)
[\<From: http://mp.weixin.qq.com/s?\_\_biz=MzU3NzkxODA1OA==&mid=2247485301&idx=3&sn=865ef68fd88ae96644360546b4185406&chksm=fd7c0270ca0b8b667240cb0192cc96ac77a3e3231ce41d4f1123957d2c98088067f8a107654f&mpshare=1&scene=1&srcid=1216dJfuEGYGvWPkkI8dgYAs&sharer_sharetime=1576505072992&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd\>](http://mp.weixin.qq.com/s?__biz=MzU3NzkxODA1OA==&mid=2247485301&idx=3&sn=865ef68fd88ae96644360546b4185406&chksm=fd7c0270ca0b8b667240cb0192cc96ac77a3e3231ce41d4f1123957d2c98088067f8a107654f&mpshare=1&scene=1&srcid=1216dJfuEGYGvWPkkI8dgYAs&sharer_sharetime=1576505072992&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd)
