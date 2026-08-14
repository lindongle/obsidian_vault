---
title: T4S逻辑梳理
updated: 2026-06-10T15:30:41
created: 2026-07-05T17:05:03
---

1.  t4s_mapping_config.sd，主配置
    1.  tc账号：datenmigration" "admin@tc" "dba"
    2.  sap账号：DP1，001，RFC_TC/Cons4R
    3.  默认值：
        1.  行业领域：默认A，工厂工程/结构，为何不是M，机械工程？
        2.  基本计量单位：默认EA
        3.  BOM应用程序：默认PP01
        4.  BOM用途：默认2，工程/设计，为何不是生产？
        5.  可选BOM：默认1
        6.  文档类型：默认DOC
        7.  文档版本：默认AA
        8.  文档部分：默认000
    4.  set ::GuiDat(SAP_LogOnIniMode) "USE_SAPRFCINI" ，使用 T4S_ROOT/etc/saprfc.ini文件作为SAP的连接配置文件。
    5.  set ::T4S_Defaults(TestConfig)"ON"，==启用测试配置==

