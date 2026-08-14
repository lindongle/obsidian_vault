---
title: (26条消息) Sql Server 2019 详细安装教程_万里赴长安的博客-CSDN博客_数据库...
updated: 2026-06-06T10:05:34
created: 2026-07-05T17:04:54
---

(26条消息) Sql Server 2019 详细安装教程_万里赴长安的博客-CSDN博客_数据库2019安装教程
2022年4月26日
0:16
已剪辑自: <https://blog.csdn.net/SR02020/article/details/105361807>
- [安装完成后校验](https://blog.csdn.net/SR02020/article/details/105361807#_2)
- [准备](https://blog.csdn.net/SR02020/article/details/105361807#_5)
- 

- 

- 

- [需要设备](https://blog.csdn.net/SR02020/article/details/105361807#_6)
- [检查.NET 35 环境](https://blog.csdn.net/SR02020/article/details/105361807#NET_35__8)
- [自定 jdk](https://blog.csdn.net/SR02020/article/details/105361807#_jdk_13)
- [下载](https://blog.csdn.net/SR02020/article/details/105361807#_18)
# <span style='color:#1E4E79'>安装完成后校验</span>
**该步骤请在以下步骤全部操作完成后再看**
# <span style='color:#1E4E79'>准备</span>
#### *<span style='color:#5B9BD5'>需要设备</span>*
- WIN 10 电脑一台
#### *<span style='color:#5B9BD5'>检查.NET 35 环境</span>*
**检查.NET35环境是为了降低安装过程中的错误率**
- 参考链接：[win 10 .NET35 环境安装](https://blog.csdn.net/SR02020/article/details/105357669)
#### *<span style='color:#5B9BD5'>自定 jdk</span>*
**配置jdk是为了在安装过程中使用自己的jdk，Sql Server 2019 自带 jdk11 版本很新，如果不学习java编程的小伙伴或者不想麻烦的小伙伴，这步可以跳过**
- 参考链接：[win 10 配置jdk8 环境 变量](https://blog.csdn.net/SR02020/article/details/105361261)
# <span style='color:#1E4E79'>下载</span>
- 进入微软下载官网：[点此进入](https://www.microsoft.com/zh-cn/sql-server/sql-server-downloads)
- 找到如图位置点击
![image1](f108e165f4ec499aa19e8d2efa901544.png)
- **如下图点击下载SQL Server Managment Stdio会弹出另一个页面，先让他后台加载，再点击在windows上安装，**
![image2](502c35db2c6f479c83a84139a1dd5913.png)
- 点击 SQL Server-\>SQL Server 2019
![image3](c494192ac635494b9452e69f0a74b5b6.png)
- 点击continue继续
![image4](74e9188ea5194ae795edcf092992c768.png)
- 下面这些随便填（没啥用），填完后继续
![image5](2600db30fe494aa89d362ad43303566e.png)
- 点击Download下载，然后先然他下载，往后看
![image6](2780f13c84af4f1281d97368f5250e4e.png)
- 打开刚才打开的另一个页面（不知道请往上翻看第二张图的步骤），·找到中文点击下载
![image7](b52e8584e4434de9be6b040026d6aed2.png)
- 下载好后有这样两个文件
![image8](80c4f513ac31437385e7e0fab6430aee.png)
- 右键以管理员运行第一个**SQl2019-SSEI-Eval.exe**，选择自定义安装，媒体位置你可以根据需要更改
![image9](3b4a315f32864e0b93a466bb8dfe9044.png)
- 点击安装-\>全新SQL Server 独立安装…
![image10](27a395d787424605b02dffd51374d0cb.png)
- 选择 Developer，下一步（由于步骤很多，我没有提到的步骤可以直接下一步）
![image11](b2cbc2754f4f4d5387e6ae53a815d474.png)
- 接受条款，下一步
![image12](4cff32f91b3a4bb1a0af1e6e1931243c.png)
- 在此界面先点击下方的全选，然后将不必要的组件去掉，可以参考我的，红框部分可以全部去掉，下面的安装目录可以默认也可以自定，为了组件安全，新手建议默认
- 这里安装会占用10-13GB的内存空间，如果你的C盘不够大，建议更改目录，务必将目录位置放置在比较安全的位置（任意组件遭到破坏可能无法使用）
![image13](9a3388f5fd124bdc86d44e7a05d1874e.png)
- 注：我没有写的部分直接下一步
- 这里如果你在开始配置了或者本来就有jdk，请选择自己的jdk目录，没有请默认不改，然后下一步
![image14](5dce53dc5d6143a88336cf6b1bca978f.png)
- 选择混合模式，点击添加当前用户，在账户中输入密码，然后下一步
![image15](21f19dabaa1d44b18b6821929f4a3a1b.png)
- 添加当前用户，下一步
![image16](20ceb02a55ad47838bad4e841737c0de.png)
- 添加，下一步
![image17](d94bee7d3e6a4297aec0deec97e0c189.png)
- 控制器随便起个名，下一步
![image18](2420c463dc594455b1ca16474a023a84.png)
- 安装
![image19](1f6a25491bf641c8988ebc69e55628b8.png)
- 等待安装
- 安装完成后小窗点击确定，然后点击关闭（安装完成）
![image20](ead8566324f444c7b95ce3b47849aea6.jpg)
- 等待上述安装完成
- 右键管理员运行此文件
![image21](8d41dfe0da5b48288dc08b11141cd1fa.png)
- 可以自定义位置也可默认，然后安装
![image22](10b0fb03db064aab87ffc0966ecce64f.png)
- 等待安装完成 ，会提示重启，重启就好，Sql Server 2019 安装完成！
