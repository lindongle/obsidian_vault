---
title: 导出文件夹下Item下版本下的数据集
updated: 2026-06-05T23:22:10
created: 2026-07-05T17:04:41
---

<span style='background:white'>When standing on a folder, that contains an Item/ItemRevision/Dataset, only</span>
<span style='background:white'>the Folder and Item is exported when using PLMXML export with Transfer Mode:</span>
<span style='background:white'>ConfiguredDataFilesExportDefault.</span>
<span style='background:white'>Note: if you stand on the Item, using the same transfer mode, you will get the</span>
<span style='background:white'>Item/ItemRevision/Dataset</span>
**SOLUTION**
<span style='background:white'>In the Transfer Mode, add the following line:</span>
<span style='background:white'>CLASS/Item/CLASS/ItemRevision/PROPERTY/revision_list/PROCESS+TRAVERSE</span>
<span style='background:white'>Now, when standing on the Folder, using this modified Transfer Mode, you will</span>
<span style='background:white'>get the Folder/Item/ItemRevision/Dataset</span>

*来自 \< <https://support.sw.siemens.com/zh-CN/knowledge-base/PL8004692>\>*
