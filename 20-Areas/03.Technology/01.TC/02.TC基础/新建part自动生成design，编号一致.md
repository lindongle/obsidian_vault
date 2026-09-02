---
title: 新建part自动生成design，编号一致
updated: 2026-09-02T16:30:04
created: 2026-07-05T17:04:41
---

**要求：**创建part时，自动创建design，两者自动关联，并且两者ID与名称一致。
BMIDE配置：

1.  对part配置“操作”
![image1](6f10dc17dcd643c8a2a56a9f6e5cd91b.jpg)

![image2](826636e85f6c4fc0ae4e1f2137666369.jpg)
2.  对design的“名称”属性添加属性常熟
![image3](7c785434879842bbb1aaf648bdea94fb.jpg)
3.  对design的“ID”属性添加属性常数
![image4](4b48e09ad2a74044a34bbb9d7f6dbd7d.jpg)
4.  修改id属性唯一性
![image5](7fea3880c0f44ad1b6cba1076cc0ca5e.jpg)
5.  修改业务常数
![image6](07fb8cfff3db4598ac6ea690ecbbbfde.jpg)

配置完成，部署系统。
**结果展示：**
![image7](d8ea009aaf774ee7b87f52ce9ced1591.jpg)

