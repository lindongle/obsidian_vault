---
title: Oracle19c RAC for Centos7.6 详细安装文档 | 周末送资料
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:08:54
tags:
  - TC
---

## Oracle19c RAC for Centos7.6 详细安装文档 \| 周末送资料 
收录于话题
相关推荐资料：
- [Oracle RAC 资料大全 \| 周末送资料](http://mp.weixin.qq.com/s?__biz=MjM5NTk0MTM1Mw==&mid=2650651649&idx=1&sn=e6e8441be818574b17fa585d69a5f063&chksm=bef9c287898e4b9136d5414f48320ae9d66a4d4689672fe5c76094871bcda41eb0e6170acc00&scene=21#wechat_redirect)

目录  

1 环境
1.1 系统版本
1.2 ASM 磁盘组规划
1.3 主机网络规划
1.4 操作系统配置部分
2 准备工作（rac1 与 rac2 同时配置）
2.1 配置本地 yum 源
2.2 安装 rpm 依赖包
2.3 创建用户
2.4 配置 host 表
2.5 禁用 NTP
2.6 创建所需要目录
2.7 其它配置
2.8 配置环境变量
2.9 配置共享磁盘权限
2.10 配置互信
2.11 在 grid 安装文件中安装 cvuqdisk
3 开始安装 grid
3.1 上传集群软件包
3.2 解压 grid 安装包
3.3 进入 grid 集群软件目录执行安装
3.4 GUI 安装步骤
3.5 查看状态
4 以 Oracle 用户登录图形化界面
4.1 执行安装
4.2 执行 root 脚本
5 创建 ASM 数据磁盘
5.1 grid 账户登录图形化界面，执行 asmca
6建立数据库
6.1 执行建库 dbca
6.2 查看集群状态
6.3 查看数据库版本

**1 环境**
**1.1 系统版本**
\[root@rac19c1 Packages\]# cat /etc/redhat-release
CentOS Linux release 7.6.1810 (Core)
**1.2 ASM 磁盘组规划**
![image1](e1efbd1b03774aec952d57c875277906.png)
**1.3 主机网络规划**
![image2](404a801d7f464fdaa1f7cd03120293a3.png)
**1.4操作系统配置部分**
1\. 关闭防火墙
![image3](b2f7fe00ded54e55ba217accc683f853.png)
2\. 关闭 selinux
![image4](23935e4cbb044ddc82bfbefbf012d880.png)
3\. hosts 文件配置
![image5](eb1ce53451bb4613a62d4054846a4577.png)
![image6](f3df3754cd2845eea44c472811cb105a.png)
**2 准备工作（rac1 与 rac2 同时配置）**
**2.1 配置本地 yum 源**
![image7](8eb71e9760694e169aa0a364c910c438.png)
![image8](2f7d858d257f4837bd7c8675290c5b8b.png)
![image9](5de6d264967a413999f58b5e459b7cf9.png)
**2.2 安装 rpm 依赖包**  

![image10](82e82a1af0964a46bf1ab6d1e8e9592d.png)
![image11](38a620b1f8d74af6952b626886c5a4ce.png)
![image12](71f0cdbb095b4cb99601811ddcdb8a3d.png)
![image13](6bb17adca85e4b2e9dd1d762d46b0ccb.png)
**2.3 创建用户**
![image14](f1ea9c787d3a4286838aaf607553129c.png)
**2.4 配置 host 表**
![image15](c91135267d6c4af09df1cd6867528e35.png)
**2.5 禁用 NTP**  

![image16](4e692f8b54d94aaeb6837afe4057253c.png)
**2.6创建所需要目录**
![image17](033ccee7a2d84edcb3a6ea4876855509.png)
**2.7 其它配置：**
![image18](71d11cd3d753461085768e2e8ce1fe7c.png)
![image19](0fd13e858f2947d7b274720ea9ac607a.png)
![image20](036891b68ee4455291ca9a5b27f4cd69.png)
![image21](7438398548114bbfa9703e3c6a08502f.png)
![image22](a475714775fb44969c0bf7e14eec3e99.png)
![image23](d2b265d1430c42cc997b7fa3b20b22a3.png)

![image24](8e8e93ac660044fc8f36e084b7768751.png)

![image25](01e7a1e25909458f908fc6de2bba2ef5.png)

**2.8 配置环境变量**
![image26](887c5e58cee64fc7a4bafd960fd359b6.png)
![image27](c40845da1197485a95b390f4e20ec95a.png)
![image28](de7fcf856c4343dc881983c8b6406f2f.png)
**2.9 配置共享磁盘权限**
![image29](1084276fbb2a49dfba4a0190e9da0d4c.png)
![image30](11fc3de3f1ba4747b375057a0fee1d27.png)
![image31](4ab269b4ea6547f1ab43a0f80a0405ca.png)
![image32](621b747156504e52beffc6cb6de86aec.png)
**2.10 配置互信**
![image33](b83b8b63b64e4ed1a463aef3c5635885.png)
![image34](a866ebcac20649f2b7fb39c83151844e.png)
**2.11在 在 d grid 安装文件中安 装 cvuqdisk**
![image35](b1f16240899b4ac5b7ef2b854b7d9f9a.png)
**3 开始安装 grid**
**3.1 上传集群软件包**
![image36](688d81c97ed84e9c84f52efc7ba683f8.png)
**3.2 解压 grid 安装包**
在 19C 中需要把 grid 包解压放到 grid 用户下 ORACLE_HOME 目录内
解压文件到/u01/app/19.0.0/grid
![image37](c1ddf8b7ab4a4ef68881e7267c7d3819.png)
**3.3 进入 grid 集群软件目录执行安装**
\[grid@rac1 grid\]\$ ./gridSetup.sh
![image38](93adf9a0110e48f4a79e5c60d14dd546.png)
**3.4 GUI 安装步骤**  

1\. 创建新的集群
![image39](dd4015d56df441e493d8b30801ece529.jpg)
2\. 配置集群名称以及 scan 名称
![image40](825296defb3b4a3ea21d6ad7c8c2cd7d.png)
3\. 节点互信
![image41](e1cf14d1c7744029bb2347d9b7d8e93f.png)
4\. 公网、私网网段选择
![image42](5a05b98e6a1847da94a39f1c8fcb87f1.png)
5\. 选择 asm 存储  

![image43](58acbed3cf7a4c43bf383e884a597f6c.png)
6\. 选择配置 GIMR
![image44](d2234eb9451b4421ab1fa139ecbb0eb4.png)
7\. 这里选择 ocr、voting file 与 gimr 放在一起
![image45](cf5f8d948f074e8f909c9dc9c63b5150.png)
8\. 选择 asm 磁盘组
![image46](4d759377a0194dbfbe9ef5272a54ee0b.png)
9\. 输入密码
![image47](6619e67c1a0247fab2de9ab1d3d2bc88.png)
10\. 保持默认
![image48](d61aa933eb9540878ba51bf84a14518f.png)
11\. 保持默认
![image49](602310b5234645b48c520faa0e457b9d.png)
![image50](a26bbc313a4f4473abdc3615d1850775.png)
12\. 确认 base 目录
![image51](1543aca818354f0394b88962873a340e.png)
![image52](e5c17933242241faadda8fca7f7f1c5f.png)
13\. 这里可以选择自动 root 执行脚本
![image53](89a843e669ac4094abb34f0031f37986.png)
14\. 预安装检查
![image54](270ff1b26067487abc490a9e4f98de22.png)
15\. 解决相关依赖后，忽略如下报错
![image55](4794f135a804457bbd8e7a94fb22d658.png)
16\. 如下警告可以忽略-警告是由于没有使用 DNS 解析造成可忽略
![image56](c15a8cfdb1c44186a8439594d4720e72.png)
17\. 执行 root 脚本
![image57](1cb7e06e66e349b2932e86443f89d811.png)
![image58](d1d91354ac5b4b00be70b4d7427157e4.png)
![image59](5ca5f25159bf4870ae2558decb226f0a.png)
![image60](a299e7e058c741f2a352b2f7c88ea3e5.png)
![image61](bf74751a197d430baaf93a01802bdf57.png)
![image62](470cda789d7444cfb70b8439a2a7a136.png)
![image63](2f27dd9467784f2a95b1a3abd5c7a73f.png)
![image64](3a608b5f5d4543d89cc4b6dfcaa384f3.png)
**3.5 查看状态**
![image65](145fda79b4c54f37bc28ccac5fff1a09.png)
![image66](be46d60afab7476cbae9df60d9d6007d.png)
![image67](8f5b75e2863b40fe9d668bdf67426f7d.png)
**4 以 Oracle 用户登录图形化界面**
将数据库软件解压至\$ORACLE_HOME 安装 Oracle 数据库软件
![image68](2a674d9e53e7438eab190fbca75103e8.png)
**4.1 执行安装**
![image69](505afc2c769846e2b9ad57fc676a3e56.png)
![image70](35edccac098848d3a89346e04636264e.png)
![image71](64ea585d846648638fbb4d7435e1e5d0.png)
![image72](d1c637a5aec548d9ba05cd52d709e362.png)
![image73](c9fdcccd17da411b94bba40fb3e66257.png)
![image74](5ebe7b2960654c68ac96a5d728151e94.png)
![image75](883bb8eb2c56497386224b0e134e3861.png)
预安装前检查忽略如下警告
![image76](f66eab02ea5c448fbbdcc597d7ea781c.png)
![image77](02b705024c8d4328aee8e2977b5b9d5a.png)
**4.2 执行 t root 脚本**
![image78](e989137563b3470f9142961f24a99a36.png)
![image79](601c38af9df84647b9113e41b9c78f0b.png)
**5 创建 ASM 数据磁盘**
**5.1 grid 账户登录图形化界面，执行 asmca**
![image80](e8c7d92c395046fa9616615d6d69eecf.png)
![image81](bf52ea9ac1274ab99485ea4c29030ce5.png)
![image82](2a2f3dcd14e7468e97b6d8b38d3f595c.png)
![image83](776dce82b1b2450da38cf81535a6e8fa.png)
![image84](122e5803a34f4ab68741a08a42ab8ffc.png)
![image85](5526c9b3230b4ca28cc85db066a25379.png)
**6 建立数据库**
以 Oracle 账户登录。
**6.1. 执行建库 dbca**
![image86](c7e1014e76eb403e82f7b2ace87dcce3.png)
![image87](269c270b641140f79823a711cd3805b3.png)
![image88](378d68e7e3dc472e9a6a1589d86fed3c.png)
![image89](cab29304ca5843ee96fbf1118b3b931e.png)
![image90](c693d7184f28437a8b0f6ed948d8cbc1.png)
![image91](e1f0edf0185641418c51a07684bec077.png)
![image92](4504740575834d1991b8957b16a7c535.png)
![image93](b0e0aabffa17451881ed2507a520eeef.png)
![image94](46be8ea6585445ebb190d4597985bdba.png)
![image95](5ac6489196c24ecd8b4b740711d04b45.png)
![image96](4bc1a6a1a35246589f6ca183f4fc7f81.png)
![image97](5f3cafd0a5c44edebea3f1ba9d742d43.png)
![image98](5a9333546d4042c39983abcead12cc92.png)
![image99](67c6066f58104c6fa98bbaf9d6d8af75.png)
![image100](d2b756dc8b34453e87c6e6ad70eb0d2c.png)
![image101](116e4ec7d46b42dabed1277736008d4a.png)
![image102](2c2b5473bc2a4ba09153646283779d7a.png)
![image103](acad1e22b8344a458609a5a897c88d7c.png)
**6.2 查看集群状态**
![image104](fc07d898f3d04c4bb31ef9494897b8ef.png)
![image105](a2b928a2e8d7405c92715a6e146ca37d.png)
![image106](83cb314edb234019bb0f45ef2da690c6.png)
![image107](bca9579dabb043428c12b7cb004fbfc1.png)
![image108](006481d060e145a5b6872c4ef61688cc.png)
**6.3 查看数据库版本**
![image109](a03d45d189eb40069703fdfde53f2270.png)

来自社区会员上传分享，相关版权归原作者所有点击阅读原文可下载原文档觉得本文有用，请转发、点赞或点击“在看”，让更多同行看到  

欢迎关注社区“数据库”技术主题，将会不断更新优质资料、文章。地址：  

[https://www.talkwithtrend.com/Channel/597](https://www.talkwithtrend.com/Channel/597)

下载 twt 社区客户端 APP
![image110](9e05676ffdda4ef9bf915350ba18819b.png)

![image111](2bad252874c8424a9e19f609888cb4ed.png)
长按识别二维码即可下载
或到应用商店搜索“twt”

长按二维码关注公众号
![image112](2073e271971444f3981cb72389839ab9.jpg)
\*本公众号所发布内容仅代表作者观点，不代表社区立场
预览时标签不可点
收录于话题 \#
个

分享 收藏
赞 在看
已同步到看一看[写下你的想法](javascript:;)
前往“发现”-“看一看”浏览“朋友在看”
![image113](17ae0424b050407a821cea025ffaf1d9.png)
前往看一看
**看一看入口已关闭**
在“设置”-“通用”-“发现页管理”打开“看一看”入口
[我知道了](javascript:;)
已发送
取消
#### *发送到看一看 *
发送
Oracle19c RAC for Centos7.6 详细安装文档 \| 周末送资料
最多200字，当前共字
发送中

微信扫一扫  
关注该公众号

微信扫一扫  
使用小程序
[取消](javascript:void(0);) [允许](javascript:void(0);)
[取消](javascript:void(0);) [允许](javascript:void(0);)
[知道了](javascript:;)
**长按识别前往小程序**

[\<From: https://mp.weixin.qq.com/s/khj1T1woAuWyhRXtx2qemg\>](https://mp.weixin.qq.com/s/khj1T1woAuWyhRXtx2qemg)
