---
title: 禁用IPV6
updated: 2026-06-05T23:20
created: 2020-06-01T15:19:50
tags:
  - TC安装部署
---

1.禁用IPV6，微软工具设置。
2.设置tcserver自动启动新的，不共享。
3.设置流程拒绝时发邮件给流程发起者或某个用户。添加EPM-notify-report 的-rejection参数
4.将时间表模板PLMXML导出及bmide项目包上传到GTAC
5.日志清理，恢复BMIDE、流程模板及开发包到OOTB环境中测试验证是否可以purge
