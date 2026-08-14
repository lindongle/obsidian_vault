---
title: 功能验证-AR权限
updated: 2026-06-13T22:06:49
created: 2026-07-05T17:04:56
tags:
  - 泛亚
---

![image1](625e802444194089ac35dbb585188999.gif)

![image2](a420b34f4e2a48b9808dba086333a2a9.gif)

![image3](ac734121ba25467aa2178dd83ad98209.gif)

![image4](9adfde4a4e4d4bc4ba5fe339a924c0f3.gif)
0、创建人/发起人/dba角色，都可以修改及保存。
1、对AR无写权限，无法显示修改图标
2、对AR有写权限，但对可测量属性无写权限，可以修改可测量属性的结果，但无法保存。其他属性直接不能修改。提示
Edits to 3 of 1 attributes failed.
The "Write" access is denied on the object "temperature" of class Att0MeasurableAttributeStr (Att0MeasurableAttributeStr).
The access is denied.
The object "temperature" could not be loaded or refreshed. Please refer to the preceding errors in this error stack for more information
3、对AR有写权限，对可测量属性有写权限，只可以修改可测量属性的结果，也可以保存。其他属性无法修改。
4、放dba角色后，同3.
5、更改可测量属性的所有权后，且对AR有些权限，同3.
6、更改AR的所有权后，且对可测量属性有写权限，不论是否dba角色，同3.
