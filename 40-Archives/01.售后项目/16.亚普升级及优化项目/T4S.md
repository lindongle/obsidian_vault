---
title: T4S
updated: 2026-09-02T16:30:07
created: 2026-07-05T17:05:01
---

\#sap connect config

\#sap test \u6211
jco.client.client=300
\#sap\u8D26\u53F7
jco.client.user=plm
\#sap\u8D26\u53F7\u5BC6\u7801 20170523
jco.client.passwd=20170701
\#jco.client.passwd=20170523 DEV
\#jco.client.passwd=20170808 QAS
\#sap\u670D\u52A1\u5668IP\u5730\u5740\uFF0C\u5982\u679C\u662F\u5916\u7F51\u8BBF\u95EE\uFF0C\u5219\u5728\u5185\u7F51IP\u524D\u52A0/H/\u5916\u7F51IP/H/192.168.0.88
jco.client.ashost=172.20.1.213
\#jco.client.ashost=172.20.1.217 DEV
\#jco.client.ashost=172.20.1.212 QAS
\#\u7CFB\u7EDF\u7F16\u53F7
jco.client.sysnr=00
\#\u8BED\u8A00
\#jco.client.lang=ZH
jco.client.lang=EN

目前通过版本号不为01进行变更，但如果历史数据已经到了02版本，且02版本尚未发布，走正式发布流程，不会触发更改单创建，会报错。
