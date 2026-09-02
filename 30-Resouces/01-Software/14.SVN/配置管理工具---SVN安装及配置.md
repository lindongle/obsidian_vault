---
title: 配置管理工具---SVN安装及配置
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:04:55
---

已剪辑自: <https://www.cnblogs.com/Ceslie-zhang/p/8544379.html>
# 软件开发的过程是个复杂、耗时、耗力的过程。通常要有很多开发人员参与编写代码。
## 这样就会出现种种代码管理混乱的问题，这些问题容易引发BUG，增加开发人员的工作量，增加软件开发与维护的成本。因此项目中会使用配置工具管理这些代码，解决上诉问题。
### 市面上常用的两种配置管理工具：SVN，GIT
### 这边文章要和大家介绍的就是SVN

**什么是SVN呢，下图给出了SVN与开发们之间的关系**
![image1](dfcfbd9803e14d5bad6c3b4124af84ec.png)
**SVN的作用：**
解决代码管理混乱问题  
不用备份多个版本，占用磁盘空间大  
解决代码冲突  
不易引发bug  
可以追溯问题代码的修改人和修改时间  
容易恢复至以前正确版本  
可以进行权限控制  
降低项目版本发布难度

**如何使用SVN呢？**
**一、环境配置**
1\. 安装SVN服务器
双击打开SVN服务器安装程序

![image2](4a8eb9917b5447ffbb677bc4f47a6e7e.png)

点击“Next”按钮

![image3](4e49db76b3ec488db9f3012db768aeac.png)

勾选“I accept the terms in the License Agreement”复选框，点击“Next”按钮

![image4](c83406fcff2249a29bde71bc09236407.png)

勾选“VisualSVN Server and Administration Tools”单选框并勾选“Add Subversion command-line tools…”复选框，并点击“Next”按钮

![image5](907e6fdcf94545d79515067203a6b9e1.png)

点击“Standard Edition”按钮，选择安装类型

![image6](c8b3554aca0442ea8046ec90d16c360e.png)

选择好程序安装路径和后续项目的文档存放文件的位置和端口号后点击“Next”按钮

![image7](4b326a8739ce4986aa41fe05b4bce625.png)

如下图显示443端口被占用，点击“OK”按钮

![image8](b1c67d85ef9044b0b93f42834cbb93e0.png)

修改端口为8443，点击“Next”按钮

![image9](9f0e13259702494fa425e6a55050549b.png)

点击“Install”按钮

![image10](463a7f66c82649438c3e99cbb0c67a0f.png)

等待安装

![image11](4ef33a2f04dd4109b064369d830dab9a.png)

安装完成，不选中复选框，点击“Finish”按钮
![image12](2eb91a877961499e87c4223f36c385ae.png)
我们进入之前选择的程序安装路径下的bin目录看是否有svnadmin.exe和svnserve.exe两个文件

![image13](2af7bdffc985429b99b6df5a895c1902.png)
![image14](f4b1179096e44e919cf6f6fcb4a1ada0.png)
设置环境变量的目的就是使得程序安装路径 D:\Program Files\VisualSVN Server\bin 下的svnadmin.exe和svnserve.exe两个程序可以直接使用

2、安装SVN客户端
双击“TortoiseSVN”客户端安装程序

![image15](dc23056c52c34ddc86ef05edccfb7330.png)

等待安装

![image16](fe61a4ad44a6418f818163442352249d.png)

点击“Next”按钮

![image17](32306f6ce4e24ec88a8a1d373a17f4d8.png)

点击“Next”按钮
![image18](2352bdefebfc498aaafe6de562a30c24.png)

选择客户端程序的安装路径（可以根据个人喜好选择，小编选择了D:\Program Files\TortoiseSVN），再点击“OK”按钮

![image19](a9e77c868f154f58a6e537b9c129e42c.png)

跳转到了之前的界面，可以看到路径已经更改成功了，点击“Next”按钮
![image20](33a3d762542c439c98dcdd0bef26b137.png)

点击“Install”按钮

![image21](a34b4deffb6744da98b4f83074ceb39b.png)

等待安装

![image22](9e4f533fb35e4919a85cddb82fdcbc7e.png)

安装完成，点击“Finish”按钮

![image23](d9c59141aa9e41d59a5a18abadf4e04d.png)

桌面右击，菜单栏里显示有“TortoiseSVN”，表示SVN客户端安装成功

![image24](1d3f169e5c814d808e60bae36f5787df.png)

**二、SVN Manager工具在SVN服务器上创建用户、组、版本库并设置版本库的访问权限**
服务器安装完成后，我们在服务器上创建用户、组、版本库并设置版本库的访问权限
1、打开SVN服务器管理程序
点击开始菜单---点击“所有程序”---点击“VisualSVN”---点击“VisualSVN Server Manager”启动SVN服务器管理程序

![image25](6329fe72832d46059bf35fa08b4347e4.png)

跳出SVN服务器管理界面

![image26](7bd914f88f554a8697ac458c42faaa1b.png)

2、服务器中创建用户
右击左侧导航栏中的“Users”，点击"Create User…"创建新用户

![image27](45644fc4ae154a18aff76c2d7ed08918.png)

跳出创建新用户窗口，输入即将创建的用户名，用户密码，并确认密码（通常用户名和密码都是参与项目的，并使用SVN这个工具的人员进行设置的）

![image28](c60ba6f782a44addb1a1877ff4f8a0df.png)

小编随手创建的几个用户

![image29](9719b37c70a44b1cae32f5780fd1ec08.png)

创建好了之后就可以在SVN服务器管理界面的右侧内容窗口中看到设置好的用户，下面是小编创建的几个用户

![image30](0d856e0ebf3149ad9ff60e622e644354.png)

3、服务器中创建项目组
用户创建好了之后就可以创建项目组了，右击导航栏中的“Groups”--点击“Creat Group”

![image31](8272b508e6ec4d3c9599b9024b63c777.png)

输入组名，点击“Add”按钮选择需要添加到组里的用户，再点击“ok”按钮

![image32](b540a4e183d24193b46752939b6aeece.png)

4、创建版本库并设置版本库的访问权限
右击左侧导航栏中的“Repositories”，点击“Creat New Repository”创建版本库（方便用户登录SVN配置管理器在创建的版本库中存取数据）

![image33](9ea9a8c0866d4bd1a9cc641e50ba5bd8.png)

跳出创建新仓库的界面，选择“Regular FSFS repository”（常规FSFS仓库），再点击“下一步”按钮

![image34](789e1571214b4814af64d8c98ad9737f.png)

输出即将创建的仓库名称（写当前的项目名称，便于使用和管理），再点击“下一步”按钮

![image35](57571ccd4e8f4a2e816fb318e440bf0f.png)

选择“Empty repository”（空仓库），再点击“下一步”按钮（实际公司项目选择下面一种带有目录的仓库比较多）

![image36](9752446741b14cb895b80b70285e1a9d.png)

勾选“Customize permission”（自定义权限/允许），点击“Custom…”

![image37](4a62e3561a5f436c9c31790e8b133d8c.png)

设置权限的类型（1、没有使用权 2、只读 3、读写），点击“确定”按钮

![image38](3df9ac4909e84ae09160a43890f6e441.png)

点击“Add…”按钮，选择可以拥有权限的人（可以选择整个组，也可以选择特定的用户）

![image39](fdc964ad6e0149b88ab304c736bbbbad.png)

跳转界面，显示仓库中的组已经创建成功（可以看到仓库的类型：FSFS，）

![image40](45627e5441854b559eb6fbf2c42ff9f5.png)

**浏览SVN服务器上的版本库的方式（两种）**
方法一、SVN Manager工具中，选择库后点击browse（浏览）
在SVN Manager窗口左侧导航栏中找到想要浏览的库，右击--点击browse浏览

![image41](619636c941e24448a3b910fcfd2f5f43.png)

输入用户名，密码，点击“登录”按钮

![image42](1fb93ddfa07342a3a5b9281140502010.png)

成功访问

![image43](47c8d2fceb404358bbf443f6834751f9.png)

方法二、用SVN客户端登录浏览
右击桌面---点击“TortoiseSVN”----点击“Repo-browser”

![image44](7e9e595a3b6b40ddb12fd225b8a4aec2.png)

输入要访问的版本库的URL地址，格式如下
[https://IP:端口/svn/版本库名](https://www.cnblogs.com/Ceslie-zhang/p/8544379.html)
[http://主机名:端口/svn/版本库名](https://www.cnblogs.com/Ceslie-zhang/p/8544379.html)

![image45](b22ffaf4f41a49ab8858d242ea7a2439.png)

输入用户、密码，点击“OK”按钮
![image46](b3e16d1e9ea649abba94cc2010eecec3.png)

成功登录（这边小编的版本库还是空的！）

![image47](2defe6d1f1ad44539f1a05373718dda8.png)

注意
我们使用SVN客户端访问服务器上的版本库时，必须保证服务器上的VisualSVN Server服务是开启的
我们可以打开服务窗口查看该服务是否开启，具体操作如下

![image48](c3b16ba5580149c7b25e74f9c14d8cff.png)
![image49](f421abf3f48a4792826f152c2c2f506c.png)

**版本库目录下的文件的作用**
conf文件夹---配置文件（权限）
 authz=authorization 存放用户或组的权限（读、写）
 passwd=authorization 存放用户和密码
svnserve.conf 存放SVN服务器的配置文件
 db----存放数据
hooks---钩子脚本：自动触发部署
locks---上锁

![image50](8e500e0bd1174d1486ba1a55e1bab32d.png)
![image51](350374ead87643a4880ef8d15deb830c.png)
![image52](fa6f26e0d63249129dd8c02f5dcfe642.png)
![image53](650d3fdde0bf400c89a556e0c139985f.png)
![image54](dceed2adfc184c2a8953e560cba135ab.png)
![image55](6d9f400562744562a7272065ffc0de9a.png)
![image56](e983b1b5b4904cf28a2d23930726406c.png)

**TortoiseSVN图标集**
文件夹常规：表示本地文件夹与服务器上的文件相匹配

![image57](5799ec9c8f654127ba647a4b2c609283.png)

文件夹冲突：commit本地文件夹时显示与服务器上的文件冲突（通查出现在多人同时编写同一个文本的情况下）

![image58](56cd669671d54e86aa91652019cf4ca4.png)

文件夹已删除：服务器上已经没有这个文件夹了

![image59](d3609b37a2e347358c112e2866a11cc9.png)

文件夹无版本控制：新建文件夹还未添加到服务器上

![image60](f3e38bd752444660a720096892235f71.png)

添加文件夹：在本地新建文件夹虽然add，但还未commit到服务器上

![image61](a40ced6dea644298a394f2f857de624a.png)

文件夹被修改：文件夹被修改，还未commit到服务器上

![image62](00d0fc7cf4e34b0c9dd875db5b0f2bf4.png)

文件夹只读：文件夹只允许用户阅读

![image63](b594879b7aa143ea8dee7301c9438b88.png)

锁定：文件夹被锁定，除了施加锁定的那个用户其他用户均无法修改服务器上的这个文件夹

![image64](1d9f85e5dd0f4525beeb68b69a162c91.png)

文件被修改：文件修改过后，还未commit到服务器上

![image65](0291a3c3cad44efd877e08f7b1428427.png)

文件常规：文件夹与服务器上的文件一致

![image66](5909797790d2490dbb6b7b915d112b51.png)

文件冲突：文件与服务器上的文件冲突

![image67](c4d4829a5762444fa25e61e9c753c4a4.png)

**SVN客户端基本图形化操作**
**Check out** （将服务器上的版本内容迁出到本地里）
图形界面创建的版本库的签出
方法一
在本地创建一个空的文件夹，进入文件夹后，右击空白处--点击“SVN Checkout”

![image68](37f242ba18f4447f8110a6f7a99b1993.png)

输入需要签出版本库的URL地址（格式：https://IP:port/svn/版本库名称），点击“OK”按钮

![image69](80a4fce367ac46f1822c542795131ef2.png)

输入有访问该版本库权限的用户即密码，点击“OK”按钮
![image70](071e2f63d5bd4246956a5822b40bdc39.png)

点击“OK”按钮

![image71](4d88ac0abead431893fd0d52ff34c8c1.png)
![image72](9998899e32f54b15be5fa8fd593e2b03.png)

方法二、使用客户端浏览服务器上的项目文件
桌面右击---点击“TortoiseSVN”--“Repo-browser”
![image73](c235244c6b9b44139acede62c5489769.png)

输入要访问版本库的URL地址

![image74](ab8a45716098401f90d349094669eebb.png)
![image75](a343ab52641c4e9499d5fa092d872c90.png)
![image76](7e72f36ecc074f4fab1ab40ee5022205.png)

将SVN服务器上的版本库签到本地的条件及成功状态：
1.  服务器上的VisualSVN Server是开启的
2.  本地地址的文件夹是空文件夹
3.  签出成后该文件夹会显示打勾的状态

**Add 添加文件**
在签出的文件夹里新建文件test1.txt

![image77](028ffb316d9946159b36b91abb434b47.png)

内容如下

![image78](ced794c0a94a45a28fe12278cd2c83ca.png)

右击需要添加到SVN服务器上的文件---点击“TortoiseSVN”---点击“Add”

![image79](d8b9b8f78f0d481aa65ac586d48a8b71.png)

点击“OK”按钮

![image80](25e7e47965924c298019fae9fe1f4c7b.png)

点击“OK”按钮

![image81](774f5844de334e579f74c606944c6df1.png)

添加完后的文件图标会从问号变为加号

![image82](0c466e99fa3141a6a8c4394491ed796a.png)

**Commit 提交（add、修改）**
一种情况：add后commit
在我们的Checkout到本地的文件夹中新建一个test2.txt文件

![image83](e4ef5f9846d9417e89d0c5c80342e55f.png)

右击test2.txt--add

![image84](4fd95f9bb18d4b06a754f5e206f99a7a.png)

文本图标就会显示+号

![image85](70f73f9a2cbb42619e96fda585af5f40.png)

右击test2.txt---SVN Commit，提交到服务器上

![image86](a644fe93dc3946709ede6b1db8ca2ad7.png)

第二种情况：我们修改完文件，要commit到服务器上
右击要提交的文件---点击“SVN Commit”

**Update 更新**
右击要更新的文件或文件夹---“SVN Update”

![image87](a4de88408e094d9594afbaaf3a594801.png)
![image88](b3e5534cd712405e9f3a1b2ba9205b68.png)

**Delete 删除（删除之后要commit，才会生效）**
右击要删除的文件或文件夹---“TortoiseSVN”---“Delete”

![image89](f238232bd3f64607a3eaa62d6275dc26.png)

**Rename 重命名（从命名后空白处右击commit）**
改名后需要在空白处右击--点击“SVN Commit”或者进入上一层目录右击---点击“SVN Commit”
将文件名由“test2.txt”改为“test.txt”

![image90](a12d6a460b964875a38e154dfa963d32.png)
![image91](3e910ff90ac149d1ae0a1b3aaacea6eb.png)

空白处右击---点击“SVN Commit”或者进入上一层目录右击---点击“SVN Commit”

![image92](93cff9a7cba642ed8d6da8aa9b222818.png)

**Revert 还原（恢复到文件修改之前的版本）**
修改文件内容后，在未commit之前，我们可以右击文件---“TortoiseSVN”---“Revert”将文件还原到修改内容之前的文件版本
![image93](fcc783d1fda948aabaa08dd668109b7e.png)

**Show log 显示日志**

export（导出，但不在版本库内，修改不影响版本库）
方法一、登录SVN客户端，右击要导出的文件所属的文件夹---点击“Export”---选择存放的本地路径
方法二、右击Checkout到本地的文件夹---点击“TortoiseSVN”---点击“Export”---选择存放的路径

**Import 导入**
右击要导入的文件所在文件夹，点击“TortoiseSVN”---“Import”

![image94](8a631558c2e54165a6015f1d41be7892.png)

**Get lock 锁定（锁定后的文本其他人编译后无法commit）**
右击要锁定的文本---点击“TortoiseSVN”---点击“Get lock”

![image95](2db9477d89044586ac6d5804f6f61bc9.png)

**Release lock 解锁（锁定的人主动解锁后，其他人可以编译并commit）**
右击锁定的文本或文件---点击“TortoiseSVN”---点击“Release lock”

![image96](7145aef404784d0abe078beb0d41b805.png)

**Diff 差异比较**
右击要进行差异比较的文件---点击“TortoiseSVN”---选择一种差异比较方式

![image97](d4439a4737f5416389a33c01dfc91826.png)

**Edit Conflict 处理冲突**
1、两个开发编写同一个代码文件
2、第一个开发编写好代码后commit 提交到服务器上
3、第二个开发未先Update，也直接修改了文件，然后commit，提交到了服务器上
4、提示需要先Update，但选择Update后提示无法更新，有Conflict
5、这是第二个开发需要解决冲突，本地文件中会出现以下的几个文件

![image98](5cffe485d9484d218056a7f01d2d822b.png)
6、右击需要解决冲突的文件（有冲突的文件上会有黄色感叹号的标志）---点击“Edit conflict”
7、根据冲突内容人工判断解决，最后commit

**Update to revision（更新版本到哪个版本）**
右击需要更新版本的文件---点击“TortoiseSVN”---点击“Update to revision”

![image99](a0d4fe72946b4b15896afcfcc73af893.png)

可以通过show log 查看文件的日志信息，便于回到哪个版本的文件

![image100](8b3a125d324048e99fa646a1ecdb42b0.png)

**relocate（服务器IP地址变了，可以用来更新地址）**

工作当中要养成习惯，工作之前先Update，再锁定
增、删、改都要commit

**用命令行创建版本库**
1、建立版本库
打开dos命令窗口，输入svnadmin create e:\Repositories\版本库名称
（Repositories指的是服务器安装时指定的版本库目录，这里输入的路径要和安装服务器时指定的路径一样）
2、配置e:\Repositories\conf文件夹下的三个文件
Svnserve.conf：SVN服务器的配置文件，讲一下配置取消注释

![image101](2bcef7fc64ee402391e396f46203dd71.png)

passwd：存放用户和密码，如增加一下用户和密码

![image102](8af1ee3277514e9eaf63dd5e80e77dda.png)

authz文件：存放用户或组的权限（读、写），配置如下

![image103](fb1bccfe249a47fab9aa7555e33d4bfc.png)

3、启动服务
输入svnserve -d -r e:\Repositories
-d指服务作为一个独立的端口监控进程，--r即批定要暴露的仓库路径，如本机仓库路径为E:\Repositories\项目，那么客户端svn访问时只需采用如下地址即可访问：svn://ip/项目，E:\Repositories 就不需要展示出来，客户端svn访问时只需采用如下地址即可访问：svn://ip。（注意，ip后面不要跟端口号）

如果输入svnserve -d -r e:\Repositories\版本库名称
![image104](b60dd107e69a478c98ca93fc5cc508eb.png)

**Subversion的标准目录结构**
Trunk-----主开发目录
Branches-----分支开发目录
Tags----tag存档目录，不允许修改

![image105](4b4abaf3f93a4427acffd5856bca2114.png)

