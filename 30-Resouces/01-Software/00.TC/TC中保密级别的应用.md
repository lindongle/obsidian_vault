---
title: TC中保密级别的应用
updated: 2026-06-13T22:08:29
created: 2026-07-05T17:04:52
tags:
  - TC
---

TC中保密级别的应用
2019年10月26日
0:28

## <span style='color:#2E75B5'>TC中保密级别的应用 </span>
![image1](d1e0f5d342bb4c6e9fa3f8a14ca7bdbb.jpg)
«span style='font-weight:bold;background: \#59C3F9'»作者：韩琪  审校：朱松«/span»
<span style='color:black'>**使用版本：Teamcenter**</span>
<span style='color:black'>在Teamcenter系统中，默认自带了3种安全保密级别，级别由低到高分别为secret、super-secret、top-secret，根据安全保密规定，要求人员只能查看保密级别跟自己同级或者比自己级别低的对象，而不能查看保密级别比自己身份高的对象。</span>
<span style='color:black'>创建3个保密级别不同的用户：</span>
![image2](7f672b2f967f4629903e622807467bf9.jpg)
<span style='color:red;text-align:center'>**图1**</span>
![image3](9f5d01e680ad479681c976a0d8099e25.jpg)
<span style='color:red;text-align:center'>**图2**</span>
![image4](09ad430120dd4e4280060aba6b6d1487.jpg)
<span style='color:red;text-align:center'>**图3**</span>
<span style='color:black'>使用除了001、002、003以外的用户登录TC，创建3个零组件。</span>
![image5](3ab22beb08ac4e69a58bcd62b1261652.png)
<span style='color:red;text-align:center'>**图4**</span>
<span style='color:black'>选中“000102—top_secret”右击编辑属性</span>
![image6](2005bc237f7548dfa46e404f6a49b660.jpg)
<span style='color:red;text-align:center'>**图5**</span>
<span style='color:black'>在“全部属性”里找到IP分类，选择top-secret，并保存签入。</span>
![image7](afacd43ce33a449aa5906dd36455179e.png)
<span style='color:red;text-align:center'>**图6**</span>
<span style='color:black'>按照上述操作，分别将“000103-super-secret”的IP分类设为super-secret，“000104-secret”的IP分类设为secret。</span>
![image8](2459ce4c19fd4e8c9f6ca1c9692e3f8e.png)
<span style='color:red;text-align:center'>**图7**</span>
![image9](0dae7e90dcd04dbe8474656afe005af0.png)
<span style='color:red;text-align:center'>**图8**</span>
<span style='color:black'>在访问管理器里，添加下图所示的权限控制</span>
![image10](10132eac125941a2880db8b12a4609c9.png)
<span style='color:red;text-align:center'>**图9**</span>
«span style='color:#0573AF;text-align:center'»User Under IP Clearance:  
«/span»
«span style='background: \#B6E4FD'»人员密级比对象密级低时的权限控制«/span»
«span style='color:#001CB4;text-align:center'»User Has IP Clearance：  
«/span»
«span style='background: \#B6C1FD'»人员密级跟对象密级同等时的权限控制«/span»
«span style='color:#4000B4;text-align:center'»User Over IP Clearance：  
«/span»
«span style='background: \#CFB6FD'»人员密级比对象密级高的权限控制«/span»
«span style='background: \#8E59F9'»World：全局«/span»
«span style='background: \#8E59F9'»即代表没有被分配到任何保密等级的人员«/span»
<span style='color:black'>并将此条ACL放在下图所示位置</span>
![image11](a0d17601af0c44099ef426e41f0912db.jpg)
<span style='color:red;text-align:center'>**图10**</span>
<span style='color:black'>配置完成后，此时用户003登陆系统，查找上述3个零组件时，只能查到安全密级为secret的零组件,保密配置成功。</span>
![image12](6bc0c188db024b3c9a5b774dd6af03df.png)
<span style='color:red;text-align:center'>**图11**</span>
![image13](552ab24df7714618b0eb47f0b39f9d9b.jpg)
<span style='color:red;text-align:center'>**图12**</span>
![image14](6fc10d7d5eb64e99b839e944f41ff84c.jpg)
<span style='color:red;text-align:center'>**图13**</span>
<span style='color:black'>通过应用系统中的保密级别，既可以更好地对TC中的数据进行权限管理，同时也能对数据的安全保密进行控制。</span>
![image15](4dcbe56a5e254e0cbd375216558540bc.jpg)
![image16](09a0dfc030f74c7199d70a97146cc387.jpg)
阅读
在看
已同步到看一看[写下你的想法](javascript:;)
前往“发现”-“看一看”浏览“朋友在看”
![image17](7cc6fab013f34990bc028837314e67b2.png)
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

微信扫一扫  
关注该公众号

微信扫一扫  
使用小程序
[取消](javascript:void(0);) [允许](javascript:void(0);)
[取消](javascript:void(0);) [允许](javascript:void(0);)
[知道了](javascript:;)
[确定](javascript:void(0);)
[\<From: http://mp.weixin.qq.com/s?\_\_biz=MzAwMTAxMTY1NQ==&mid=2655036193&idx=4&sn=3adf6859185836a712dd4d455f77d4f5&chksm=81543989b623b09fbabffe1f8a9471b554f3346d06047e0b9c64578aa248cd6e8912b7bca02f&mpshare=1&scene=1&srcid=1026wPQUXn23y0Db4jkZ7qLy&sharer_sharetime=1572020904014&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd\>](http://mp.weixin.qq.com/s?__biz=MzAwMTAxMTY1NQ==&mid=2655036193&idx=4&sn=3adf6859185836a712dd4d455f77d4f5&chksm=81543989b623b09fbabffe1f8a9471b554f3346d06047e0b9c64578aa248cd6e8912b7bca02f&mpshare=1&scene=1&srcid=1026wPQUXn23y0Db4jkZ7qLy&sharer_sharetime=1572020904014&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd)
