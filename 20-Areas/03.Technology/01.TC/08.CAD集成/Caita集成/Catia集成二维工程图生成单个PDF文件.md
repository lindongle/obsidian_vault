---
title: Catia集成二维工程图生成单个PDF文件
updated: 2026-09-02T16:30:05
created: 2026-07-05T17:04:43
---

CATIA集成环境设置保存时二维工程如生成PDF，具体配置首选项如下：

CATIA_dwg_auxiliary_types（已有） 
值：pdf
CATIA_dwg_save_aux_for_details_sheets（已有）
值：FALSE
CATIA_dwg_pdf_aux_dataset_type（新建）
值：PDF
CATIA_dwg_pdf_aux_link_on_item_rev（新建）
值：IMAN_specification（关系可更改）
CATIA_dwg_pdf_aux_link_on_dataset（新建）
值：catia_auxiliaryLink


此外须设置CATIA的图形格式输出选项如下：
![image1](b6ebd00752d245829d5d726b7dfd0440.png)

![image2](fecec00054cc483aad38a14cee7bf69d.png)


