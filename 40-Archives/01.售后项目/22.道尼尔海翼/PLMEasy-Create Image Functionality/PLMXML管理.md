---
title: PLMXML管理
updated: 2026-06-06T10:09:05
created: 2026-07-05T17:05:02
---

1.  传输模式：DS4_StampExport
    1.  TransferMode 配置为仅导出Item、Item版本以及 PDF 数据集及其他文件；
    2.  ![image1](f4c92307df4f43dd9e867aacb8a7c974.png)
2.  结束规则：DS4_StampExport_cr
    1.  ![image2](1e9154850ded491e8bbe16113804e90c.png)
3.  属性集：DS4_StampExport_ps（获取数据集上的属性签字信息）
    1.  PLMXML 与主要业务对象 (PBO) 结合存在以下问题：
        1.  PLMXML PropertySet 不完全支持继承数据模型中的子类型。因此，属性不能在抽象级别定义（即 DS4_AbstrLevel23Revision），而必须为每个子类型定义（即 DS4_QMLevel2DocRevision 和 DS4_QMLevel3DocRevision）。
        2.  Item和Item版本级别的自定义属性不会像表单那样自动导出。
    2.  因此，首先使用一个占位符条目创建 PropertySet。
    3.  ![image3](1db7d72848c3490282fe1e446fb0dfde.png)
    4.  然后为所有需要的属性生成了一个条目列表：
TYPE.DS4_QMLevel2DocRevision:PROPERTY.ds4_processownername: DO,
TYPE.DS4_QMLevel3DocRevision:PROPERTY.ds4_processownername: DO,
... 使用 tcxml_export.exe 生成了一个 TCXML 文件，上面的条目列表已集成到 XML 数据中。
5.  然后导入编辑后的 ​​XML 文件以创建所需的 170 多个属性条目：
tcxml_import -file=ds4_tm.xml -u=infodba -p=\*\*\*-g=dba -scope_rules -scope_rules_mode=overwrite
6.  如果要标记/处理其他属性，则需要将它们添加到此 PropertySet 以用于所有 ItemRevision 子类型
