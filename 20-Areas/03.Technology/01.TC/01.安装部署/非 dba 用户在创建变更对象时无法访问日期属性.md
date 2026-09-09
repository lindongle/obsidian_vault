---
title: 非 dba 用户在创建变更对象时无法访问日期属性
updated: 2026-06-05T23:23
created: 2024-07-24T11:23:02
tags:
  - TC安装部署
---

<span style='font-family:SiemensSans;background:white'>非</span>«span style='font-family:"Calibri Light";background:white'» dba «/span»<span style='font-family:SiemensSans;background:white'>用户在创建变更对象时无法访问日期属性</span>
<span style='background:white'>） 非 dba 用户在创建变更对象时无法访问日期属性</span>
<span style='background:white'>。</span>
<span style='background:white'>） infodba 和其他 dba 用户都很好。</span>
<span style='background:white'>） 也发生在项目上。</span>
<span style='background:white'>） 在“文件”--\>“新建操作”中，第一个对话框没问题，然后用户点击“下一步”。</span>
<span style='background:white'>） 在第二个对话框中，</span>
<span style='background:white'>尝试输入日期以弹出日历小部件会导致错误</span>

<span style='background:white'>HTTP 错误：</span>
<span style='background:white'>404</span>
<span style='background:white'>访问 /commonclient/ServerError.html</span>
<span style='background:white'>问题</span>
<span style='background:white'>原因：</span>

<span style='background:white'>未找到</span>

<span style='background:white'>） 在 2 层和 4 层客户端上均发生。</span>
<span style='background:white'>） TcRac 日志显示</span>

<span style='background:white'>ERROR ... - 没有与首选项名称关联的数据集信息： HTMLRacSharedLibs</span>

<span style='background:white'>） 在 Edit --\> Options 中，首选项</span>

<span style='background:white'>HTMLRacSharedLibs</span>

<span style='background:white'>显示 HTMLRacData</span>
<span style='background:white'>HTMLStylesheetThirdPartyData</span>

<span style='background:white'>的值</span>

<span style='background:white'>） 此外，管理员最近对默认的 OOTB Access Manager 规则树进行了更改。</span>

**方案**
<span style='background:white'>） 已进行</span>
<span style='background:white'>更改 ） 必须授予对 HTML\* 数据集的读取访问权限，这些数据集的类型为 Zip。</span>
<span style='background:white'>） 例如，</span>
<span style='background:white'>HTMLRacData</span>

*From \< <https://support.sw.siemens.com/zh-CN/product/282219420/knowledge-base/PL8012996>\>*

2024年7月24日
11:23
