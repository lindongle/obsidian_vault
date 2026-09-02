---
title: 3D rendering is not enabled for this server
updated: 2026-09-02T16:30:05
created: 2026-07-05T17:04:49
---

- 或对象关系不是Rendering
- See the error in Active Workspace "3D rendering is not enabled for this server".
- Symptom
- Viewing a directmodel dataset shows the error in Active Workspace "3D rendering is not enabled for this server".
![image1](4965a6cea9bd40c1a42c69b368f24941.png)
Use F12 for the Browser. The Console shows the following errors:  

Failed to load viewer : Error: Failed to open model: Failed to connect to server: Not Found  
3D rendering is not enabled for this server.  
Error: Failed to open model: Failed to connect to server: Not Found  
 at I ([http://server:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:27308](http://s:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:27308))  
 at e ([http://](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29427)server[:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29427](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29427))  
 at Anonymous function ([http://](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29737)server[:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29737](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29737))  
 at Anonymous function ([http://](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29873)server[1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29873](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29873))  
 at e ([http://](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29427)server[:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29427](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29427))  
 at Anonymous function ([http://](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29737)server[:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29737](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29737))  
 at Anonymous function ([http://gtac1:3000/assets1576877875060/bundles/bundle.98.js:21:43485](http://gtac1:3000/assets1576877875060/bundles/bundle.98.js:21:43485)) Possibly unhandled rejection: {"description":"Failed to open model: Failed to connect to server: Not Found","stack":"Error: Failed to open model: Failed to connect to server: Not Found\n at I ([http://](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:27308)server[:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:27308](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:27308))\n at e ([http://](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29427)server[:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29427](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29427))\n at Anonymous function ([http://](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29737)server[:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29737](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29737))\n at Anonymous function ([http://](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29873)server[:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29873](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29873))\n at e ([http://](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29427)server[:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29427](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29427))\n at Anonymous function ([http://](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29737)server[:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29737](http://gtac1:3000/assets1576877875060/bundles/bundle.lib.jquery~5c84d373.js:7:29737))\n at Anonymous function ([http://](http://gtac1:3000/assets1576877875060/bundles/bundle.98.js:21:43485)server[:3000/assets1576877875060/bundles/bundle.98.js:21:43485](http://gtac1:3000/assets1576877875060/bundles/bundle.98.js:21:43485))"}  

  

  

Use the Viewer Administration tile for verification:
![image2](c043768d59ec49c78aa13708c13f492c.png)
- Hardware/Software Configuration
- «span style='color:#333333'»Platform: INTL64  
  OS: WINDOWS  
  OS Version: n/a  
  Product: TEAMCENTER  
  Application: ACTIVEWORKSPACE  
  Version: V4.3  
  Function: 3D_VIEWER«/span»
- Solution
- Going back into TEM to modify the configuration for "Visualization Server URL", it appears to succeed but the config.json file does not get updated.  

  Affected file ...\microservices\gateway-1.1.0\\span style='font-weight:bold;color:#333333;background:white'»config.json«/span»
![image3](fde9df2af0d043808ce886f6885cdb0b.png)
The Vis Assigner URL is missing for the "target".  

  

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
- Reference
- PR9656551

*来自 \< <https://solutions.industrysoftware.automation.siemens.com/view.php?sort=desc&p=1&q=3D+rendering+is+not+enabled+for+this+server&file_type=html&i=002-8017159&k=4&o=0>\>*

