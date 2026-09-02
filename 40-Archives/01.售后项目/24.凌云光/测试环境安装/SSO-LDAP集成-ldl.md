---
title: SSO-LDAP集成-ldl
updated: 2026-09-02T16:30:07
created: 2026-07-05T17:05:04
---

1.  找到安装介质：D:\Media\Tc14.1.0_patch_9_wntx64\wntx64\additional_applications\sso
2.  将TcSecurityServices14.1_20230221.zip，解压放到D:\Siemens
3.  新建文件夹D:\Siemens\SecurityServices，将解压后文件夹中的default和ZH_CN两个文件夹的内容粘贴到到新建目录D:\Siemens\SecurityService中
![image1](709e5bcc814d44e8bfce716bdc7b7bbc.png)
4.  先后顺序双击并解压INSTALL_TCWEB.exe、INSTALL_SSO.exe、INSTALL_SSO_ZH_CN.exe到当前目录
![image2](d33e6d1ad03b4109a2692c47a88d3e2a.png)
5.  运行刚解压出的D:\Siemens\SecurityService\insweb.bat，添加如下解决方案；
![image3](9a3a9918b0f74260bf3f33e6473aca7f.png)
6.  修改以下参数；
![image4](b410d3c0fceb4ab78df1b19c2b5bb407.png)
如果多台LDAP，以下参数设置为true
![image5](daace31a4cac4778ac62bce2e13139e7.png)

![image6](7241faa3903c408f88d08d48f779289a.png)

![image7](35b64078252443618ac9891f62f9041f.png)

![image8](1684730f4f8f49fe90c2d3fa011e77b9.png)

![image9](627c392e09d842f883993709819dd6a1.png)

![image10](1b64505c00c545c48865f2ce80a0d45a.png)
下图appid根据实际情况修改
![image11](062aef7e6c094c439b14bd8be3739687.png)
修改war名称：
![image12](6461496f6d184a4987456fc2bdb59da0.png)

![image13](f076b0becf59476da95f8bdc4b1819e6.png)

安装安全代理，直接执行D:\Media\sso\install.exe
修改tc_profiles
set TC_SSO_LOGIN_PAGE=http://tcqas.lusterinc.com:8080/tcssols/sa/weblogin/login_redirect
![image14](89b820d6789640979dae09d62a818648.png)
将两个war包放到tomcat下，与tc.war同级目录，重启tomcat
测试：
<http://tcqas.lusterinc.com:8080/tcssols/sa>
![image15](238502817be642dda757b98cb8f43493.png)
输入域账号及密码，弹出以下界面说明测试成功；
![image16](5778a433357f40d4a8c435ba7393d51b.png)
修改tc.war
![image17](b5fe4289d68e4a77aea140a276e70ae9.png)

![image18](3ce65c54dc5d4777aa53b77aa5a82d44.png)

![image19](5d70604d16ee4dcfba0eb4bfe64b60c8.png)
<http://tcqas.lusterinc.com:8080/tcssols/sa>
<http://tcqas.lusterinc.com:8080/tcssoservice>
TCSSOLoginService为webtier参数中的值，密码需要域账号的密码
下图/sa不是//sa
![image20](006aff6b994445fd8fa578aad826307c.png)

AWC的单点登录配置：
新增一个appid，
![image21](1d0243465c034b37aaaccdfd876a42cf.png)
![image22](0ecc3ab26fa64c2e8ef57e97c12dedb1.png)

![image23](2b0ee8aae8f5432794518f044cfd5986.png)
单独TCCS登录的需要将下面地址的/sa改为/tccs，如果安装胖客户端则使用/sa
![image24](c9cc15ffc0064b2d8c262cd6150d7b71.png)

![image25](475be97fab4e45038bb8ef8f1f2cbe0a.png)
修改以下内容
![image26](b906cdaded684e699a2d3dabc022fb27.png)

Application Registry增加TCAW条目 url为AW的连接地址http://hostname:3000
![image27](deac8a45770045d58cc79c117aa0dac3.png)
在tc_profilevars.bat文件的TC_SSO_APP_ID中增加TCAW
![image28](39a90d88ae394ba5972b199c266e4054.png)
TEM中AW gateway对TcSS的URL配置使用跟TC一样的，而Application ID使用TCAW
![image29](542fbd6a44714b74a56edf40cf80b3b2.png)

*来自 \< <https://support.sw.siemens.com/zh-CN/support-case/details/ed8c4100-fa46-11ed-81e0-0969a35a812f>\>*

客户端需要安装安全代理（sa）
![image30](f2bb1e539f164ae4b8026631712cb11c.png)

