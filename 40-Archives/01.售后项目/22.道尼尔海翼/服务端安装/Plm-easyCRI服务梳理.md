---
title: Plm-easyCRI服务梳理
updated: 2026-06-06T10:09:06
created: 2026-07-05T17:05:03
---

1.  Office转PDF（对于MSWordX或MSWord使用ds4_printpdf.exe）,针对流程目标中类型为-typ=MSPowerPointX/MSWordX/MSExcelX进行处理。-options=approve
    1.  E:\siemensshare\tc10prodlocal\cri\office\CreateImage4Office\bin\start_office_pdf.bat
![image1](129ecdf01519433ba0e7bdfe5158ffcf.png)
2.  PDF签字（针对类型-typ=Item，-options=report=StampPdf;no_view=Y），调用ds4_stamp.exe
    1.  E:\siemensshare\tc10prodlocal\cri\office\CreateImage4ReportsGenericDoc\bin\start_office_reports_generic.bat
    2.  ![image2](939bfb9bd35a4754a7bc453d4c81fdd5.png)
3.  导出报表（转PDF，含PDF签字,调用ds4_stamp.exe）针对类型为Item（-typ=Item），通过plmxml导出数据后转PDF
    1.  参数-options=approve;report=tdd_pdf;import_rel=IMAN_reference
    2.  参数-options=approve;report=elr_pdf;import_rel=IMAN_reference
    3.  参数-options=approve;report=tddtool_pdf;import_rel=IMAN_reference;REV_RULE=DS4_At_Release
    4.  参数-options=report=elr_pdf;import_rel=IMAN_specification;approve;DS4_1LEVEL=True;REV_RULE=DS4_At_Release
    5.  参数-options=report=tdd_pdf;import_rel=IMAN_specification;approve;DS4_1LEVEL=True;DS4_TDD_SAVE=True;REV_RULE=DS4_At_Release
    6.  参数-options=report=StampPdf;no_view=Y
    7.  参数-options=approve;report=StampPdf;no_view=Y
    8.  参数-options=report=StampEsdPartRel;no_view=Y
    9.  参数-options=report=StampEsdMon;no_view=Y
    10. E:\siemensshare\tc10prodlocal\cri\office\CreateImage4Reports\bin\start_office_reports.bat
    11. ![image3](0db4a8b74fcd4ef4b29025769a54ff09.png)
4.  将plmeasy取出的数据写入Excel指定模板中，取出的数据在s:\\
    1.  D:\siemens\JFRC_Sequencer\JFRC_Sequencer.exe
    2.  ![image4](b62ecb087f214d7089cc049885217a07.png)
5.  三维模型（UGMASTER）转JT
    1.  E:\siemensshare\tc10prodlocal\cri\nx\04_portal_jt_reimport\bin\start_04_portal_jt_reimport.bat
    2.  ![image5](0c27b9b853b143b2bde0c0f48cbf9b09.png)
6.  三维模型（UGMASTER）转step文件
    1.  E:\siemensshare\tc10prodlocal\cri\nx\06_portal_step_save\bin\start_06_portal_step_save.bat
    2.  ![image6](4e4ca4c8aa2f4ff5b2cc5fa0831ab854.png)
7.  NX图纸（UGPART）转PDF(使用的ap01的路径splmshare共享)
    1.  E:\siemensshare\tc10prodlocal\cri\nx\02_portal_pdf_reimport\bin\start_02_portal_pdf_reimport.bat
    2.  ![image7](3303d9778a7a49d59e131e27a5830bec.png)
用到的ap01的文件夹
![image8](e00ab1acc70c4adbb52c71155dbef8f6.png)
及BCT的license服务
![image9](87162b74afd94853b388b36aab812a28.png)

![image10](3098b5ed27f04fa39d2b0b6faf5ec446.png)
8.  NX图纸（UGPART）转TIF文件
    1.  E:\siemensshare\tc10prodlocal\cri\nx\01_portal_tif_reimport\bin\start_01_portal_tif_reimport.bat
    2.  ![image11](44b4340535d44203a538bb67f91ac85b.png)
