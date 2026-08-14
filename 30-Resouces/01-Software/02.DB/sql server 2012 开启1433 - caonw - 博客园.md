---
title: sql server 2012 开启1433 - caonw - 博客园
updated: 2026-06-06T10:05:34
created: 2026-07-05T17:04:54
---

下午

已剪辑自: <https://www.cnblogs.com/caonw/p/12066028.html>
1.打开Micarosoft SQL Server Management,使用windows身份验证
![image1](f6932100a1304749980d3dcc7a078d54.png)

右键选择属性
![image2](114592acd23349e1acc4c5f2cbbb084b.png)

\<安全性\>设置成 SQL Server和Windows 身份验证模式
![image3](c0364e9e81bc4ff480235b58b89361ba.png)

\<连接\>允许远程连接此服务器 打上对勾
![image4](a3ffc29dc6c04585b79470f9a17f3b30.png)

2.\<安全性\>=\> \<登录名\>=\>sa属性
![image5](39ffb7dee220404ba9d90bb5d2ef6c2a.png)

修改sa密码
![image6](cfbb4e44073b438d879cad14fc21b45d.png)

状态，登陆设置成已启用
![image7](8e8fc8d6178b49e2867806ef9eb9e63f.png)

3.双击 sql server configuration manager 图标 ，右键TCP/IP 启用.
![image8](854cb16fa07a41c3be0112752e54cfa0.png)

右键TCP/IP属性 从IP1-IP7 已启用 都选择“是“
TCP动态端口 改成1433

![image9](c3a1de322fa74caaa7f5b7ffbc7158e4.png)

重启sql server 服务
![image10](9c4f53d4f9024d06ba3f85697afeb1df.png)

重启 sql server browser服务
![image11](d3bb5cbc00b541d3b59c41bbffc752fe.png)

如开启防火墙，可以添加规则放开1433端口
开启后即可
