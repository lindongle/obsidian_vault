---
title: SW集成客户端(基于AWC)
updated: 2026-07-15T16:21:59+08:00
created: 2023-05-16T14:58:40
---

安装SW
![image1](1970b4d18c074c9db1ba1b17bcf407e4.png)

![image2](75b98ed6a85a486781fa9cd91f1af99d.png)

![image3](66d8aac24fa94f7195e1bedcf232e406.png)

![image4](d76a03026f99454885f6bd595edd3180.png)

![image5](e730940771904578aed7836e0b0d3502.png)

安装.net4.8[适用于 Windows 的 Microsoft .NET Framework 4.8 脱机安装程序 - Microsoft 支持](https://support.microsoft.com/zh-cn/topic/%E9%80%82%E7%94%A8%E4%BA%8E-windows-%E7%9A%84-microsoft-net-framework-4-8-%E8%84%B1%E6%9C%BA%E5%AE%89%E8%A3%85%E7%A8%8B%E5%BA%8F-9d23f658-3b97-68ab-d013-aa3c3e7495e0)

![image6](a8a6384e40da400192afb2fcd3c3f8fc.png)
安装SW集成（胖客户端）
安装java，设置环境变量；
![image7](fb8447a76d0c474bad9d4fd7a729f89f.png)

![image8](7ac82df8ff5d40f4aec960f10aeba533.png)

![image9](8352584763264d0ca0eb52e0b83c297b.png)

![image10](8da6e8e150fc4cd79beb57937e69fecb.png)

![image11](e93196650dd34cc2bb3ea07f7b610f3f.png)

![image12](9f3835a29f3c452eb31143877c9444f9.png)
将胖客户端tccs文件夹复制到D:\Siemens\Teamcenter14，如已安装胖客户端，可忽略此步，并添加环境变量FMS_HOME=D:\Siemens\tccs
![image13](97e504b9ed01441b9dbc7302fbd0491b.png)

![image14](126993832405452f9e1e3dcbf1300ea4.png)

![image15](762dd180c05043f3a8120c95123dee57.png)

![image16](e5915bf7930c49c4bb629b41ab421009.png)

![image17](887961eeb32747e79fb90e63b9e7680f.png)

![image18](0ae9b79261934db0935c27a7743777af.png)

![image19](c03580dcb37347e9a96b349ebacb2ff1.png)

![image20](6f24c2c45a2b4aab86a804bef4beb135.png)

![image21](30fd971824924bfbac817ea0c16d9bb4.png)

![image22](6663cd63f658412c90b0ea5c3d6941a8.png)

![image23](ff6c9b1cad6e426cbab4df9a0d3c95f1.png)

（可忽略）配置：tcclientapplauncher
D:\Media\Tc14.0.0.0_wntx64\additional_applications\tcclientapplauncher\tcclientapplauncher.zip，解压并运行step.exe进行安装；
打补丁，将D:\Media\Tc14.1.0_patch_9_wntx64\wntx64\additional_applications\tcclientapplauncher下的压缩文件覆盖到C:\Program Files (x86)\Siemens\Teamcenter\WSLauncheri
![image24](7c20a6f688fb40c0a441198a28e661fd.png)
配置tccs
将已经安装了四层胖客户端下C:\ProgramData\Siemens文件夹拷贝到新客户都安C:\ProgramData\Siemens修改swim下client_swim.properties文件，重启tccs或重启电脑
![image25](f1a74744421843cc98929f0ce119a77e.png)

