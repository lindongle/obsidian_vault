---
title: T4S-SSLHTTPS证书配置
updated: 2026-08-06T10:53:47
created: 2026-07-05T17:04:48
---

1.  备份以下两个文件：\<BGS_ROOT\>/var/conf/tpds.overlay和\<GS_ROOT\>/var/conf/tpds.overlay
2.  证书要求：
    1.  AIG要求使用<span style='color:#FA0000'>\*.pem</span>文件扩展名的X.509 pem编码证书。没有扩展名或扩展名不同的其他文件将不会显示在用户界面中，并且不能在配置期间使用。使用的服务器和客户端证书需要包含<span style='color:#FA0000'>公共证书及其关联的私钥</span>(通常在证书之前插入密钥)。证书文件的<span style='color:#FA0000'>私钥不得加密</span>，因为AIG目前不支持指定密码短语。
    2.  将公钥和私钥证书合并，使用文本打开yapp2021.pem和yapp2021private.pem，将两个文件粘贴到一个文本中，私钥在上，公钥在下，后缀名必须位.pem
![image1](473aeaa13da14de5af94398ba1cb33ae.png)
3.  将证书文件分别放在\<BGS_ROOT\>/var/conf/cert\<和\<GS_ROOT\>/var/conf/cert目录中，以使它们可用于AIG和Admin UI中的配置对话框。--已有证书，跳过上述步骤，到第四步
4.  进入BGS，选择服务器实例，选中ADMIN_UI20，编辑；
![image2](eb91af0baee140ee8f884c8d44be0eb0.png)
5.  找到服务器证书一行，点击后面的编辑按钮；
![image3](92a3031cc84347cd9ad866b2f08447fc.png)

![image4](029d65d9d7da49c39624cca63a7b8dbf.png)
6. 选择刚才合并后的文件（注：加载不到，有最大证书加载条目限制，可以先临时移除0开头的其他证书,删除多了会导致GS登录上无法访问BGS，加载后重启就会全部显示），点击应用，并根据提示立即重启BGS
![image5](46fb124be4584f88b8caa108d7885332.png)
7. 使用https连接时，地址中的地址必须使用域名的方式，如https://plmqas.yapp.com:11320/
8. GS按照上述相同设置
9. <https://plmqas.yapp.com:11321/>
