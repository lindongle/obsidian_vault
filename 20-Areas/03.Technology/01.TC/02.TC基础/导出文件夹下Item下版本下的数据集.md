---
title: 导出文件夹下Item下版本下的数据集
updated: 2026-09-02T16:30:04
created: 2026-07-05T17:04:41
---

When standing on a folder, that contains an Item/ItemRevision/Dataset, only
the Folder and Item is exported when using PLMXML export with Transfer Mode:
ConfiguredDataFilesExportDefault.
Note: if you stand on the Item, using the same transfer mode, you will get the
Item/ItemRevision/Dataset
**SOLUTION**
In the Transfer Mode, add the following line:
CLASS/Item/CLASS/ItemRevision/PROPERTY/revision_list/PROCESS+TRAVERSE
Now, when standing on the Folder, using this modified Transfer Mode, you will
get the Folder/Item/ItemRevision/Dataset

*来自 \< <https://support.sw.siemens.com/zh-CN/knowledge-base/PL8004692>\>*
