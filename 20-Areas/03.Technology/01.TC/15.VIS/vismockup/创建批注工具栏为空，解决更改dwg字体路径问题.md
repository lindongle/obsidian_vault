---
title: 创建批注工具栏为空，解决更改dwg字体路径问题
updated: 2026-06-05T23:26
created: 2021-01-13T20:22:55
---

需改几个首选项，注意部分是写数据集名称，部分是写数据集引用名称

- <span style='font-weight:bold;text-decoration: underline;background:white'>Solution</span>
- <span style='color:#333333;background:white'>Need to configure the PDF Data for </span><span style='font-weight:bold;color:blue;background:white'>markup</span> ability in addition to viewing.  

  Below are Teamcenter preferences that need to be configured to allow PDF dataset viewing and <span style='font-weight:bold;color:blue;background:white'>markup</span> using TcVis in the embedded viewer.  

  Under preference defaultViewerConfig.VIEWERCONFIG  
  \>\>REMOVE \>\> PDF.PDFViewer=PDF_Reference,PDF (this was permanently removed sometime during v10)  
  \>\>ADD \>\> PDF.TCTwoDViewer=PDF_Reference,PDF  

    

  Under preference TC_DIS_2D_named_ref  
  \>\>Add "PDF_Reference"  

    

  Under preference VMU_FileSearchOrder  
  Add "PDF_Reference"  

    

  Under preference VMU_Datasets  
  Add "PDF"  

    

  To make <span style='font-weight:bold;color:blue;background:white'>markups</span> available:  

    

  Under preference TC_markup_named_ref  
  \>\>Add "PDF_Reference"  

    

  Under preference DMI_markup_relation_primary  
  Add "PDF"

*来自 \< <https://solutions.industrysoftware.automation.siemens.com/view.php?sort=desc&p=1&q=create+markup&file_type=html&i=001-7762371&k=4&o=0>\>*

