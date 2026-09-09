---
title: HTTPS
updated: 2026-06-06T10:08
created: 2021-04-14T10:08:18
tags:
  - TC安装部署
---

NODE_EXTRA_CA_CERTS=C:\cert.pem
<span style='color:red'>如果有一个证书链（如三层），那么一定要在.pem文件中包括整个证书链（即导出每层证书的pem，然后粘贴到一个文本中）</span>
<span style='color:red'>按以下方式，每层证书均导出pem文件后（导出的默认为cer，可以直接修改后缀），然后将三个粘贴到一块（最底层不粘贴也可以）</span>
![image1](93ae9d7eb9254ad0ba6496e47731660b.png)

![image2](3330aa5456654d73ac431239bc7cfa4f.png)

![image3](ca31871de69a4e128a220231e89d2461.png)
<span style='color:red'></span>
<span style='color:red'>不加上面环境变量可能导致以下问题：</span>
![image4](2778e04c1f6c4c68ad61446408cdbbfd.png)
打开包含自签名证书的“密钥库”。在本文档中，密钥库文件名为“keystore”：
![image5](ba756948605340f18acc3d12bc5d2e71.png)
-选择密钥对证书，\<Right mouse button\>，导出，导出私钥
-选择“OpenSSL”选项
![image6](635493868e564e1cb2f27b8115f4c0ff.png)
-取消选中“加密”选项。
-确保选择了“PEM”选项
-为导出的文件名提供一个名称。
![image7](663b42cf54a146c094e7ef1d8a9f4c2a.png)

<span style='color:red'>公钥必须通过以下方式取到，但必须只针对最底层证书导出pem，不能通过上面方式直接导出为公钥。</span>
![image1](93ae9d7eb9254ad0ba6496e47731660b.png)

![image2](3330aa5456654d73ac431239bc7cfa4f.png)

![image3](ca31871de69a4e128a220231e89d2461.png)
<span style='color:red'></span>
![image8](0b1cdce83d334a3e8bd24a47b140985b.png)

![image9](e6e192b333f04fe9943d4443b3b814f0.png)
<span style='color:red'>配置为域名，如果未加域，可以加host将ip指向任意一个已经存在的域名，会优先读取host而不是域名解析服务器；</span>
<span style='color:red'></span>
<span style='color:red'>officeonline对应配置：</span>
1.  准备X.509格式的证书文件，XXX.pfx
2.  D:\Siemens\Teamcenter13\microservices\tcooweb_service-2.0.0\TcOOWeb\appsettings.json中调整以下内容
<span style='color:#FA0000'> </span>
<span style='color:#FA0000'>"Kestrel":</span> {
"Endpoints": {
"Https": {
"Url": " <https://*:0>",
"Certificate":{
"Path": "certificates/Yapp2021.pfx"
}
}
},
"Certificates":{
"Default":{
"AllowInvalid": true
}
}
},
<span style='color:#FA0000'>Cd /d 到D:\Siemens\Teamcenter13\microservices\tcooweb_service-2.0.0\TcOOWeb，执行以下命令将密文解密：</span>
JsonSettingsConfigUtility -decode JsonSettingsConfig.json
3.  «span style='font-family:"Microsoft YaHei"'»在«/span»<span style='font-family:Calibri'>appsettings.Security.json</span>«span style='font-family:"Microsoft YaHei"'»文件中添加«/span»<span style='font-family: Calibri;color:#FA0000'>Kestrel</span>«span style='font-family:"Microsoft YaHei"; color:#FA0000'»，存储证书密码«/span»
"Kestrel":{ "Endpoints":{ "Https":{ "Certificate":{ "Password": "Yapp2021" } } } }

,
"Kestrel": {
"Endpoints": {
"Https": {
"Certificate": {
"Password": "Yapp2021"
}
}
}
}

1.  注册：
JsonSettingsConfigUtility -generateConfigFile JsonSettingsConfig.json appsettings.Security.json TcSecurity Kestrel
2.  加密：JsonSettingsConfigUtility -encode JsonSettingsConfig.json
3.  在D:\Siemens\Teamcenter13\microservices\tcooweb_service-2.0.0\TcOOWeb新建文件夹，名为certificates，复制pfx文件到该文件夹中。
4.  重启服务；
---
OfficeOnline的https配置，先将证书导入系统，找到pfx文件双击运行即可，找到其友好名称作为CertificateName 参数的值
运行：
New-OfficeWebAppsFarm -InternalUrl " <https://officeonline.yapp.com>" -ExternalUrl " <https://officeonline.yapp.com>" -CertificateName "Yapp2021"
