---
title: VMwareWorkstation导入vSphere
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:04:55
---

vSphere Center如何导入vmdk文件
Vis lantch login note
False/true
一般用户在自己家里使用vmware 和vbox 制造虚拟机的时候，万一要移植到vSphere 怎么办呢
工具/原料
- vCenter
方法/步骤
- «span style='color:#333333'»1  
  第一步，首先将vmware 或者vbox 虚拟机导出。格式为vmdk。«/span»
![image1](0f60dd05aeec42fe8d65c3259915c544.jpg)
- 2  
  第二步，打开vSphere client，进入主界面
![image2](387b7100bb4942c1a518cd54c68acd29.jpg)
- 3  
  第三步，选择 数据存储和数据存储群集 然后选择相应的存储，点击 “将文件上载的此数据存储”
![image3](22039ef216ee4fbb91710a5295c4eda2.jpg)
- 4  
  第四步，上传完了，点击 vmx 文件右键，添加到清单，然后你就可以在清单里看见你原来的虚拟机了。

***提示上载失败***
Error:
Error processing attribute "type" with value "OverheadMemoryManager"

while parsing MoRef for ManagedObject of type vim.OverheadMemoryManager
at line 7, column 3236

while parsing property "overheadMemoryManager" of static type OverheadMemoryManager

while parsing serialized DataObject of type vim.ServiceInstanceContent
error parsing Any with xsiType ServiceContent
at line 7, column 33

while parsing return value of type vim.ServiceInstanceContent, version vim.version.version10
at line 7, column 0

while parsing SOAP body
at line 6, column 0

while parsing SOAP envelope
at line 2, column 0

while parsing HTTP response for method GetContent
on object of type vim.ServiceInstance
at line 1, column 0
Completed with errors
解决：安装VMwareWorkstations11.4版本，然后虚拟机-管理-硬件兼容设置，选择VMware11，修改后，重新上传。
