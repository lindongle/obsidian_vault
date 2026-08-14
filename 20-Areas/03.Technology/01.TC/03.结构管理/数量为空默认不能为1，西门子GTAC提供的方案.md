---
title: 数量为空默认不能为1，西门子GTAC提供的方案
updated: 2026-06-13T22:12:21
created: 2026-07-05T17:04:41
tags:
  - bom
  - awc
  - BOM
---

- <span style='font-weight:bold;background:white'>How to configure column to see Quantity 1 instead null for BOMLine</span>
- <span style='font-weight:bold;text-decoration: underline;background:white'>Symptom</span>
- «span style='color:#333333'»The value of Quantity is blank in Structure Manager when it is equal to '1'.  

  The value of Quantity in Structure Manager is blank when it is equal to '1'. This is as Design.  

    

  User will expect the quantity equals 1 even the UOM is 'each'. Otherwise, if the SM is exported to excel, the blank doesn't mean anything.  

    

  Currently UOM value is blank if quantity is equal to 1 in Structure Manager. This is As Design  

    

  Looking into a stable solution to populate the quantity as '1' instead of blank values, when exporting out of Tc.«/span»
- <span style='font-weight:bold;text-decoration: underline;background:white'>Hardware/Software Configuration</span>
- «span style='color:#333333'»Platform: INTEL  
  OS: WINDOW  
  OS Version: 2008  
  Product: TEAMCENTER  
  Application: STRUCTURE_MGR  
  Version: V11.3.0  
  Function: PS_EDITING«/span»
- <span style='font-weight:bold;text-decoration: underline;background:white'>Solution</span>
- <span style='color:#333333;background:white'>There is another Property name "</span><span style='font-weight:bold;color:blue;background:white'>bl_real_quantity</span>" This is Internal Name  
  and Display name is "Real Quantity"  

  User has to set this property visible in BMIDE for BOMLine.  
  Refer below image for configuration.
- ![image1](768476f061894a6cb5f0f7926203a737.png)
<span style='color:#333333'></span>
«span style='color:#333333'»Deploy this BMIDE changes to Teamcenter Database.  

Login to RAC and check the Column in Structure Manager.«/span»
- ![image2](365295c0cef04c8089943a5963c99d1f.png)
- <span style='font-weight:bold;text-decoration: underline;background:white'>Reference</span>
- <span style='background:white'>9328220</span>

*来自 \< <https://solutions.industrysoftware.automation.siemens.com/view.php?sort=desc&p=1&q=bl_real_quantity&file_type=html&i=002-8007359&k=0&o=0>\>*
