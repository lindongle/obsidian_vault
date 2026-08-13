---
title: linux下设置fsc与vault服务开机启动
updated: 2026-06-06T10:09
created: 2025-07-21T16:44:25
tags:
  - TC安装部署
---

设置fsc为服务：
sudo vi /etc/systemd/system/<span style='color:#FA0000'>teamcenter_fsc.</span>service
\[Unit\]
Description=<span style='color:#FA0000'>Teamcetner FSC Service</span>
After=network.target
\[Service\]
Type=simple
RemainAfterExit=yes
ExecStart=/infodba/Siemens/Teamcenter2412/fsc/<span style='color:#FA0000'>rc.ugs.FSC_1030256_infodba</span> start
ExecStop=/infodba/Siemens/Teamcenter2412/fsc/<span style='color:#FA0000'>rc.ugs.FSC_1030256_infodba</span> stop
\[Install\]
WantedBy=multi-user.target
设置开机启动
systemctl enable <span style='color:#FA0000'>teamcenter_fsc.service</span>
设置vault为服务：
sudo vi /etc/systemd/system/<span style='color:#FA0000'>teamcenter_vault.service</span>
\[Unit\]
Description=<span style='color:#FA0000'>Teamcetner Vault Service</span>
After=network.target
\[Service\]
Type=simple
RemainAfterExit=yes
ExecStart=/infodba/Siemens/Teamcenter2412/tc_vault/<span style='color:#FA0000'>rc.tc.vault_TC</span> start
ExecStop=/infodba/Siemens/Teamcenter2412/tc_vault/<span style='color:#FA0000'>rc.tc.vault \_TC</span> stop
\[lnstall\]
WantedBy=multi-user.target
设置开机启动
systemctl enable <span style='color:#FA0000'>teamcenter_vault.service </span>
<span style='color:#FA0000'></span>
<span style='color:#FA0000'>poolmanager自动服务模板</span>
![image1](0d2730cf1fb94a43a8adba7d6d11265e.png)

![image2](8bd328b5722f41c0b3150761098c375b.png)
<span style='color:#FA0000'></span>
