---
title: 部署中心安装tc2406安装--将tct4seda客户端单独分开不同环境
updated: 2026-07-29T13:50:54+08:00
created: 2024-09-20T17:05:05
---

1.  ![image1](ee8843702c014ec0bb1374ac928352e3.png)
2.  软件全选，更新选定软件；
3.  ![image2](bd1accab9f95448fa4c7e02f91f30f1e.png)
4.  应用程序中，取消勾选，Active Integration Gateway ITK，点击更新选定的应用程序；
5.  勾选：4Tier Gateway Service Client (SAP)/T4S4 Gateway Service/Teamcenter Gateway for EDA/Teamcenter Gateway for EDA Library/ EDA Translation/T4S Demonstration Template/3D Visualization/ Access Manager Active Workspace/Active Workspace Visualization 2D Viewer/Audit/Active Content/Change Management/Dispatcher Client for Rich Client/Active Workspace User Management/Integration for NX Foundation/MCAD Integration/Markup/ EDA for Business Modeler IDE/NX Integration/ Preference Management/Reporting/Reuse and Standardization/Subscription/NX Part Family Classification Integration
6.  注意：提示EDA的组件重复，需要去除EDA集成单独介质，只保留tc介质就可以；
7.  添加组件Business Modeler IDE 2 tier/Rich client two-tier/Teamcenter Management Console/Teamcenter Integration for NX Prerequisites
8.  配置组件时，建议先配置企业层/数据库/J2EE等核心配置。路径会自动修改。
9.  ![image3](96e3bdc03f774c7698b4ac48bbe699d7.png)

10. ![image4](b42ae7c63a964938ab9adb85337c5c6f.png)

11. ![image5](9ccc79e3ec4f4f3d99f39fc1e94a35a8.png)

12. ![image6](bfe84a8055bb4a08b4005788883e63c9.png)

13. ![image7](bee7864cde184fb3a00208c1262a094d.png)

14. ![image8](20b67ed8d5d842f291936a0bc16211aa.png)

15. ![image9](d8202855fbac45c7a97a1fbf68d7bfd2.png)

16. ![image10](8c509c0054c64d13bde3732f1d60185a.png)

![image11](641f9b38278649458e3836f59462da3e.png)

![image12](54a6cc70ef9c483cbc7910cbf5298573.png)

![image13](f5bc946f25b0454fabbb93835109dfe3.png)

![image14](512ab501307b423989704fc043b12e7c.png)

![image15](8caf4f64552643eeaeb32329fc4d65fe.png)

![image16](2f57b208e9b3439eb4c64a97530c966a.png)

![image17](c61fd5cca57648ea88f5145e8f3f4eb7.png)

![image18](a266c97c67f640ec88347608a0f718be.png)

![image19](c93f6357c53e4d20afb82617704c9691.png)

![image20](47fc7f73d7194f84963494670a419d44.png)

![image21](64c6e27a2fd742f59194dbeec42a9d33.png)

![image22](d7bb6b4b93684f3ea58c799de5d35f6d.png)

![image23](2e4e4211fbc64828ad4ce82b57f979d7.png)

![image24](82ed0f663d6a4b049efeca2e0e7e244c.png)

![image25](c17af21c85b549e79e766754bfcb8438.png)

![image26](e3d857df32d64857b0c2298cf4a5c13c.png)

![image27](35a2d96bd8cf4439a67b957accc9e9e4.png)

![image28](b24af6025261422eb5d75fb545b36b6d.png)

![image29](aeebef9dce6c49f297c1218852fa1be5.png)

![image30](7ab229ffc74d43baa3ae5f07ed3945ea.png)

![image31](038455b3edcd47f0b9d085d1dc48e4a3.png)

![image32](4297bb1cbef748e5bb68957d23e2f7e8.png)

![image33](965d4f95499443efaa7fbca199c27198.png)

![image34](60091c0457c647a1b7c84084b8bf50ef.png)

![image35](7a157247e8e24a8db97d6ec7fec3d893.png)

![image36](de04cbec21ec478aaa6542a573adfa97.png)

![image37](06ce3b9c754149f8bba865a227f1424d.png)

![image38](e9670de6d0514fc6a863819ab0c154d8.png)

![image39](869894a4bff64847ae35739fd92cacd7.png)

![image40](db7cb9654efb443097506bb0a0e8a6a4.png)

![image41](236e3dd79285400cb7b423cc04a8a034.png)

![image42](0b2aa76e15d240f480cbdb23b4ca2536.png)

![image43](ffdc1473da9f4d61a29b4c1e5b518bd2.png)

![image44](be239aa1705542399b6714bc353097c1.png)

![image45](6c10b301c7244aeb9098e52744ad6bc3.png)

![image46](fa760354b4d9468d9d7473a946748b3d.png)

部署，生成安装脚本；
sqlplus /nolog
conn / as sysdba;
create user TcClusterDB identified by infodba default tablespace "IDATA";
grant dba to TcClusterDB;

sqlplus /nolog
conn / as sysdba;
create tablespace PredictiveDB_predictive datafile 'D:\Oracle\app\Administrator\oradata\TCQAS\PredictiveDB_predictive.dbf' size 20M autoextend on next 5M maxsize 500M;
create user PredictiveDB identified by infodba default tablespace "PREDICTIVEDB_PREDICTIVE";
grant dba to PredictiveDB;

deploy.bat -dcusername=dcadmin -dcpassword=infodba -softwareLocation=D:\Siemens\DeploymentCenter\repository\software
