---
title: SAP事务代码
updated: 2026-06-18T19:36:58
created: 2026-07-05T17:04:48
---

物料主数据：MM 01创建 02更改/删除 03显示
ZMDM009：查询物料的所有信息，一行行显示
BOM：CS
变更：CC
工艺路线CA
 C223-生产版本
CS11/12 多层BOM
文档：cv01n,02n,03n
文档BOM：cv/11/cv12/cv13,创建、修改、查看
删除物料：MM06
SE37查看函数。函数名在API中
SM12,解锁用户
CV11Create Document Structure 创建文档结构
CV12Change Document Structure 更改文档结构
CV13Display Document Structure 显示文档结构
CV15Change Document BOM Group 更改文档 BOM 组
CV16Display Document BOM Group 显示文档 BOM 组
CV80Change Documents for Doc. Structure 更改文档结构的文档
**MB52 查询库存**
MMAM:修改物料类型，选择新的物料类型后，回车，点击执行或f8，再回车。
MM04查询物料更改记录，勾选下面的在清单浏览器中显示所有凭证、C
CL01创建特征；TCT03
CU50：模拟选配


查看日期及数字格式：
SAP 可能会拒绝包含非预期格式数据的事务（主要是日期和十进制数字）。查找 SAP 期望的数据格式如下： · 登录到 SAP 系统 · 输入事务代码“SU01”进行用户维护 · 输入适当的用户 ID（将被 T4S 调用的 SAP 用户） · 点击按钮带有眼镜符号（“显示”）·单击选项卡“默认值”·您应该看到如下内容：


![image1](259f48d241664d949f00effefe136e19.png)
查询物料所在工厂：MM03-组织级别-选择工厂
![image2](684bebde26ac4d439ba9ed30ea6bb4fb.png)

![image3](9dfd01b49d0f48b8a0bc5da1eb48bcf8.png)

![image4](2adce2cdd39042eeb079e6a92cc320ea.png)

