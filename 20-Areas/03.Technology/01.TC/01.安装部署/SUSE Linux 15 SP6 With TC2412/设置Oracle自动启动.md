---
title: 设置Oracle自动启动
updated: 2026-09-02T16:30:04
created: 2026-07-05T17:04:40
tags:
  - TC安装部署
---

vim /etc/oratab
tc:/home/infodba/app/oracle/product/19c/db_1:Y \# N改成Y
vim /etc/systemd/system/oracle.service，写入以下内容
\[Unit\]
Description=Oracle Database and Listener
After=network.target

\[Service\]
Type=forking
User=infodba
Group=oinstall
\# 显式设置环境变量（避免依赖.bash_profile）
Environment="ORACLE_HOME=/home/infodba/app/oracle/product/19c/db_1/"
Environment="ORACLE_SID=tc"
Environment="PATH=/usr/local/bin:/usr/bin:/bin:/home/infodba/app/oracle/product/19c/db_1//bin"

ExecStartPre=/bin/bash -c "/home/infodba/app/oracle/product/19c/db_1/bin/lsnrctl status \|\| /home/infodba/app/oracle/product/19c/db_1/bin/lsnrctl start"
ExecStart=/bin/bash -c "/home/infodba/app/oracle/product/19c/db_1/bin/dbstart /home/infodba/app/oracle/product/19c/db_1"
ExecStop=/bin/bash -c "/home/infodba/app/oracle/product/19c/db_1/bin/lsnrctl stop &&/home/infodba/app/oracle/product/19c/db_1/bin/dbshut /home/infodba/app/oracle/product/19c/db_1"

Restart=on-abort
TimeoutSec=300

\[Install\]
WantedBy=multi-user.target

\# 重新加载并启动服务
sudo systemctl daemon-reload
sudo systemctl stop oracle.service \# 确保停止残留进程
\# sudo pkill -9 -u oracle -f "ora\_" \# 强制清理Oracle相关进程
sudo systemctl start oracle.service
sudo systemctl enable oracle.service \# 设置开机自启
sudo systemctl status oracle.service

