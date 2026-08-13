---
title: The usage of the feature key classification_user..
updated: 2026-06-18T13:40:52+08:00
created: 2022-01-14T10:26:26
---

功能部键
当用户启动某个应用程序（例如启动Teamcenter）时，该应用程序将需要某个命名用户许可证（例如teamcenter_author）。席位级或可选模块的许可证从给定的许可证文件中检出，并保留给该特定用户在当月的剩余时间内。

此用户当前是否使用此许可证（登录任何TC应用程序）没有区别。
停用和重新激活用户不会释放此许可证席位级或可选模块。
无法重置当月的license_usage计数。

通常查阅flexlog以查看当前签出的许可证席位级别或可选模块的数量。
这不会反映保留（命名用户）许可证席位级别或可选模块的实际数量，它仅反映当时签出的许可证数量，不反映此类许可证的保留数量。

目前，可选模块许可证上有5个宽限许可证。
（此计数不保证始终存在，是硬编码的，并记录在TC文档中，如下所示：
SiemensPLMSoftware允许少量过度使用。管理员会收到有关过度使用的通知，以便他们可以与其SiemensPLM客户代表一起确定所需的许可证总数并采取适当的步骤。）
不为席位级许可证（作者、消费者等）提供宽限期许可证

createtablePFND0LICENSELOGINTIMES_bakasselect\*fromPFND0LICENSELOGINTIMES
createtablePFND0LICENSEUSAGE_bakasselect\*fromPFND0LICENSEUSAGE

删除两个表的数据（删除前可以备份下）
deletefromPFND0LICENSELOGINTIMES--之前活动的点，改为非活动，重新启用活动，之前活动状态被占用，导致license提示不够。
deletefromPFND0LICENSEUSAGE--处理实名制之前被占用，等一个月才能释放。
重启license服务，重新登录客户端。

