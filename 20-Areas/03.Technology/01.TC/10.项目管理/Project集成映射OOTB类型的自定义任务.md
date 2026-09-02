---
title: Project集成映射OOTB类型的自定义任务
updated: 2026-09-02T16:30:05
created: 2026-07-05T17:04:46
---

From docs:
![image1](676e82e11661490eaaac9565b0ae9539.png)
From GTAC:

This is a screenshot of a COTS/OOTB "ScheduleTask" Business Object in BMIDE. This list of properties contains the default attributes for a ScheduleTask. Your MSP file may have additional attributes like "ReasonForDelay" that you have already created in MS Project.

![image2](c1e913df08454f09bbf6697b052e415f.png)
From docs:

![image3](db5ef0d540604afd82c366f8b8b21e61.png)
From GTAC:

Here is a SAMPLE screenshot of the SM_MPP_CUSTOM_MAP preference with COTS/OOTB attributes.

![image4](f0d02e1c839e4def8534897c58aeb2e1.png)
From docs:
![image5](2226a66c44204bd68b949f5cb030ab39.png)
From GTAC:

«span style='font-family:"Microsoft YaHei"; font-size:11.0pt'»Here is a SAMPLE screenshot of the«/span»SM_MPP_CUSTOM_MAP«span style='font-family:"Microsoft YaHei"; font-size:11.0pt'»preference with custom attributes«/span»

![image6](951d498785ae47239fec2b81d3bf6787.png)
From docs:

![image7](3af72a3627454394a8ad6de79f43bf27.png)
From GTAC:

When using the MSP plug-in to exchange data with Teamcenter Schedules, we DO NOT support custom attributes that you may have added via BMIDE to a custom ScheduleTask Business Object. You must create any custom properties on the COTS/OOTB ScheduleTask Business Object only. Unexpected errors and behavior might result if you try to add custom attributes on a custom ScheduleTask Business Object.

From docs:

![image8](b91dd5e50b794f40a0b842f7ff9d0c9e.png)
From GTAC:

This is just a SAMPLE screenshot of a new custom field added to the COTS/OOTB ScheduleTask Business Object.
![image9](ebb98b46ba2a4806bb2737ba97d42c4e.png)
From docs:
![image10](b1c5848e7ba345d794864fd4f4bccafb.png)
From GTAC:

This is a SAMPLE screenshot of what the SM_MPP_CUSTOM_MAP preference could look like.

![image6](951d498785ae47239fec2b81d3bf6787.png)
From docs:

![image11](257adcf9e4314813a13ef77e2a96a727.png)
From GTAC:

«span style='font-family:"Microsoft YaHei"; font-size:11.0pt'»Here is a SAMPLE«/span»"tcmspaddin.xml"«span style='font-family:"Microsoft YaHei";font-size:11.0pt'»file with the custom properties added.«/span»

![image12](584119f74d2a4106823e67eaa29f144c.png)
From docs:

![image13](a312d643faa34cc7a416b0e2e0ef475e.png)
From GTAC:

This is a SAMPLE screenshot where a custom attribute has been added to the appropriate stylesheet.

![image14](30c2761051c14621b5b6af109e9cd0b5.png)
From docs:
![image15](692aef6d632544388d0892069728b086.png)
From GTAC:

Restart ALL Teamcenter services on the Teamcenter Server, including both FSC and Pool Manager.

*来自 \< <https://support.sw.siemens.com/zh-CN/product/282219420/knowledge-base/PL8006462>\>*

