---
author: TcConsultant
source: 微信公众号
url: https://mp.weixin.qq.com/s?__biz=Mzg3NDg2NDUzOQ==&mid=2247484360&idx=1&sn=18288f4886762565623db4700a38ff32&chksm=cfd230a726ba52900ff8414de4d573d7862c79851253793f1721eb75da9ec8fcf2096eaaa701&mpshare=1&scene=1&srcid=0909ikMNyNC92FrDVDU9udwP&sharer_shareinfo=c5d81552ac50f6bdceaf664063624057&sharer_shareinfo_first=c5d81552ac50f6bdceaf664063624057#rd
Created: 2026-09-09 20:09:31
tags:
  - 笔记同步助手
id: 4e43618e-e6b3-4e2b-8559-c625097d8ccf
created: 2026-09-10T09:07:24
updated: 2026-09-10T09:07:26
---

公众号名称：PLM菜鸟

作者名称：TcConsultant

发布时间：2026-08-07 09:00

实际需求：

使用不同颜色的图标在内容中直观展示不同状态的需求

## BMIDE配置

1.需求版本添加客制化属性，如kw8ProcessStatus，关联LOV（值为A、B、C、D）

### 2.将kw8ProcessStatus映射到Awb0ConditionalElement中

## AWC配置

### 1.准备不同的svg文件

2.可以使用OOTB命令npm run generateModule创建module或下载文中的样例module

### 3.kit.json中name=module名

![[99-Assets/303b6f585afd2dcfa04afffcba44d6c4_MD5.png]]

### 4.module.json中name=module名

![[99-Assets/254b1c1256ded6344ad47de5757aefb6_MD5.png]]

5.typeIconsRegistry.json中要详细的写出当XX对象版本属性XX=XX值时，使用哪个图标，其中：

-   type name=对象类型真实值，如要在内容中生效，则使用Awb0ConditionalElement
    

-   prop name=属性真实值
    
-   condition=生效条件
    
-   iconId=svg的名称
    

![[99-Assets/e136aa2eeadbef60fe3cb07d65534162_MD5.png]]

6.typeProperties.json中typeProperties=对象类型真实值，additionalProperties=客制化属性

![[99-Assets/69589feaae3f2e7b781f23951c0a2b6f_MD5.png]]

### 7.awbuild

## 效果

![[99-Assets/89270b16e59b7dfdf02973fbe7f4d6fb_MD5.png]]

关注公众号并回复 AWC图标切换 即可获取module.zip下载链接

---

内容效果不满意？[点此反馈](https://feedback.notebooksyncer.com/feedback/6283cc41_1788955770042?u=https%3A%2F%2Fmp.weixin.qq.com%2Fs%3F__biz%3DMzg3NDg2NDUzOQ%3D%3D%26mid%3D2247484360%26idx%3D1%26sn%3D18288f4886762565623db4700a38ff32%26chksm%3Dcfd230a726ba52900ff8414de4d573d7862c79851253793f1721eb75da9ec8fcf2096eaaa701%26mpshare%3D1%26scene%3D1%26srcid%3D0909ikMNyNC92FrDVDU9udwP%26sharer_shareinfo%3Dc5d81552ac50f6bdceaf664063624057%26sharer_shareinfo_first%3Dc5d81552ac50f6bdceaf664063624057%23rd&s=obsidian)