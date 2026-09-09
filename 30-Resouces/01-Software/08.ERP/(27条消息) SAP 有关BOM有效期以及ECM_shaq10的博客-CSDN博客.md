---
title: (27条消息) SAP 有关BOM有效期以及ECM_shaq10的博客-CSDN博客
updated: 2026-06-06T00:35
created: 2022-06-05T22:24:55
---

(27条消息) SAP 有关BOM有效期以及ECM_shaq10的博客-CSDN博客
星期日, 六月 5, 2022
2:24 下午
已剪辑自: <https://blog.csdn.net/wodegaolai/article/details/122308180>
1 BOM的有效截止日期 在stpo没有，开始日期是有的，所以应该只能通过BAPI CS_BOM_EXPL_MAT_V2，取datub；  
2 创建BOM时，valid to默认是9999.12.31。如果要设置有效期，可以使用CC01创建change number，然后使用CS02与BOM关联；  
3 如何开启ECM  
一、TCODE：OS27，设定是否启用ECM功能  
运行OS27，勾选EC management active，这将启用ECM，下方有一选择项History reqmt，如果同时勾选，则所有BOM创建时必须输入Change Number。
二、TCODE：OS25，设定哪些类型的BOM需要启用ECM功能  
运行OS25，点击New Entries按钮，输入BOM Usage和BOM Status，并勾选HistReq栏位，则相应的BOM在修改时就需要输入Change Number。需要注意的是，如果一个BOM在创建时输入了Change Number，那么修改时就必须也要输入Change Number，而无论OS25设定为何。
三、用户权限设定。设定用户是否可以在修改BOM时不输入Change Number  
使用TCODE：PFCG进行设定。Authorization Ojbect：C_STUE_NOH，将它的值设为空，如果它的值是’X’，则用户在创建和修改BOM并且不输入Change Number时，系统只会出现一个警告，而不会强制用户输入Change Number，如果没有启动ECM，此项无意义。
