---
title: Dashboard_utils,PLM 数据提取的批处理作业
updated: 2026-06-06T10:08:59
created: 2026-07-05T17:05:02
---

1.  出于报告目的，已编写各种批次以使用命令行实用程序（非交互式）提取 PLM 数据。
2.  这些是使用正常的 Windows Server 任务计划程序安排的，并在服务器负载较低的时期执行，即在晚上/周末。
3.  为此编写的批处理文件 (BAT) 位于“sopfap02”中：“D:\siemens\dashboard_utils”
4.  输出也存储在“sopfap02”中，位于“E:\siemensshare\DashBoard\\DATE\>”下，其中 \<DATE\> 是批处理开始执行时的 ISO 日期。
5.  以下批处理文件可用
    1.  query-20000_All_ELS.bat
        1.  使用 PROD 用户查询“DS Design Revision – Attributes”和 PFF“20000_All_ELS”。查询参数在文件“query-20000_All_ELS.xml”中指定。
        2.  对 ELS DS DesignRevision的 PROD 系统数据执行查询； DE-EA 部门接线状态报告中使用的输出；
    2.  query-20000_All_WDG.bat
        1.  使用 PROD 用户查询“DS Design Revision – Attributes”和 PFF“20000_All_WDG.
        2.  查询参数在文件“query-20000_All_WDG.xml”中指定。
        3.  查询 WDG DS DesignRevision的 PROD 系统数据； DE-EA 部门的接线状态报告中使用的输出。
    3.  query-20000_Valid_redlines.bat
        1.  使用 PROD 用户 OOTB 查询“Dataset…”和 PFF“20000_Valid_redlines”。
        2.  对所有具有标识有效红线数据集的名称和状态的数据集的 PROD 系统数据执行查询；在导出产品结构“export_prod_structure-complete.bat”和“export_prod_structure-ATAChapters.bat”的批次中使用的输出。
    4.  export_prod_structure-complete.bat
        1.  导出 Seastar CD2 的整个产品结构（顶级节点：20000/K），具有 2 条修订规则 DS4_At_Release 和 DS4_Development_Phase（参见 QMP-148.001）； DE-XX 的所有状态报告中使用的输出。
    5.  export_prod_structure-ATAChapters.bat
        1.  导出 Seastar CD2 的所有 ATA 章节（顶级节点：22000/K … 22999/K），带有 2 条修订规则 DS4_At_Release 和 DS4_Development_Phase（参见 QMP-148.001）；用于 DE-XX 的所有状态报告的输出
    6.  ![image1](00e460070fdd444c982c1a855022f313.png)

