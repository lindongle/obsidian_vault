---
title: 表属性创建及plmxml导出
updated: 2026-08-12T11:01:26+08:00
created: 2020-05-21T10:01:38
---

创建表列对象：
![image1](37af0d9ffc2c4fb3ba2c6cdb8fabb755.png)
创建列属性：
![image2](bc7980b563094903b1417732ee74ba68.png)
创建表属性，并关联上面创建的列对象：
![image3](1bd83a97dd7349d99be8c83dbebaeccd.png)

配置业务对象，对表属性进行渲染：
\<page titleKey="tc_test" title="检验特性"\>
\<section titleKey=""\>
\<objectSet source="sec8_InspecCharacter2.SEC8_InspecCharacter" defaultdisplay="tableDisplay" \>
\<tableDisplay\>
\<property name="sec8_InspecPointNo" /\>
\<property name="sec8_ql_nl" /\>
\<property name="sec8_StandardValue" /\>
\<property name="sec8_MaxValue" /\>
\<property name="sec8_MinValue" /\>
\<property name="sec8_InspectItemNo" /\>
\<property name="sec8_InspectItemName" /\>
\<property name="sec8_Remark" /\>
\</tableDisplay\>
\<command renderingHint="commandbutton" commandId="com.teamcenter.rac.common.AddReference"/\>
\<command renderingHint="commandbutton" commandId="com.teamcenter.rac.deleteReference"/\>
\<parameter name="localSelection" value="true"/\>
\</objectSet\>
\</section\>
\<separator/\>
\</page\>
![image4](dc90ee590d864675b852311db0caf946.png)
效果如下：
![image5](7cfd1fb9510c4db597965ceffc240d71.png)
配置表属性导出到xml
![image6](c62cd801421e4a99b31e48833f5deeac.png)
导出后如下：
![image7](033d036c3cb24524b72cad7ac293fa37.png)

