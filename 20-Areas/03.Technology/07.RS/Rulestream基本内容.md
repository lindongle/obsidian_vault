---
title: Rulestream基本内容
updated: 2026-06-24T10:14:40
created: 2026-07-05T17:04:51
---

Rulestream中的Teamcenter功能由零件族上定义的specs（aka specs）控制。 Teamcenter规范共有三种类型-搜索，Item和Object。 搜索规范允许Rulestream定义要使用的已保存查询，要搜索的内容以及要返回的内容。 Item规范使Rulestream可以定义要使用的Item类型，如何与之交互–创建，修改，修改–并设置该Item的属性值。 最后，Object规范允许规则创建者创建Teamcenter业务对象并将其与Teamcenter的Item相关联

1、可以使用TC账号登录（公用TC的会话），通过Spec（定义属性的映射、对对象的操作，如可以创建什么类型的Item等）来与TC中的对象建立关联。可以在Stream界面上定义与TC交互的属性mapping。可以将TC的账号密码维护在Rulestream中，也可以独立单独输入或做单点登录。
2、可以创建、修改、修订Item、数据集及命名引用、表单、发起工作流程、分类及分类ICO、BOM等对象，可以浏览JT及缩略图，数据集命名引用不能多个，几何零件下如果有非几何零件，则不会认为是非几何零件，后面的版本会修复。
3、BOM的创建为自下而上，在子件上标识父件是谁，而不是基于父件搭建子件。不支持精确装配。可以自定义加载BOMLINE的属性和行数。自定义的BOMLINE属性必须为注释类型对象，并将注释类型添加到RS_BL_NOTE首选项中。表行属性对于日期和双精度类型，只支持英文显示。
4、Item属性可以从Rulestream通过Spec规范带到TC中。可以定义可创建的Item类型和发起的流程模板、可选择的关系类型等
5、与NX集成支持托管模式。
6、搜索功能与TC中类似，也可以查询已保存的搜索。查询结果显示的属性内容需单独再Stream中定义。如果有多个数据集的命名引用，只会显示第一个。可以通过eamcenter grid control.对象自定义返回结果的属性集合。可以单独设置返回的默认结果的数量。
7、对象下的显示的关系及关系对象下显示内容可以自定义，需要与TC对应信息做映射。
8、log日志路径：C:\somewhere\somplace\Rulestream\\version\>\logs和C:\\TEMP%.

![image1](654d11b2bbb54fcf815ea8bd311b1a2d.png)

![image2](b104bc886d864bc8950a38faeee43893.png)

