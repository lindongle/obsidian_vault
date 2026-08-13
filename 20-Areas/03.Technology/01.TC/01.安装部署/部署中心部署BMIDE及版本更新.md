---
title: 部署中心部署BMIDE及版本更新
updated: 2026-06-06T10:09
created: 2025-07-03T13:11:31
tags:
  - TC安装部署
---

1.  BMIDE中导出软件包，导出界面上输入版本（大于上一个版本），默认1.0
![image1](d12c38cb71d348d881473816e3570428.png)
2.  放到部署中心软件库中，等待加载后，勾选软件；
3.  部署生成脚本后进行部署，部署会会自动覆盖上一个版本的BMIDE；
![image2](deceb7090fc24f82b2b53ee101401932.png)
4.  注：从2412开始无法直接BMIDE导入软件包进行热部署，提示缺少packages文件夹，可使用导入模板项目的方式进行导入；
![image3](7b68b1c96ced40da82ffc40a8eba346d.png)
5.  如果放到软件库中，加载出来的模板的补丁版本号不正确，需要对BMIDE进行升级后导出；
![image4](ca9051fea14c445c9ae0d36687aa5349.png)

![image5](0fbd47cf0472485a9fbc6b0e3b7fd42d.png)

