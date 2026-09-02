---
title: 非 dba 用户在创建变更对象时无法访问日期属性
updated: 2026-09-02T16:30:04
created: 2026-07-05T17:04:40
tags:
  - TC安装部署
---

非«span style='font-family:"Calibri Light";background:white'» dba «/span»用户在创建变更对象时无法访问日期属性
） 非 dba 用户在创建变更对象时无法访问日期属性
。
） infodba 和其他 dba 用户都很好。
） 也发生在项目上。
） 在“文件”--\>“新建操作”中，第一个对话框没问题，然后用户点击“下一步”。
） 在第二个对话框中，
尝试输入日期以弹出日历小部件会导致错误

HTTP 错误：
404
访问 /commonclient/ServerError.html
问题
原因：

未找到

） 在 2 层和 4 层客户端上均发生。
） TcRac 日志显示

ERROR ... - 没有与首选项名称关联的数据集信息： HTMLRacSharedLibs

） 在 Edit --\> Options 中，首选项

HTMLRacSharedLibs

显示 HTMLRacData
HTMLStylesheetThirdPartyData

的值

） 此外，管理员最近对默认的 OOTB Access Manager 规则树进行了更改。

**方案**
） 已进行
更改 ） 必须授予对 HTML\* 数据集的读取访问权限，这些数据集的类型为 Zip。
） 例如，
HTMLRacData

*From \< <https://support.sw.siemens.com/zh-CN/product/282219420/knowledge-base/PL8012996>\>*

2024年7月24日
11:23
