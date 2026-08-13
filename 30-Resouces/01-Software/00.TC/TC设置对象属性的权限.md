---
author: 李杰智
source: 微信公众号
url: https://mp.weixin.qq.com/s?__biz=MzkwNTI5MDY0OQ==&mid=2247486475&idx=1&sn=f42db68dbefc7d56dc4371b73353243a&chksm=c1ed9325272b768ce3819368943b5024708997850cc3b1e37a20d9eef47bda60346438af2492&mpshare=1&scene=1&srcid=0714zwOO5WTrj9ouSMNYCiLc&sharer_shareinfo=a7d52d6afbd88dc72c541a4fcddb555d&sharer_shareinfo_first=a7d52d6afbd88dc72c541a4fcddb555d#rd
Created: 2026-07-14 08:55:54
tags:
  - 笔记同步助手
id: 72e11868-5b0a-411e-9e66-a230a0b7557b
title: 1.启用属性级安全（ALS）支持(只有自定义属性才支持)
created: 2026-07-14T13:28:51+08:00
updated: 2026-07-14T15:11:46+08:00
---

公众号名称：PLM之友

作者名称：李杰智

发布时间：2026-04-25 12:04

背景：项目上有时候会出现针对属性设置权限的需求，以前老版本，针对这种情况，一般是通过在渲染中进行条件判断或者开发单独页面的方式来实现，下面介绍一下新版本中针对属性单独设置权限的功能。

环境：tc2512

# 1.启用属性级安全（ALS）支持(只有自定义属性才支持)

打开 BMIDE 中的目标自定义持久属性，点击「Property Constants」。

双击 Fnd0SupportAls 常量，将值设为 true。

前提：属性需为持久属性，且符合 ALS 的适用限制。

![[99-Assets/8ce0b8ca0c694c44590880038f33a869_MD5.png]]

## ALS的适用限制

![[99-Assets/25afdb44f4bd038f39357075e2b3ad4d_MD5.png]]

![[99-Assets/1a1cc08ab260465d46cbfdbbe4764edd_MD5.png]]

# 2.使用管理员登录awc，在访问管理器中创建属性组

进入访问管理器（Access Manager）的「Property Groups」页面。

点击「Add Property Group」，输入唯一名称，选择属性所属的业务对象类型。

在「Properties」列表中选择已启用 ALS 的自定义属性(可以选择多个属性)，点击「Add」完成创建。

![[99-Assets/7b74ab217cf018ab1420cc472ea126b2_MD5.png]]

# 3.定义权限控制规则

新建acl

![[99-Assets/289325f55daf93f550ff2c9ccefe48a9_MD5.png]]

添加规则

![[99-Assets/0808b3515e863d0d0992e49068006bc4_MD5.png]]

![[99-Assets/e55c20f3855f62e0009140cf1a9ec034_MD5.png]]

![[99-Assets/ea69ea14e40f048a29cee40e09c037aa_MD5.png]]

![[99-Assets/9d5ed76d13f659a75ef620ade81a409a_MD5.png]]

![[99-Assets/0561e643ffdef534ca681820e48b3b02_MD5.png]]

# 4.验证权限设置

![[99-Assets/a2199846709f664c5c7a3de7c2535da6_MD5.png]]

![[99-Assets/7e88b6fc4217a76b620a34f4cd367614_MD5.png]]

附录：

属性访问控制列表设置的详细配置解释：

## Default settings 默认设置

When adding ALS entries to your rule tree, there are three options available for setting baseline permissions.在将 ALS 项添加到规则树时，有三种选项可以设置基线权限。

## Restrict Write Access限制写入权限

Restricts write access forallproperties on the object, not just the ALS properties. This setting can be useful when an object is released and you want to grant write permissions to a few ALS properties, but no other properties. Check this permission to restrict access to all properties, and then assign write access in the table using property groups. Do not use this option in combination with Grant Write Access.限制对对象的所有属性的写入访问权限，而不仅仅是 ALS 属性。当对象被释放并且您想要授予对少数 ALS 属性的写入权限，但不授予其他属性的写入权限时，此设置可能有用。请检查此权限，以限制对所有属性的访问，然后使用属性组在表中分配写入访问权限。请勿将此选项与 授予写入访问权限 一起使用。

## Grant Write Access授予写入访问权限

Grants write access for all ALS properties on the object. Properties that are not enabled for ALS are not affected.授予的权限可写入对象上所有 ALS 属性。未启用 ALS 的属性不受影响。

## Grant Read AccessGrant Read 访问

Grants read access for all ALS properties on the object. Properties that are not enabled for ALS are not affected.授予对象上所有 ALS 特性的读取访问权限。未启用 ALS 的特性不受影响。

## A simple example 一个简单的例子

The most basic configuration consists of a single custom entry on the rule tree, specifically for the business object containing the properties. You must add a named ACL to this line that grants read permissions, write permissions, or both, to the object.最基础的配置包括规则树上只有一个自定义条目，专门针对包含属性的业务对象。必须为该行添加一个名为 ACL 的条目，该条目授予对该对象的读取、写入或两者权限。

![[99-Assets/78faacff36b55e78a6a9779f46a9c57a_MD5.png]]

In this example, a custom-named ACL is assigned, granting read and write permissions only to the demo group for the object, and denying those permissions for everyone else.在本示例中，分配了一个自定义名称的 ACL，仅授予对象的 demo 组读取和写入权限，而拒绝其他所有人的权限。

![[99-Assets/4c566b7889f312b9da777411b4ec2931_MD5.png]]

The Object Access Control List grants read and write permissions to the object. This list is required to control those permissions on ALS properties. Next, the Attribute Access Control List is used to control access to the property groups on that object.对象访问控制列表授予对对象的读取和写入权限。此列表是控制对 ALS 属性的这些权限所必需的。接下来， 属性访问控制列表用于控制对对象上属性组的访问。

In this example, the Grant Write Access and Grant Read Accesscheck boxes are both cleared, which means read and write permissions for all ALS properties are denied to everyone. Then, a property group is added to the table to grant read and write permissions only to the demo group.在本示例中，Grant Write Access 和 Grant Read Access 复选框都已清除，这意味着所有 ALS 特性读写权限均被拒绝给所有人。然后，向表中添加一个特性组，仅授予读写权限，只授予 demo 群组。

## 提示

Any rule tree entry evaluated above this line in the tree will ignore the Attribute Access Control List information of this line. For complete coverage, assign ALS ACLs at many places in your rule tree, based on your desired configuration.任何在树中高于此行的规则树条目都会忽略此行的 属性访问控制列表 信息。为了获得全面覆盖，根据您想要的配置，在规则树中的许多地方分配 ALS ACL。

## Common entries for ALS ACLsALS ACLs 的常见条目

Following are some commonly used locations for adding ALS controls.以下是一些常用的用于添加 ALS 控件的位置。

![[99-Assets/6e54bdd9360c7348052573f471552093_MD5.png]]

## Working

This entry in the rule tree applies to all objects that a user works with in the user interface. ALS ACLs added here control all objects by default.此规则树条目适用于用户在用户界面中工作的所有对象。这里添加的 ALS ACLs 会默认控制所有对象。

## Projects

If an object is part of a Project, then any ALS ACLs added to lines below it, like Working, are ignored.如果对象是 项目 的一部分，则任何添加到其下方的线（例如 工作 ）的 ALS 权限都将被忽略。

## Vault

If an object is part of a Vault, then any ALS ACLs added to lines below it, like Project, are ignored.如果一个对象是 Vault 的一部分，则在下面的行中添加的任何 ALS ACLs（如 Project）将被忽略。

---

内容效果不满意？[点此反馈](https://feedback.notebooksyncer.com/feedback/0b667860_1783990552924?u=https%3A%2F%2Fmp.weixin.qq.com%2Fs%3F__biz%3DMzkwNTI5MDY0OQ%3D%3D%26mid%3D2247486475%26idx%3D1%26sn%3Df42db68dbefc7d56dc4371b73353243a%26chksm%3Dc1ed9325272b768ce3819368943b5024708997850cc3b1e37a20d9eef47bda60346438af2492%26mpshare%3D1%26scene%3D1%26srcid%3D0714zwOO5WTrj9ouSMNYCiLc%26sharer_shareinfo%3Da7d52d6afbd88dc72c541a4fcddb555d%26sharer_shareinfo_first%3Da7d52d6afbd88dc72c541a4fcddb555d%23rd&s=obsidian)