---
title: AWC(Teamcenter 2512)根据属性值控制对象图标的显示
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:04:51
tags:
  - TC
---

[源网页](https://mp.weixin.qq.com/s?__biz=MzkwNTI5MDY0OQ==&mid=2247486357&idx=1&sn=8ac1639949dbb6b0641ccc217494e36a&chksm=c1db655f1e5b8203cb484f7fa8a440e1c676d49c43070437e6e15eb94062a868ce28e8d0bfc7&mpshare=1&scene=1&srcid=0417B0spR6OdbX8E4iK0f4rc&sharer_shareinfo=25793f239110a24e75d5b445a87cf1e3&sharer_shareinfo_first=25793f239110a24e75d5b445a87cf1e3#rd)
公众号名称：小智PLM实施笔记
作者名称：李杰智
发布时间：2026-04-17 20:53
背景：在项目中可能会遇到根据属性值不同，控制对象显示不同图标的场景，下面介绍一下teamcenter 2512版本的配置方法。
配置要求：Requirement Revision类型对象，当a8SuperProcess的值为Y时显示红色图标，N时显示绿色图标，Null时显示默认的原生图标
环境：Teamcenter 2512
BMIDE模型截图：
LOV名称：A8YNLOV， 值：Y/是；N/否；Null/空。
![image1](113cf2e5796f4bad8c92e379007959ae.png)
![image2](2dd0012b333349e69a66dd85b6797b29.png)
![image3](39e268567bf74800abf2fd94215e3fac.png)
![image4](13e024edad7e4c9cbf2ac0394b07e9e0.png)
![image5](6fbd02172b9844d890369186144985c9.png)
![image6](e6423eb809864826a86750225552dcf5.png)
配置步骤：
1.打开cmd窗口，运行%tc_root%\aws2\stage目录的initenv.cmd命令，设置环境变量
![image7](06c07a36d1754b0b8447157e5a28a5ef.png)
![image8](62a31e19acc3437a8a7895a969318937.png)
2.执行npm run generateModule命令，创建module
![image9](3612909b54304414a4b23afe337ff3f7.png)
类型输入**module**
![image10](ee1d26d22c0b46159bd790865d1f1e48.png)
输入module的名称，例如TypeIcons
![image11](1f2d2074e93c4e4e8f2be85c2f529db4.png)
![image12](3f2f79af17c441c4891d48015bb33e64.png)
stage/src目录会新增一个目录，目录名称为之前定义的module名称.
![image13](6fac6137cd264c75b770a40adf2fffa7.png)
3.将svg格式的图标文件放到 %tc_root%/aws2/stage/src/image目录
![image14](4405e9ecd1b2422789ca5edd42a692d7.png)
4.在新增的TypeIcons目录下手动创建 typeIconsRegistry.json文件(每个版本的写法可能都不同，可以参考现有模块里的写法)，内容如下：  
参考文档：《Active Workspace Customization》的Registering icons using conditions章节
![image15](9739357698914f92b2783d7bb270f96f.png)
«span style='color:black'»{  
"\$schema": "declarativeTypeIconsRegistrySchema-1.0.0",  
"typeIconsRegistry": {  
"RequirementRevisionY": {  
"type": {  
"names": \[  
"Requirement Revision"  
\],  
"prop": {  
"names": \[  
"a8SuperProcess"  
\],  
"condition": "(localContext.vmo.props.a8SuperProcess.dbValue !== undefined && localContext.vmo.props.a8SuperProcess.dbValue === 'Y' && localContext.vmo.props.a8SuperProcess.dbValue !== undefined &&localContext.vmo.props.a8SuperProcess.dbValue === 'Y')"  
}  
},  
"iconId": "typeRequirementRedRevision48"  
},  
"RequirementRevisionN": {  
"type": {  
"names": \[  
"Requirement Revision"  
\],  
"prop": {  
"names": \[  
"a8SuperProcess"  
\],  
"condition": "(localContext.vmo.props.a8SuperProcess.dbValue !== undefined && localContext.vmo.props.a8SuperProcess.dbValue === 'N' && localContext.vmo.props.a8SuperProcess.dbValue !== undefined &&localContext.vmo.props.a8SuperProcess.dbValue === 'N')"  
}  
},  
"iconId": "typeRequirementGreenRevision48"  
}  
,  
"RequirementRevisionNull": {  
"type": {  
"names": \[  
"Requirement Revision"  
\],  
"prop": {  
"names": \[  
"a8SuperProcess"  
\],  
"condition": "(localContext.vmo.props.a8SuperProcess.dbValue !== undefined && localContext.vmo.props.a8SuperProcess.dbValue === 'Null' && localContext.vmo.props.a8SuperProcess.dbValue !== undefined &&localContext.vmo.props.a8SuperProcess.dbValue === 'Null')"  
}  
},  
"iconId": "typeRequirementRevision48"  
}  
}  
}«/span»
![image16](9d19f4d01ded42f3921f4ae2a4fc212d.png)
5.在新增的TypeIcons目录下手动创建typeProperties.json文件(每个版本的写法可能都不同，可以参考现有模块里的写法，如果不增加该文件，每次打开页面，就需要手动点击对象，图标才会正常加载)，内容如下：
«span style='color:black'»{  
"typeProperties": {  
"Requirement Revision": {  
"additionalProperties": \[  
{  
"name": "a8SuperProcess"  
}  
\]  
}  
}  
}  
«/span»
![image17](f1fd3c3077f54bdca7cca52a6dd47c87.png)
![image18](28de0684ba4246e388c4fc3e41d3a3fd.png)
![image15](9739357698914f92b2783d7bb270f96f.png)
6.运行awbuild.cmd命令编译awc(如果出现编译失败，提示json格式有问题，可以借助https://www.json.cn/json2025.html，对json进行格式化，去除多余空白字符)
![image19](6a565a0dbb3445ee8c71b63d9e63547d.png)
7.清除浏览器缓存，登录awc验证配置：
![image20](aa5d47cfbd4f47698b73648d071fef2d.png)
![image21](e2223f20c1c7436eb39fb9a501ea5b3d.png)
![image22](2c2a39e481a04fa2b31926186db2ad34.png)
![image23](38904b7734044e189f22b277e6f6b35b.png)

![image24](8d329aa461044b558635ffdf330e2e80.jpg)
原创 李杰智 小智PLM实施笔记 
