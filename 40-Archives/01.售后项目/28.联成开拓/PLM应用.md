---
title: PLM应用
updated: 2026-06-06T10:08
created: 2024-07-24T17:44:56
---

1.  只有几个人用，做EBOM-研发偏文员，做MBOM（生产制造）
2.  ECR/ECN：量产前均研发做，量产后，ECR研发，ECN生产；
3.  变更都是线下签纸质，扫描上传到PLM，走流程
4.  EBOM搭建：基于结构给的明细表，有些不给，和硬件
5.  BOM均使用精确装配；
6.  EBOM到MBOM，主要时添加包材层级/采购总成去掉下级/SMT单独打包半成品等，原物料号后+MBOM，下发时去掉MBOM。只有带-MBOM下发SAP，目前已不做MBOM，只有P/EBOM，手动两边维护（接口已停用）。
7.  品牌在SAP中研发数据管理员创建，同步给PLM，使用的制造商模型，没有使用提供商及提供商零件，但SAP创建为供应商主数据。制造商编号使用的品牌物料的厂家型号，查询网站：https://activity.szlcsc.com/newuser.html?c=BD&sdclkid=AL2z15ji152NAJD6bOg&bd_vid=12294772734533378671
8.  A样发布就会下发SAP，转状态半成品会变更物料编码，编码上不体系状态。
9.  目前两个ITEM类型，电子元器件及PCB使用EDA组件，其他结构件/辅料/包材/PCBA均使用联成开拓物料。
10. 希望不同类型可以选择不同的物料类型和物料组。避免选错。
11. SAP中修改BOM，创建了ECN对象进行修改。
12. 产品标签为空白标签物料号，相同规格不同产品借用。
13. ![image1](6f538f6776444dd2aff7594dc4400108.jpg)

14. ![image2](358603877b3e4d1ea59a977c3a44e596.jpg)

15. ![image3](f7a5b72262854ae78275f368a7e18a1a.jpg)

16. ![image4](ac58e33451e64ec69c5d6b5c0c600d98.jpeg)

17. ![image5](4631150271ea44629e0070a588b55ddb.jpeg)

18. ![image6](2bc38d617ff84a34b4c1582c74dfee98.jpg)

19. ![image7](233f6dc179f34d1d9615bc454c10853a.jpeg)

20. ![image8](7c44c792e2d14354af54511184b966c0.jpeg)

