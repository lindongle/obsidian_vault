---
title: NX集成
updated: 2026-06-06T10:09:04
created: 2026-07-05T17:04:50
---

NX本身添加材料相关命令
NX切换到渲染标签页，空白处右键：
![image1](f22e7da68e544f76b9d1c81ede425552.png)

![image2](0a57f5f68fb3458f8367e747321fdfa4.png)
将后侧三个命令直接拖动到标签页的空白处。
![image3](fe4d37bedc034943b8d540aa077dcfcc.png)

**配置NX中材料搜索：**
配置IMM中搜索结果的列：首选项IMM_CAD_MATERIAL_VIEW_COLUMN_CONFIG
![image4](79225f5aece64f8bbb761f6e2269fcba.png)
配置IMM中的搜索条件：首选项IMM_SEARCH_MATREV_CUSTOM_ATTR
首选项IMM_NX_Display_Statuses，控制条件中的发放状态下拉框的值，组级别首选项。
<span style='color:red'>只有才IMM模块，选择对应材料目录创建出来的材料，才可以被搜索，直接在home下创建的材料，无法在NX的IMM中被搜索出来。</span>
**材料指派：**
在NX中选中模型（只支持实体，会聚体，刻面体，钣金体），再选择查询出来的材料，点击确定即可。（注：中文名称材料不受支持，会提示找不到同名的对象）。
![image5](31b331e919264679b4a94a1e57972dbd.png)

![image6](16f29279f065482e86c0e3b3172e6e55.png)
保存后，会将材料自动保存到零组件版本下的材料关系下。且会在管理材料中的本地材料中自动生成xml文件。保存完后，管理材料、指派材料等功能会置灰。
![image7](44523de503154b569cbb01a238115d30.png)

![image8](636ca12a378c49b0949732aa5a31e24b.png)
重新指派材料，保存会替换材料关系下的材料版本对象。（<span style='color:red'>注意新建材料时，材料是否为外部导入的必须为否，否则无法移除更新。</span>）
![image9](0e9bd61d608e4e9f8ba8371f29e0ed69.png)
以下按钮模式是灰色的，在仿真模块才可以使用，将材料添加到网格属性中。
![image10](3b0efeccfcfc4dc182b9df41e1b61389.png)

