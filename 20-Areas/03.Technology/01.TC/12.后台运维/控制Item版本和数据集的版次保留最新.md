---
title: 控制Item版本和数据集的版次保留最新
updated: 2026-06-05T23:24:34
created: 2026-07-05T17:04:47
---

TCDefaultKeepLimitByType 值改为ItemRevision 1 --控制某类型版本限制，类型不继承，且清理无效，必须新建的数据有效
TCDefaultKeepLimit值改为1 ---上面类型缺省时的默认控制
AE_dataset_default_keep_limit 值改为1 ---数据集版次的控制

--重启客户端，且新创建的对象有效。
