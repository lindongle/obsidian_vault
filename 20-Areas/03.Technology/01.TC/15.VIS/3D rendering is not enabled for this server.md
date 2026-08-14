---
title: 3D rendering is not enabled for this server
updated: 2026-06-22T09:03:48
created: 2026-07-05T17:04:49
---

- <span style='color:red'>或对象关系不是Rendering</span>
- <span style='font-weight:bold;color:#333333;background:white'>See the error in Active Workspace "</span><span style='font-weight:bold;color:blue;background:white'>3D rendering is not enabled for this server</span><span style='font-weight:bold;color:#333333;background:white'>".</span>
- <span style='font-weight:bold;text-decoration: underline;background:white'>Symptom</span>
- <span style='color:#333333;background:white'>Viewing a directmodel dataset shows the error in Active Workspace "</span><span style='font-weight:bold;color:blue;background:white'>3D rendering</span><span style='font-weight:bold;color:#333333;background:white'> is not </span><span style='font-weight:bold;color:blue;background:white'>enabled</span><span style='font-weight:bold;color:#333333;background:white'> for this </span><span style='font-weight:bold;color:blue;background:white'>server</span>".
![image1](4965a6cea9bd40c1a42c69b368f24941.png)
Use F12 for the Browser. The Console shows the following errors:  

Failed to load viewer : Error: Failed to open model: Failed to connect to <span style='font-weight:bold;font-size:9.0pt;color:blue;background:white'>server</span>: Not Found  
<span style='font-weight:bold;font-size:9.0pt;color:blue;background:white'>3D rendering</span><span style='font-size:9.0pt;color:#333333;background:white'> is not </span><span style='font-weight:bold;font-size:9.0pt;color:blue;background:white'>enabled</span><span style='font-size:9.0pt;color:#333333;background:white'> for this </span><span style='font-weight:bold;font-size:9.0pt;color:blue;background:white'>server</span>.  
Error: Failed to open model: Failed to connect to <span style='font-weight:bold;font-size:9.0pt;color:blue;background:white'>server</span>: Not Found  
 at I ([<span style='font-size:8.25pt;background:white'>http://</span><span style='font-weight: bold;font-size:8.25pt;background:white'>server</span><span style='font-size: 8.25pt;background:white'>:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:27308</span>](http://s:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:27308))  
 at e ([<span style='font-size:8.25pt;background:white'>http://</span>](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29427)<span style='font-weight:bold;font-size:9.0pt;color:blue;background:white'>server</span>[<span style='font-size:8.25pt;background:white'>:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29427</span>](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29427))  
 at Anonymous function ([<span style='font-size:8.25pt;background:white'>http://</span>](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29737)<span style='font-weight:bold;font-size:9.0pt;color:blue;background:white'>server</span>[<span style='font-size:8.25pt;background:white'>:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29737</span>](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29737))  
 at Anonymous function ([<span style='font-size:8.25pt;background:white'>http://</span>](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29873)<span style='font-weight:bold;font-size:9.0pt;color:blue;background:white'>server</span>[<span style='font-size:8.25pt;background:white'>1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29873</span>](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29873))  
 at e ([<span style='font-size:8.25pt;background:white'>http://</span>](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29427)<span style='font-weight:bold;font-size:9.0pt;color:blue;background:white'>server</span>[<span style='font-size:8.25pt;background:white'>:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29427</span>](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29427))  
 at Anonymous function ([<span style='font-size:8.25pt;background:white'>http://</span>](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29737)<span style='font-weight:bold;font-size:9.0pt;color:blue;background:white'>server</span>[<span style='font-size:8.25pt;background:white'>:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29737</span>](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29737))  
 at Anonymous function ([<span style='font-size:8.25pt;background:white'>http://gtac1:3000/assets1576877875060/bundles/bundle.98.js:21:43485</span>](http://gtac1:3000/assets1576877875060/bundles/bundle.98.js:21:43485)<span style='font-size:9.0pt;color:#333333;background:white'>) Possibly unhandled rejection: {"description":"Failed to open model: Failed to connect to </span><span style='font-weight:bold;font-size:9.0pt;color:blue;background:white'>server</span><span style='font-size:9.0pt;color:#333333;background:white'>: Not Found","stack":"Error: Failed to open model: Failed to connect to </span><span style='font-weight:bold;font-size:9.0pt;color:blue;background:white'>server</span><span style='font-size:9.0pt;color:#333333;background:white'>: Not Found\n at I (</span>[<span style='font-size:8.25pt;background:white'>http://</span>](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:27308)<span style='font-weight:bold;font-size:9.0pt;color:blue;background:white'>server</span>[<span style='font-size:8.25pt;background:white'>:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:27308</span>](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:27308)<span style='font-size:9.0pt;color:#333333;background:white'>)\n at e (</span>[<span style='font-size:8.25pt;background:white'>http://</span>](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29427)<span style='font-weight:bold;font-size:9.0pt;color:blue;background:white'>server</span>[<span style='font-size:8.25pt;background:white'>:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29427</span>](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29427)<span style='font-size:9.0pt;color:#333333;background:white'>)\n at Anonymous function (</span>[<span style='font-size:8.25pt;background:white'>http://</span>](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29737)<span style='font-weight:bold;font-size:9.0pt;color:blue;background:white'>server</span>[<span style='font-size:8.25pt;background:white'>:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29737</span>](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29737)<span style='font-size:9.0pt;color:#333333;background:white'>)\n at Anonymous function (</span>[<span style='font-size:8.25pt;background:white'>http://</span>](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29873)<span style='font-weight:bold;font-size:9.0pt;color:blue;background:white'>server</span>[<span style='font-size:8.25pt;background:white'>:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29873</span>](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29873)<span style='font-size:9.0pt;color:#333333;background:white'>)\n at e (</span>[<span style='font-size:8.25pt;background:white'>http://</span>](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29427)<span style='font-weight:bold;font-size:9.0pt;color:blue;background:white'>server</span>[<span style='font-size:8.25pt;background:white'>:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29427</span>](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29427)<span style='font-size:9.0pt;color:#333333;background:white'>)\n at Anonymous function (</span>[<span style='font-size:8.25pt;background:white'>http://</span>](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29737)<span style='font-weight:bold;font-size:9.0pt;color:blue;background:white'>server</span>[<span style='font-size:8.25pt;background:white'>:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29737</span>](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29737)<span style='font-size:9.0pt;color:#333333;background:white'>)\n at Anonymous function (</span>[<span style='font-size:8.25pt;background:white'>http://</span>](http://gtac1:3000/assets1576877875060/bundles/bundle.98.js:21:43485)<span style='font-weight:bold;font-size:9.0pt;color:blue;background:white'>server</span>[<span style='font-size:8.25pt;background:white'>:3000/assets1576877875060/bundles/bundle.98.js:21:43485</span>](http://gtac1:3000/assets1576877875060/bundles/bundle.98.js:21:43485))"}  

  

  

Use the Viewer Administration tile for verification:
![image2](c043768d59ec49c78aa13708c13f492c.png)
- <span style='font-weight:bold;text-decoration: underline;background:white'>Hardware/Software Configuration</span>
- «span style='color:#333333'»Platform: INTL64  
  OS: WINDOWS  
  OS Version: n/a  
  Product: TEAMCENTER  
  Application: ACTIVEWORKSPACE  
  Version: V4.3  
  Function: 3D_VIEWER«/span»
- <span style='font-weight:bold;text-decoration: underline;background:white'>Solution</span>
- <span style='color:#333333;background:white'>Going back into TEM to modify the configuration for "</span><span style='font-weight:bold;color:#333333;background:white'>Visualization </span><span style='font-weight:bold;color:blue;background:white'>Server</span><span style='font-weight:bold;color:#333333;background:white'> URL</span><span style='color:#333333;background:white'>", it appears to succeed but the </span><span style='font-weight:bold;color:blue;background:white'>config.json</span> file does not get updated.  

  Affected file ...\microservices\gateway-1.1.0\\span style='font-weight:bold;color:#333333;background:white'»config.json«/span»
![image3](fde9df2af0d043808ce886f6885cdb0b.png)
<span style='background:white'>The </span><span style='font-weight:bold;background: white'>Vis Assigner URL </span>is missing for the "target".  

  

Check in TEM for "Update Gateway Client settings" the correct Vis Assigner URL:
![image4](7c6a785cc1be4c809484f309e7cfb821.png)

![image5](4c8295b246cf48dc8d8d8cf7734e1c80.jpg)
«span style='color:#333333'»Edit manually the config.json file.  
Modify the entry for the "target" and add the Vis Assigner URL  

  

«/span»
![image6](a8b671a5c11949a9b18dcbc00105520c.jpg)
«span style='color:#333333'»Restart Microservice Service and restart Vis Assigner and Vis Pool Manager.  

  

  

  

To verify the Visualization in Active Workspace us the "Viewer Administration" tile :«/span»
![image7](44076dc8dcd54f8e99c026e9aa5b5250.jpg)
- <span style='font-weight:bold;text-decoration: underline;background:white'>Reference</span>
- <span style='background:white'>PR</span><span style='font-weight:bold;background: white'>9656551</span>

*来自 \< <https://solutions.industrysoftware.automation.siemens.com/view.php?sort=desc&p=1&q=3D+rendering+is+not+enabled+for+this+server&file_type=html&i=002-8017159&k=4&o=0>\>*

