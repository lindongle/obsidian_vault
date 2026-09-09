---
title: 安装GS
updated: 2026-08-06T10:48:55
created: 2026-07-05T17:04:48
---

1、启动安装脚本：E:\TC\01.Installer\T4S\\**Teamcenter_Gateway_for_SAP_18.2_install_and_patch_tool\t4x_install_and_patch_tool\\\_\_installer.bat**
![image1](62128b61adc54409a17b36a84f7be28f.png)

![image2](6a7d31286c8b4bf2b35d308c6c44f932.png)

![image3](2e6df59be3864c91a26e1c5dcb890bf7.png)

![image4](a6b66aa6ad574f568e52e93767895137.png)

![image5](32990cabf1054d4499d78dc661caca5e.png)

![image6](9d616912ef1142d4a2dc5ed930c4562a.png)
输入TC_ROOT的路径。
![image7](317512397445442d833e3a5d9e1d2c34.png)
不要跟BGS安装到同一个目录，最好分到两台服务器上。BGS单独一台服务器。
![image8](b1eb05fb97514669977fafc15b495c34.png)

![image9](8948821639ee4fc8971b667029562431.png)
输入BGS服务所在的主机名或IP及BGS的端口号。
![image10](2ac7cb447e8b4fae934743274168aec3.png)

![image11](6854c40e64034751b2e50d530fe8234f.png)

![image12](9b5a4b3996d94f5aba798100a01aca02.png)

修改E:\T4x_GS\etc\t4xcust.bat，注释去掉，确认路径是否正确。
![image13](03f6b9387d2a42139a8513fef10e6198.png)
启动GS服务报错，E:\T4x_GS\bin64\restart.exe
![image14](aa82111f546444d29c3b58dfe6bcedc3.png)
需要到SAP软件中心下载所需库文件（
\- Windows: sapnwrfc.dll, libicudecnumber.dll and libsapucum.dll
\- Unix: sapnwrfc.so, libicudecnumber.so and libsapucum.so
\- sapjco3.dll -\> bin32 or bin64
\- sapjco3.pdb -\> bin32 or bin64
\- sapjco3.jar -\> lib

）。需要SAP。需要哪些库文件，参考E:\T4x_GS\bin64\readme.sapnwrfclib，将sapnwrfc.dll, libicudecnumber.dll and libsapucum.dll、sapjco3.dll 、sapjco3.pdb放到E:\T4x_GS\bin64中，将sapjco3.jar放到E:\T4x_GS\lib下
![image15](bcefd0e42e6e4d51900d0d2166ce610f.png)
