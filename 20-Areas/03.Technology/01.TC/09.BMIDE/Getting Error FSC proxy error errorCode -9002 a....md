---
title: 'Getting Error FSC proxy error: "errorCode: -9002 a...'
updated: 2026-06-06T10:08
created: 2026-01-07T18:19:20
---

<span style='color:#373A3C'>**Problem**</span>
<span style='color:#373A3C'>Getting error Invalid Ticket Validation (FSC) when trying to log into Teamcenter</span>
<span style='color:#373A3C'></span>
<span style='color:#373A3C'>**Solution**</span>
<span style='color:#373A3C'>Verify key is correct for Symmetric key value in symmetric_key_store.jceks file and database using the following steps:</span>
<span style='color:#373A3C'>Download and install Keystore Explorer or similar.</span>
<span style='color:#373A3C'>-Open jceks file in Keystore Explorer</span>
<span style='color:#373A3C'>-Enter the password for the keystore</span>
<span style='color:#373A3C'>-Enter the password for the alias</span>
<span style='color:#373A3C'>-Note the value of the key</span>
<span style='color:#373A3C'>-Run the following command from a Tc Command Prompt</span>
<span style='color:#373A3C'>install_encryptionkeys -u=infodba -p=infodba -g=dba -f=list</span>
<span style='color:#373A3C'>-If values are different then run:</span>
<span style='color:#373A3C'>install_encryptionkeys -u=infodba -p=infodba -g=dba -f=modify and copy the value from Keystore Explorer to the entry on the command lineRestart the FSC and test login</span>

*From \< <https://support.sw.siemens.com/zh-CN/knowledge-base/KB000179243_EN_US>\>*

[KeyStore Explorer - Download](https://keystore-explorer.org/downloads.html)

![image1](ee4b3a5945414d949811c57f44a00870.png)

![image2](255869165eb74dd4b60d7b034385b943.png)

