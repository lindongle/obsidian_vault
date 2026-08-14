---
title: 如何删除bmide工程多余模板
updated: 2026-06-13T22:08:30
created: 2026-07-05T17:04:52
tags:
  - TC
---

## <span style='color:#2E75B5'>如何删除bmide工程多余模板 </span>
收录于话题
![image1](4fd647acd887403dade3ad9cc82d347f.gif)
<span style='font-weight: bold;background:#59C3F9'>作者：陈扬鑫 审校：陈泓希</span>
**使用版本：TC11.3**
![image2](5fba19e2e23b43c4993399b44771adf1.png)
<span style='background:#FEFEFE'>有时候实施或者开发人员需要使用客户的BMIDE工程用来进行测试、分析问题或者开发调试。但是通常客户的BMIDE工程都会有除了foundation以外的模板，比如nx集成、catia集成、变更、PS集成等等的模板。而实施或者开发人员的虚拟环境往往没有安装这些模块并且使用过程不需要用到这些模块，如果直接使用客户提供的BMIDE工程就会很繁琐，需要先安装各个模块。那么有没有办法移除BMIDE工程中多余的模板呢？</span>
**具体操作步骤**  
**  
  **

![image3](df445bdddc6b416a863c82f33e5078c2.png)
第一步，找到BMIDE工程，打开并编辑%project%\extensions中的dependency.xml文件，如图1所示，删除nx集成和变更模板。
![image4](11fe0b19e86a46e38d82255e4a69e383.png)
**图1**
![image3](df445bdddc6b416a863c82f33e5078c2.png)
第二步，打开并编辑%project%\install\tem_contributions中的feature_a2test.xml，如图2所示，删除nx集成和变更模板。
![image5](a0f5faa69f5346218733354689b21283.png)
**图2**
![image3](df445bdddc6b416a863c82f33e5078c2.png)
第三步，从%TC_ROOT%\bmide\workspace\11000.2.0中拷贝BMIDE工程至任意位置，删除TC_ROOT%\bmide\workspace文件夹。
![image3](df445bdddc6b416a863c82f33e5078c2.png)
第四步，重新打开BMIDE生成workspace文件夹，再退出BMIDE，最后将BMIDE工程拷贝至workspace文件夹下，再次打开BMIDE导入工程，如图3所示，NX集成和变更模板已经被移除。
![image6](a36a5f6a6a6d4beaa4c3ee15f8f7d2d4.png)
**图3**
**关注我们**  

![image7](6e7203557d724caf92ad32d04862b8ea.png)
![image8](566446a02ff043a29a53f48d0063c565.jpg)
预览时标签不可点
收录于话题 \#
个
上一篇 下一篇
阅读
分享 收藏
赞 在看
已同步到看一看[写下你的想法](javascript:;)
前往“发现”-“看一看”浏览“朋友在看”
![image9](853109057e0f4e8e99e18fa9561c2753.png)
前往看一看
**看一看入口已关闭**
在“设置”-“通用”-“发现页管理”打开“看一看”入口
[我知道了](javascript:;)
已发送
取消
#### *<span style='color:#5B9BD5'>发送到看一看 </span>*
发送
如何删除bmide工程多余模板
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

[\<From: https://mp.weixin.qq.com/s/sa9eMHBnbGD0OK3nJ8RR1g\>](https://mp.weixin.qq.com/s/sa9eMHBnbGD0OK3nJ8RR1g)
