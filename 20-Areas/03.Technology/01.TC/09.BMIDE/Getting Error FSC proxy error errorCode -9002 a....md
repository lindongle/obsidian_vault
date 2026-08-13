---
title: Getting Error FSC proxy error errorCode -9002 a...
updated: 2026-07-20T22:29:06+08:00
created: 2026-01-07T18:19:20
---

**Problem**
Getting error Invalid Ticket Validation (FSC) when trying to log into Teamcenter

**Solution**
Verify key is correct for Symmetric key value in symmetric_key_store.jceks file and database using the following steps:
Download and install Keystore Explorer or similar.
-Open jceks file in Keystore Explorer
-Enter the password for the keystore
-Enter the password for the alias
-Note the value of the key
-Run the following command from a Tc Command Prompt
**install_encryptionkeys -u=infodba -p=infodba -g=dba -f=list**
-If values are ==different== then run:
**install_encryptionkeys -u=infodba -p=infodba -g=dba -f=modify** 
and copy the value from Keystore Explorer to the entry on the command lineRestart the FSC and test login

*From \\>*
[获得错误FSC代理错误：“errorCode： -9002 and errorText = ”TICKET_VALIDATION_FAIL_0“”。](https://support.sw.siemens.com/zh-CN/knowledge-base/KB000179243_EN_US)
[KeyStore Explorer - Download](https://keystore-explorer.org/downloads.html)

![image1](ee4b3a5945414d949811c57f44a00870.png)

![image2](255869165eb74dd4b60d7b034385b943.png)

