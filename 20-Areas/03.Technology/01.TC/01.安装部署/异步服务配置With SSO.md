---
title: 异步服务配置With SSO
updated: 2026-07-31T10:03:25+08:00
created: 2018-08-14T14:40:29
tags:
  - TC安装部署
---

一、配置异步服务
1、通过tem，在dispatcher服务中安装模块异步服务。
打开model下的conf文件夹中的translator.xml中异步服务是否开启。
![image1](c38b660da41f4c2c9bba2a5e6201ba02.png)
2、在组织模块-站点，选择站点，在SOA URL中填写四层连接地址，如http://172.16.254.41:7001/tc/
<span style='background:white'>二、首选项配置：（流程异步，只设置最后一个即可）</span>
1、 设置订阅可以勾选后台允许： c.ASYNC_subscribe_to_background_task=BOTH  
设置订阅可用： d.TC_subscription=ON  
设置邮箱服务器名称，便于异步完成后邮件通知。 e.Mail_server_name= your mail server value  
设置通知的内容，可以自定义f.TC_notification_msg_ext= tmp change it to txt  
设置流程任务可以出现后台处理的勾选框。 g.EPM_task_execution_mode value is “CONFIGURABLE”
<span style='background:white'>三、验证：</span>
<span style='color:black'>1、将item版本发送到结构管理，选择文件-复制，勾选后台允许，看是否dispatcher能转换成功。</span>
<span style='background:white'>四、配置流程</span>
<span style='color:black'>1、在需要后台执行的任务，右键勾选后台处理。</span>
<span style='color:black'></span>
<span style='font-weight:bold;background:white'>如果有单点登录，需要单独进行配置。</span>
<span style='color:black'>1、必须存在与windows用户名相同的TC账号。</span>
2、修改D:\Apps\Dispatcher\Module\Translators\asyncservice\asyncservice.bat文件
![image2](022ec970834b4782b72b2c827b81fe97.png)
注释掉相关SSO的三行或删掉。
添加dispatch转换的用户名及密码。
3、修改dispatch登录sso时间及尝试次数。
utility中执行：
preferences_manager -u=infodba -p=Luster2023 -g=dba -mode=import -preference=ASYNC_connection_retries -scope=SITE -values=1 -action=OVERRIDE
preferences_manager -u=infodba -p=Luster2023 -g=dba -mode=import -preference=ASYNC_connection_retry_interval -scope=SITE -values=10 -action=OVERRIDE
4、SSO中设置mediator password。
1）运行D:\Siemens\TcSecurityServices11.4\insweb.bat，编辑tcssoservice，修改关联参数，编辑参数mediatorPassword值为pdm_1234
![image3](86e1901186cc46ecb6fb6fd81494c177.png)
2）utility中执行install_encryptionkeys -u=infodba -p=pdm_1234 -g=dba -f=install_mediator_key，执行后，会提示输入mediatorPassword，直接输入pdm_1234，完成。
![image4](13b5f1436fca42069f366cbfebd0bda1.png)
5、修改异步服务连接SSO的缓存时间
修改首选项ASYNC_credentials_lifetime，默认为一周，单位为秒，可以设置62208000，即720天，不能超过两年。
6、新建异步SSOAPPid.
运行D:\Siemens\TcSecurityServices11.4\insweb.bat，编辑tcssoservice，修改表-application registry
添加一行。Application ID必须以Async结尾。
![image5](4b11807a3c1747b7b91e3c1bd66e948c.png)
7、设置SSO-applicationID的首选项
新建首选项TC_SSO_app_id_of_site_IMC-0012932，前面固定，后面为站点的名称。首选项的值为上述6中设置的appid，即Tc11SSOAsync

完成设置后，进入weblogic控制台，更新tcssoservice。重启dispatcher三个服务。
