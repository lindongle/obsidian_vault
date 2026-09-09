---
title: Part-design关系
updated: 2026-06-05T23:13
created: 2018-12-11T17:28:04
---

1、关系可以定义子类
2、part和design的提供者和表示关系，可以实现粘贴时自动相互显示，即A粘到B关系下面，自动会把B放到A的关系下面。
3、提供者和表示对应的真实名称：TC_Is_Represented_By（关系属性）和Representation_for(Runtime属性)

4、Part与Design的GRM如果配置1对1关系。则：
1）修订Part或Design均会自动在各自关系下自动切换成最新版本（如果GRM为限制关系权限读取版本的写权限）
2）如果关系读取版本的写权限，则修订Design时，Part为发布状态，则不会更新Part下的Design版本，且新版本的Design下也不会有Part，为空。
5）如果Part与Design为1对多关系，则相同Design的不同版本不能放到一个Part版本下，因为Design版本都会产生Part关系，导致违反1对多关系。

