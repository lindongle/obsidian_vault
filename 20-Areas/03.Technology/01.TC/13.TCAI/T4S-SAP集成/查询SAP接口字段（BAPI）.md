---
title: 查询SAP接口字段（BAPI）
updated: 2026-06-06T10:08
created: 2024-09-26T09:33:50
---

查询SAP接口字段（BAPI）
2024年9月26日
9:33
事务代码：SE37
T4S_AIP_DOC中找到对应的BAPI函数名
![image1](5112c0709cff470297fbb0502f65052f.png)
se37中输入上述函数名，点击显示
![image2](f777007ccdd4424fb0538df19fbd07d7.png)
点击导入，可以看到所有的物料视图，选择关联类型列的值，可以看到每个视图的字段；
如HEADDATA为基本视图，MATL_TYPE为物料类型字段
![image3](166322bbb51447be950e6e26675f84cd.png)

![image4](3f3716e1e29e40f6ac06ee5b4e82ed65.png)

![image5](74ba86f46a914736968e372bc7ad2b06.png)

如查询业务伙伴对象的接口：
BAPI_BUPA_CREATE_FROM_DATA

