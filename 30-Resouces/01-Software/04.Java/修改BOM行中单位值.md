---
title: 修改BOM行中单位值
updated: 2026-06-13T22:08:52
created: 2026-07-05T17:04:54
tags:
  - Java
---

- <span style='font-weight:bold;color:#333333;background:white'>How to set </span><span style='font-weight:bold;color:blue;background:white'>unit of measure</span><span style='font-weight:bold;color:#333333;background:white'> on </span><span style='font-weight:bold;color:blue;background:white'>BOMLine</span><span style='font-weight:bold;color:#333333;background:white'> and released item using RAC cust</span>
- <span style='font-weight:bold;text-decoration: underline;background:white'>Symptom</span>
- ---------------  
  User want to set <span style='font-weight:bold;color:blue;background:white'>unit</span><span style='color:#333333;background:white'> of </span><span style='font-weight: bold;color:blue;background:white'>measure</span> on already present item (released or  
  unreleased) and also want to set <span style='font-weight:bold;color:blue;background:white'>unit</span><span style='color:#333333;background:white'> of </span><span style='font-weight: bold;color:blue;background:white'>measure</span><span style='color:#333333; background:white'> on </span><span style='font-weight:bold;color:blue; background:white'>BOMLine</span> using Rich client  
  customization or using SOA customization(Rich client is priority)  

  How to set <span style='font-weight:bold;color:blue;background:white'>unit</span><span style='color:#333333;background:white'> of </span><span style='font-weight: bold;color:blue;background:white'>measure</span><span style='color:#333333; background:white'> on </span><span style='font-weight:bold;color:blue; background:white'>BOMLine</span> and released item using RAC  
  customization.
- <span style='font-weight:bold;text-decoration: underline;background:white'>Hardware/Software Configuration</span>
- «span style='color:#333333'»PLATFORM: INTL64 OPERATING SYSTEM: WINDOW  
  OS VERSION: 764 PRODUCT VERSIONS: Tc 11.2.2«/span»
- <span style='font-weight:bold;text-decoration: underline;background:white'>Solution</span>
- <span style='color:#333333;background:white'>bl_sequence, </span><span style='font-weight:bold;color:blue;background:white'>quantity</span><span style='color:#333333;background:white'> and UOM (</span><span style='font-weight: bold;color:blue;background:white'>unit</span><span style='color:#333333; background:white'> of </span><span style='font-weight:bold;color:blue; background:white'>measure</span>) are some special properties,  
  probably there is an event which update the RAC when modifying the property.  

  Use "setProperties" method of the datamanagementService to set the UOM Property  
  on <span style='font-weight:bold;color:blue;background:white'>BOMLine</span>.  

  Below is Sample Code to set the UOM Property on <span style='font-weight:bold;color:blue;background:white'>BOMLine</span>:  

  PropInfo\[\] pInfo = new PropInfo\[1\];  
  pInfo\[0\] = new PropInfo();  
  pInfo\[0\].object = selectedLine;  
  pInfo\[0\].vecNameVal = new NameValueStruct1\[1\];  
  pInfo\[0\].vecNameVal\[0\] = new NameValueStruct1();  
  //pInfo\[0\].vecNameVal\[0\].name = "bl_sequence_no";  
  pInfo\[0\].vecNameVal\[0\].name = "bl_uom";  
  pInfo\[0\].vecNameVal\[0\].values = new String\[\] {ft.format(dNow)};  

  SetPropertyResponse resp = dService.setProperties(pInfo, new String\[0\]);

*来自 \< <https://solutions.industrysoftware.automation.siemens.com/view.php?sort=desc&q=BOMLine+Quantity+is+0+unit+of+measure&file_type=html&i=002-7009620&k=1&o=0>\>*

