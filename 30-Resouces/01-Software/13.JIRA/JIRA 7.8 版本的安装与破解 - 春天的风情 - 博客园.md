---
title: JIRA 7.8 版本的安装与破解 - 春天的风情 - 博客园
updated: 2026-06-06T10:05
created: 2019-07-27T17:33:20
---

JIRA 7.8 版本的安装与破解 - 春天的风情 - 博客园
星期六, 七月 27, 2019
9:33 上午

已剪辑自: <https://www.cnblogs.com/houchaoying/p/9096118.html>
jira的运行是依赖java环境的，也就是说需要安装jdk并且要是1.8以上版本
![image1](f69781c2c6ec4c29826d5cc2c7c3427c.png)

除此之外，我们还需要安装MySQL，为jira创建对应的数据库、用户名和密码，如下：
注意：建库名jira,字符集为UTF-8
mysql -uroot -p'kans123QWE' -e "create database jira default character set utf8 collate utf8_bin;grant all on jira.\* to 'jira@’%' identified by 'jirapasswd';"

![image2](3051b3f977bd4af2a06bd30e0e6e74a6.png)
![image3](70004987755a49f6af83bdaa1bf62241.png)
![image4](4118010eac06456f974da14c6ffb4d91.png)

以上环境准备完毕后，我们现在开始下载并安装jira。
**查看Linux系统是多少位的下载相应的版本**
**　　**
![image5](c371dbf3dd8f49728e0fd43cedb06e95.png)
jira 的下载网站
<https://www.atlassian.com/software/jira/update>
![image6](2ebfda64799d470f98dc3e1e7785c4d4.png)

wget <https://downloads.atlassian.com/software/jira/downloads/atlassian-jira-software-7.8.1-x64.bin>
![image7](df07fcb1688d4a78bbb1104f1b3f7dea.png)
现在下载完成后开始安装jira
![image8](6d6d622ed23b496183f7a00392bb2a39.png)
![image9](162f38db60e940e997b422a86e794818.png)
![image10](6f38743b15994dbc854cdafe574acb1c.png)
![image11](cf02d56beb7649f99ad8241685481446.png)
![image12](88a6bd90a8de42699f6ebf89df612327.png)

通过上图，我们可以很明显的看出jira安装到了/opt/atlassian/jira和/var/atlassian/application-data/jira目录下，并且jira监听的端口是8080。
jira的主要配置文件，存放在/opt/atlassian/jira/conf/server.xml文件中
vim /opt/atlassian/jira/conf/server.xml
![image13](2925a42d09c340c4a8b1502eaaf9bdb2.png)

现在启动
![image14](dfb814f515744d33937ad099c48339b8.png)
![image15](def840aeead2474c85898ab7da38f332.png)

现在我们先关闭jira，然后把破解包里面的atlassian-extras-3.2.jar和mysql-connector-java-5.1.39-bin.jar两个文件复制到/opt/atlassian/jira/atlassian-jira/WEB-INF/lib/目录下。
其中atlassian-extras-3..2.jar是用来替换原来的atlassian-extras-3.2.jar文件，用作破解jira系统的。
而mysql-connector-java-5.1.39-bin.jar是用来连接mysql数据库的驱动软件包。
关闭
![image16](83c972a552044d418a060420f6fbb6a2.png)
在/opt/atlassian/jira/atlassian-jira/WEB-INF/lib/这个目录下，找到atlassian-extras-的包看看是3点几的 然后现在对应的破解包，替换这个
![image17](ba68184ac28e4bcbbe52f698513074e0.png)
替换
![image18](5b9f881fdaf545cba57c8059b15cef1f.png)
放置连接mysql数据库的包
![image19](21d4b34ce95a41c09762263c4c177a43.png)

然后启动 就可以ip:8080访问了
![image20](88e3a6ddea3b47959c716a5b03929809.png)
ip:8080页面安装
![image21](659f65b0bf1744d48e539cdead7a2626.png)

![image22](c7c0d5583c7b4750bf2794b49875bb78.png)

填写好后测试连接一下看看是否成功，在下一步
![image23](1b9c6a03f01b4652a65035fa58d0ce64.png)
然后下一步，因为要初始化数据库 要等会
![image24](9333db90ee0a49aeb6446ee854a65945.png)

而连接数据库的配置是/var/atlassian/application-data/jira/dbconfig.xml，如下：
cat /var/atlassian/application-data/jira/dbconfig.xml

![image25](c819e91e6bf04c0c99bbc8ef927b1c99.png)
下面的配置就比较简单了，自定义也可以，默认也可以。
![image26](8acbaf4adbd84948a96f15c59871b2e3.png)

注意：上图中的Mode中，我们在此使用的是Private（私有）模式，在这个模式下，用户的创建需要由管理员创建。而在Public（共用）模式下，用户是可以自己进行注册。
下面这个页面是需要我们输入jira的license，如下：

![image27](37085ed3890e48abab93c53143e27ad8.png)

注意：上图中的Server ID：BSG9-24QF-8M40-O1CT
因为我们没有正式的license，所以需要我们在jira官网注册一个账号，然后利用这个账号申请一个可以试用30天的license，点击生成jira许可证。如下：

![image28](800615cf3ed346959da8fa03e451acc0.png)
注意：这个图中的Server ID就是我们上面刚刚截图的Server ID。
![image29](c295231cdcaa4f7484e787191bbb9db4.png)
点击yes 上面的key 就会自动复制到你的许可征
![image30](e602844f988c4187b83c555bc89588af.png)
密码我设的lilili用户lili

![image31](28a2ed48a4a942c0818b449e8449cf13.png)

![image32](2e1c2b27cc804f0cbc444805eab9ccdd.png)
![image33](fca1a4e866fb4dfcabe9d7d365c6e29e.png)
![image34](edebb4906cb04f32b587b8246e6d3cff.png)

创建第一个项目，如下：
![image35](b5663f874939401485f7d37ff4bf18a0.png)

![image36](6a71d837f7c8469e90ae19d48ae82966.png)

![image37](b4c5bf5d453041fcaa62b4587116ae48.png)
![image38](6cf2b78bade84d71aca39bfda754e234.png)
![image39](0eeb9d041cd74c5d92fe495b8d820d12.png)
到此 jira 7.8的安装就好了，现在看看jira的破解
破解jira，其实我们已经破解了在前面复制atlassian-extras-3.1.2.jar到/opt/atlassian/jira/atlassian-jira/WEB-INF/lib/目录下时，再次启动jira时就已经破解了。
我们现在登陆到jira中查看授权信息，如下：
![image40](2454addc12aa4ddebe211fd250f0f362.png)
![image41](190d6211eb524f50871136cd1ee33a1f.png)

通过上图，我们可以很明显的看到jira我们可以使用到2033年，。到此有关jira的安装、破解就已经全部结束。
如何修改内存？
vim /opt/atlassian/jira/bin/setenv.sh
![image42](5cec24eb7a304b75967bc1355f5d76cc.png)

日志查看：
tail -f /opt/atlassian/jira/logs/catalina.out

