---
title: 获取SAPDat名称
updated: 2026-06-08T23:23:32
created: 2026-07-05T17:04:48
---

1、查到对应调用的BAPI函数名，可以通过调试接口添加断点或接口调用后再BGS的日志-系统日子-sap_function_calls.log中查询（但部分无法查到）。
![image1](824736e7e6dd4f01bf8d89ba67cb8df2.png)

![image2](8e48ccbe856a4f3c947fb9c31dc189b5.png)
2、在GS中打开脚本SAP get BAPI function，FUNCTION NAME输入上面查出的函数名，如BAPI_MATERIAL_SAVEDATA。
3、OBJECT NAME中输入类型名字，即SAPDat后面的内容，如Material/Document等
![image3](6ccd90f54002412589a4a136ff39ebeb.png)
4、执行完成后，到BGS中，选择日志-用户日志
![image4](2f79fa28e435417daa4ad0ece1ad8090.png)
5、找到function_interface4XXXXX.log，可以看到对应 SAPdat内容。但获取的SAPDat不能直接用到Mapping文件中。
![image5](41bf18bc007b42569c3190dbbed18a1c.png)
6、打开SAP，输入事务代码SE37。输入函数名，点击显示。
![image6](c6017d1bf1c544b3afbc15b2f7c31d87.png)
7、左侧参数名称为上述BGS日志的对应位置，要转换为参考打印栏中对应的内容。
![image7](8bd7c06124d34262a006956d5062833f.png)

![image8](0d820febcbac4d6ea730273dc080a575.png)

![image9](3b06f45ed238436bba5a69c8ee6c5d87.png)

