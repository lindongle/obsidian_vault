---
title: 修改BOM行中单位值
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:04:54
tags:
  - Java
---

- How to set unit of measure on BOMLine and released item using RAC cust
- Symptom
- ---------------  
  User want to set unit of measure on already present item (released or  
  unreleased) and also want to set unit of measure on BOMLine using Rich client  
  customization or using SOA customization(Rich client is priority)  

  How to set unit of measure on BOMLine and released item using RAC  
  customization.
- Hardware/Software Configuration
- «span style='color:#333333'»PLATFORM: INTL64 OPERATING SYSTEM: WINDOW  
  OS VERSION: 764 PRODUCT VERSIONS: Tc 11.2.2«/span»
- Solution
- bl_sequence, quantity and UOM (unit of measure) are some special properties,  
  probably there is an event which update the RAC when modifying the property.  

  Use "setProperties" method of the datamanagementService to set the UOM Property  
  on BOMLine.  

  Below is Sample Code to set the UOM Property on BOMLine:  

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

