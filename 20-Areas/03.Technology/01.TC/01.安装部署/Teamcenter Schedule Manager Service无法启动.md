---
title: Teamcenter Schedule Manager Service无法启动
updated: 2026-07-05T17:09:03
created: 2026-07-05T17:09:03
tags:
  - TC安装部署
---

用户名必须是projproxy，在TC中创建改用户，且在tem中安装时，密码必须与tc中该用户的密码一致。

- <span style='font-weight:bold;color:blue;background:white'>Teamcenter Schedule</span><span style='font-weight:bold;color:#333333;background:white'> Manager </span><span style='font-weight:bold;color:blue;background:white'>Service</span><span style='font-weight:bold;color:#333333;background:white'> not starting. </span>
- <span style='font-weight:bold;text-decoration: underline;background:white'>Symptom</span>
- <span style='font-weight:bold;color:blue;background:white'>Teamcenter Schedule Manager Service</span> not starting. Giving below error:  

    

  Windows could not start the <span style='font-weight:bold;color:blue;background:white'>Teamcenter Schedule Management Service</span> on Local  

  ANALYSIS:  

  This <span style='font-weight:bold;color:blue;background:white'>service</span><span style='color:#333333;background:white'> is owned by ProjProxy user. Make sure ProjProxy user is created in Tc organization.</span>
- <span style='font-weight:bold;text-decoration: underline;background:white'>Hardware/Software Configuration</span>
- Platform: INTL64  
  OS: WINDOW  
  OS Version: 2008_R2  
  Product: <span style='font-weight:bold;color:blue;background:white'>TEAMCENTER</span>  
  Application: SCHEDULE_MGR  
  Version: V10.1.7  
  Function: OTHER
- <span style='font-weight:bold;text-decoration: underline;background:white'>Solution</span>
- <span style='color:#333333;background:white'>Create Proproxy user in </span><span style='font-weight:bold;color:blue;background:white'>Teamcenter</span><span style='color:#333333;background:white'> organization and then try to start </span><span style='font-weight:bold;color:blue;background:white'>Teamcenter schedule manager service</span>.  

  This time <span style='font-weight:bold;color:blue;background:white'>service</span><span style='color:#333333;background:white'> should start without any error.</span>

*From \< <https://solutions.industrysoftware.automation.siemens.com/view.php?sort=desc&q=Teamcenter+Schedule+Management+Service&file_type=html&i=002-8001237&k=4&o=0>\>*

- <span style='font-weight:bold;color:blue;background:white'>Schedule Management Service</span><span style='font-weight:bold;color:#333333;background:white'> Fails to start due to login failure.</span>
- <span style='font-weight:bold;text-decoration: underline;background:white'>Symptom</span>
- ---------------  
  <span style='font-weight:bold;color:blue;background:white'>Schedule Management Service</span><span style='color:#333333;background:white'> Fails to start due to login failure.</span>
- <span style='font-weight:bold;text-decoration: underline;background:white'>Hardware/Software Configuration</span>
- Platform: INTL64  
  OS: WINDOW  
  OS Version: 764SP1  

  Family: <span style='font-weight:bold;color:blue;background:white'>TEAMCENTER</span>  
  Application: INSTALL_CONFIG  
  Function: UNDETERMINED  
  Subfunction: ALL  
  Release: V10.1.3.2
- <span style='font-weight:bold;text-decoration: underline;background:white'>Solution</span>
- <span style='color:#333333;background:white'>The projproxy user needs to be manually created post TEM install. The </span><span style='font-weight:bold;color:blue;background:white'>schedule</span>  
  <span style='font-weight: bold;color:blue;background:white'>management service</span> uses only projproxy user for login and subsequent actions.  

  No other user will work for starting the <span style='font-weight:bold;color:blue;background:white'>schedule management service</span>. The  
  projecttrans translator is totally independent of the <span style='font-weight:bold;color:blue;background:white'>schedule management</span>  
  <span style='font-weight: bold;color:blue;background:white'>service</span> and has a totally different purpose.  

  The <span style='font-weight:bold;color:blue;background:white'>schedule management service</span><span style='color:#333333;background:white'> is a daemon that launches workflow on </span><span style='font-weight:bold;color:blue;background:white'>schedule</span>  
  tasks based on the <span style='font-weight:bold;color:blue;background:white'>scheduled</span> start date trigger type whereas the projecttrans  
  is an asynchronous translator required for certain business logic validation  
  invoked from the server. Changing the user in the projecttrans configuration  
  will have no impact on the startup of the <span style='font-weight:bold;color:blue;background:white'>schedule management service</span><span style='color:#333333;background:white'>.</span>

*From \< <https://solutions.industrysoftware.automation.siemens.com/view.php?sort=desc&q=Teamcenter+Schedule+Management+Service&p=2&file_type=html&i=001-7406475&k=0&o=20>\>*

