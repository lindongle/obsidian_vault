---
title: linux下设置fsc与vault服务开机启动
updated: 2026-09-02T16:30:04
created: 2026-07-05T17:04:38
tags:
  - TC安装部署
---

设置fsc为服务：
sudo vi /etc/systemd/system/teamcenter_fsc.service
\[Unit\]
Description=Teamcetner FSC Service
After=network.target
\[Service\]
Type=simple
RemainAfterExit=yes
ExecStart=/infodba/Siemens/Teamcenter2412/fsc/rc.ugs.FSC_1030256_infodba start
ExecStop=/infodba/Siemens/Teamcenter2412/fsc/rc.ugs.FSC_1030256_infodba stop
\[Install\]
WantedBy=multi-user.target
设置开机启动
systemctl enable teamcenter_fsc.service
设置vault为服务：
sudo vi /etc/systemd/system/teamcenter_vault.service
\[Unit\]
Description=Teamcetner Vault Service
After=network.target
\[Service\]
Type=simple
RemainAfterExit=yes
ExecStart=/infodba/Siemens/Teamcenter2412/tc_vault/rc.tc.vault_TC start
ExecStop=/infodba/Siemens/Teamcenter2412/tc_vault/rc.tc.vault \_TC stop
\[lnstall\]
WantedBy=multi-user.target
设置开机启动
systemctl enable teamcenter_vault.service 

poolmanager自动服务模板
![image1](0d2730cf1fb94a43a8adba7d6d11265e.png)

![image2](8bd328b5722f41c0b3150761098c375b.png)

