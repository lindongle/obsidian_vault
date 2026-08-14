---
title: 动态LOV
updated: 2026-06-06T10:08:49
created: 2026-07-05T17:04:45
---

数据类型要与对应属性的类型匹配，如果属性为引用类，则LOV需要使用tag类型

![image1](ff7c8a30e36746be8e0452bccd52f032.png)

![image2](1b6d72356ff24e6e80d14bb0604b287e.png)

Add the name of a dynamic LOV to the LOVLookupSupport global constant to display the text of the dynamic LOV in different languages or to search for the text in the dynamic LOV.
将动态 LOV 的名称添加到 LOVLookupSupport 全局常量以显示不同语言的动态 LOV 文本或搜索动态 LOV 中的文本。
LOVLookupSupport 全局常量会查看以下方法，以执行从显示值到内部值或内部值到显示值的必要映射：
LOV_ask_num_of_values_msg
LOV_ask_values_msg
LOV_ask_disp_values_msg

查询最新版次：添加以下
AND query-type.active_seq != 0
