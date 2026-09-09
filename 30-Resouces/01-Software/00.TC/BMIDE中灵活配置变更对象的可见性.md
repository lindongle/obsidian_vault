---
title: BMIDE中灵活配置变更对象的可见性
updated: 2026-06-06T10:08
created: 2021-04-26T18:15:28
tags:
  - TC
---

## <span style='color:#2E75B5'>BMIDE中灵活配置变更对象的可见性 </span>
收录于话题
![image1](dd478f7fefc5474aaa5ca2e4a936a1bd.gif)
«span style='font-weight:bold;background: \#59C3F9'»作者：李晓东 审校：游振君«/span»
**测试版本：Teamcenter11.2.2**

在TC10.1.6之后，BMIDE中对于变更业务对象的显示(可见性)做了调整，之前可以通过创建条件Condition来实现，例如在变更对象ChangeNotice下面新建一个子对象A3ChuCN，然后再新建一个名称为 A3isA3ChuCNCreatable条件，该条件可以决定在新建的列表中是否显示A3ChuCN。

![image2](ce6cf28b57f944a0888f4c91c57a591f.png)
**图1**
在TC10.1.6及之后的版本，比如TC11.2.2，BMIDE中给变更对象引入一个新的业务对象常数 Cm0ChangeItemCreCondition，由该常数确定哪个条件来控制变更对象是否可见。如下图所示：该业务对象常数指向条件A3isA3ChuCNCreatable。
![image3](bbca03b655cd4de5b5b3669483379906.png)
**图2**
现在可创建的条件包含了两个参数：WorkspaceObject o和UserSession u，在TC10.1.6之前，只能使用仅包含UserSession u参数的条件。
![image4](2cb5526c2e3a4fefa859acd35bd75699.png)
**图3**
在弹下面的条件A3isA3ChuCNCreatable判断：如果选择业务对性是Item或者Document，就会展示变更对象，即可以发起变更。
![image5](f15d2bfbf6774406854e72f1e3343b9c.png)
**图4**
**效果如下**  
**  
  **

![image6](20ff92b06eb047638fb607053999865c.png)
选中Document对象创建变更，可以看到自定义的变更对象ChuCN。
![image7](0fe2b481a8204aa083edaddfcb924061.png)
**图5**
![image6](20ff92b06eb047638fb607053999865c.png)
对文件夹对象创建变更，就看不到自定义的变更对象ChuCN。
![image8](a3472310bfbb4777aacbc068a344970a.png)
**图6**
**关注我们**  

![image9](e8c3562a662e4211817214f42126ff0f.png)
![image10](5ad5302fb46f46e599a0a76425294434.jpg)
预览时标签不可点
收录于话题 \#
个
上一篇 下一篇
阅读
分享 收藏
赞 在看
已同步到看一看[写下你的想法](javascript:;)
前往“发现”-“看一看”浏览“朋友在看”
![image11](43a09ea41a894328822621797e857270.png)
前往看一看
**看一看入口已关闭**
在“设置”-“通用”-“发现页管理”打开“看一看”入口
[我知道了](javascript:;)
已发送
取消
#### *<span style='color:#5B9BD5'>发送到看一看 </span>*
发送
BMIDE中灵活配置变更对象的可见性
最多200字，当前共字
发送中

微信扫一扫  
关注该公众号

微信扫一扫  
使用小程序
[取消](javascript:void(0);) [允许](javascript:void(0);)
[取消](javascript:void(0);) [允许](javascript:void(0);)
[知道了](javascript:;)
**长按识别前往小程序**

[\<From: https://mp.weixin.qq.com/s/TLFNrx23GKtAwPXegt7F8A\>](https://mp.weixin.qq.com/s/TLFNrx23GKtAwPXegt7F8A)
