---
title: <span style='color:black'>1.背景介绍</span>
updated: 2026-08-27T08:47:40
created: 2026-07-05T17:04:52
tags:
  - TC
aliases:
  - <span style='color:black'>1.背景介绍</span>
linter-yaml-title-alias: <span style='color:black'>1.背景介绍</span>
---

TC与SolidWorks集成开发
2026年4月10日
7:43

[源网页](https://mp.weixin.qq.com/s?__biz=MzkxMTE2ODMyNA==&mid=2247483762&idx=1&sn=6345c174f45a984fbff6616d7938048f&chksm=c0b856cb8f16450c3f536571ee9b39ee58a10f924018c3388039bb6835077c0f99b64379bb75&mpshare=1&scene=1&srcid=0410MDM9yrA3gB0JeRQjCQII&sharer_shareinfo=7aec21dd2c5d33ecd7cf80714cd3fd1f&sharer_shareinfo_first=7aec21dd2c5d33ecd7cf80714cd3fd1f#rd)
公众号名称：菜鸟逸程
作者名称：刘大少爷
发布时间：2026-04-09 20:07
# <span style='color:black'>1.背景介绍</span>
官方供用户针对 SWIM环境中的保存、检入（Check-in）操作进行自定义校验和业务逻辑扩展。用户可以根据需求实现特定校验、自动物料编号生成等功能。
<span style='color:black'>例如，保存前校验弹框</span>
![image1](34483bd123cd45aeb73c80a4dac97c32.png)
<span style='color:black'>**2.实现步骤**</span>
1.  <span style='color:black'>找到并重命名模板文件</span>
«span style='color:black'»\com\transcendata\userexits\SwimUserExits.txt  
↓ 复制并重命名  
\com\transcendata\userexits\SwimUserExits.java«/span»
<span style='color:black'>提供了几个方法（saveValidation，saveNew，saveReplace，saveInit，saveItemId），具体的可以在文件中详细查看。</span>
2.  取消注释需要扩展的方法，例如，saveValidation专门用于<span style='font-weight:bold'> </span><span style='background:#FF4C00'>保存前校验</span>的方法。
调试时可以查看 SWIM 在%TEMP% 目录下生成的 XML 文件（文件名类似txd_save_validation.xml），里面包含完整的保存上下文数据，方便你确认可以校验哪些字段。
里面实现代码其实就是解析xml文件，如果需要集成TC中的数据，使用SOA方法即可实现，官方也提供了样例。
3.  编译
打开命令提示符，进入目录后执行编译：
<span style='color:black'>cd C:\swim\com\transcendata\userexits</span>
<span style='color:black'>TC13/TC14 及以上版本使用以下命令： </span>
<span style='color:black'>javac -cp "c:/swim/swim.jar;c:/swim/soa_client14.1/\*;c:/swim/soa_client14.1/external/\*;" SwimUserExits.java</span>
注意：JDK 版本必须与客户端运行时的Java 版本一致
编译成功后，该目录下会生成：SwimUserExits.class若干 SwimUserExits\$1.class、SwimUserExits\$2.class等内部类文件，所有 .class 文件都需要保留，缺一不可
<span style='color:black'>d.部署（无需额外操作）</span>
<span style='color:black'>编译输出的.class 文件就在正确位置\<swim_install_dir\>\com\transcendata\userexits\\SWIM 启动时会自动加载，不需要重启服务或复制文件，重新启动SolidWorks/SWIM 客户端即可。</span>
<span style='color:black'>e.验证</span>
- <span style='color:black'>启动 SolidWorks + SWIM</span>
- <span style='color:black'>打开一个零件，执行Check In / Save操作</span>
- <span style='color:black'>点击 Save 按钮，观察是否触发你的校验逻辑</span>
- <span style='color:black'>如果校验失败，应弹出你自定义的提示窗口并阻止保存</span>

![image2](37a95eb8323c4e53b0f8b94b2d1708aa.jpg)
<span style='color:black'>刘大少爷 菜鸟逸程 </span>
