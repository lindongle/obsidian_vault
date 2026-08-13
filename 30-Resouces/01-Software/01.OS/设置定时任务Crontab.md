---
title: 设置定时任务Crontab
updated: 2026-06-06T10:05
created: 2018-12-06T13:57:17
---

1、Crontab语法：使用root用户创建
crontab \[-u username\] \[-l\|-e\|-r\]

参数：

-u: 只有root才能进行这个任务，也即帮其他用户新建/删除crontab工作调度;

-e: 编辑crontab 的工作内容;

-l: 查阅crontab的工作内容;

-r: 删除所有的crontab的工作内容，若仅要删除一项，请用-e去编辑。
2、创建定时任务：
输入crontab -e，然后输入I，进行编辑，编辑完成后输入ESC，再输入:wq保存退出。
内容格式：
0 12 \* \* \* mail dmtsai -s "at 12:00" \< /home/dmtsai/.bashrc
![image1](c9d10bf8cf564a8a8705053c8fd118f7.png)

![image2](ed229e5d92844b31994fcc0581318bb2.png)
00 22 \* \* \* /plmdata/backup/tc_oracle_backup.sh
每天22点执行tc_oracle_backup.sh脚本
00 00 \* \* 6 /plmdata/backup/backup.sh
每周六00点执行backup.sh

修改后重启：
Service crond restart

