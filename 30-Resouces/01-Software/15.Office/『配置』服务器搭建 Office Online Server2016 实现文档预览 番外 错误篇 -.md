---
title: 『配置』服务器搭建 Office Online Server2016 实现文档预览 番外 错误篇 -...
updated: 2026-06-06T10:05
created: 2020-07-02T00:44:31
---

『配置』服务器搭建 Office Online Server2016 实现文档预览 番外 错误篇 - 啊喜桑axis - 博客园
2020年7月2日
0:44
已剪辑自: <https://www.cnblogs.com/pukua/p/11864340.html>
### <span style='color:#5B9BD5'>*1*\|*0*1、安装一个或多个角色、角色服务或功能失败。找不到源文件。请再次尝试在新的“添加角色和功能”向导会话中安装角色、角色服务或功能，然后在向导的“确认”页中单击“指定备用源路径”以指定安装所需的源文件的有效位置。目标服务器的计算机帐户必须能够访问该位置。</span>
![image1](b3188aade4ba421091a32439d5572fd8.png)
**解决方案：**
以管理员的身份打开PowerShell，然后复制下面这段话（不要一行一行复制，直接全部复制粘贴）
　　Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name UseWUServer -Value 0 Restart-Service -Name wuauserv Install-WindowsFeature Net-Framework-Core Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name UseWUServer -Value 1 Restart-Service -Name wuauserv　　
[方案来源：https://shiyousan.com/post/636311560390538452/](https://shiyousan.com/post/636311560390538452/)
[方案来源：https://www.wanweiwang.cn/FAQ/view/1006.html](https://www.wanweiwang.cn/FAQ/view/1006.html)

### <span style='color:#5B9BD5'>*2*\|*0*2、windows server 2016 创建域 遇到 域控制器升级的先决条件验证失败 Administrator 密码为空白</span>
![image2](ded9dbd1612848978059f7fe407da077.png)
**解决方案：**
1、
![image3](f360c9bd25d54270b0db4eff46371920.png)
2、
![image4](0311d385786646bfb6a69408439b99c1.png)
3、
![image5](3518dc59b1bb4e8c8ed9ed6a7b494cff.png)

### <span style='color:#5B9BD5'>*3*\|*0*3、无法与域“\*\*\*\*”的Active Directory域控制器（AD DC）连接</span>
![image6](b308c5f42a0b43aab8e1ee4e48adf9ea.png)
**解决方案:**
请不要怀疑，就是你在配置转换服务器时DNS配置错了，你验证一下的地址和DNS地址是否输入正确。
检查地方如下图：
![image7](02a71e2755fa4fcf995ec186f605e12c.png)

### <span style='color:#5B9BD5'>*4*\|*0*4、域控制器升级的先决条件验证失败。证书服务器已安装。</span>
![image8](82957388cf9542028908e5c10fba2224.png)
**解决方案：**
提示比较明显，就是你已经安装了证书服务，你要卸载你的证书服务才能继续往下走。
Remove-WindowsFeature -Name AD-Certificate

### <span style='color:#5B9BD5'>*5*\|*0*5、“墨迹和手写服务”Windows 服务器不满足一下先决条件</span>
![image9](ca023e2a80a34e2dbbc4c2d4c5edab89.png)
**解决方案：**
如果是**Windows Server 2012 R2**系统，你需要再去**服务器管理器**添加一下“墨迹与手写服务”：
![image10](bee6ca48415e45bf811bd771aebe6631.png)
如果是**Windows Server 2016/2019**系统，你需要升级一下你的Office Online Server版本：
可去百度云盘下载：https://pan.baidu.com/s/1SgUm8tRvMWIvp2GRorwAXQ 提取码：fdug

**6、文件太大 指定文件大于Office Online Viewer 配置所支持的文件。减少要联机查看的文件的大小。**
![image11](82b81cb27eb543d0bd2da9be90ccdb06.png)
**解决方案：**
安装后的office online server 对大文件会有限制，所以需要配置才能进行访问，具体配置路径如下
![image12](78230feace9b4ea893ab2c3531b40184.png)

![image13](87370c4754bb4b31886c3c3fc4a25ef7.png)
将上面两个文件夹中的Settings_Service.ini文件进行修改，在文件最后填入以下内容并保存，注意后面不要加分号。
OpenFromUrlMaxFileSizeInKBytes=(System.Int32)512000
配置完成后使用CMD命令，输入services.msc打开服务，重启office online服务
![image14](0a0e0c1808fb4236a726873f093c8a01.png)
　　　　
### <span style='color:#5B9BD5'>*6*\|*0*7、输入http://192.168.128.160/op/generate.aspx之后显示“服务器错误</span>
![image15](887d778912a2414ab7acd1c4e7471f89.png)
**解决方案：**
输入**Set-OfficeWebAppsFarm -OpenFromUrlEnabled:\$true**即可解决问题
![image16](9c478bd946824f27b78b9c4819902516.png)

### <span style='color:#5B9BD5'>*7*\|*0*8、根据域名访问office文件</span>
① 由于微软这款软件对IP有访问限制，所以需将IP转化为域名进行访问，所以需要进行配置，来让软件自动进行域名转化为IP，具体路径如下，找到
*（注：此IP是指要访问文档路径的IP）以记事本的方式打开hosts文件。*
![image17](f3487ed3581d4007b8d3d0f6bcf0419a.png)
② 以“记事本”的形式打开hosts文件，然后在最后一行加入一句话，如下：
（hosts文件没法直接保存在当前目录。需要以文本的形式保存到其他路径，然后再复制到原路径下）
![image18](881d71104cdd4993a3aa9cb0cc4834e0.png)
（这里的域名就是**转换服务器**的计算机全名**\*\*\*\*\*\*\*\*\*.\*\*\*\*\*.com**）

如果你有新的错误，可以联系我我更新上。

\_\_EOF\_\_
![image19](27e75b3b1ff3421cb7ad863e7e27dc81.png)
本文作者：[**啊喜桑axis**](https://www.cnblogs.com/pukua/p/11864340.html)  
本文链接： <https://www.cnblogs.com/pukua/p/11864340.html>  
关于博主：评论和私信会在第一时间回复。或者[直接私信](https://msg.cnblogs.com/msg/send/pukua)我。  
版权声明：本博客所有文章除特别声明外，均采用 [BY-NC-SA](https://creativecommons.org/licenses/by-nc-nd/4.0/) 许可协议。转载请注明出处！  
声援博主：如果您觉得文章对您有帮助，可以点击文章右下角**【推荐】**一下。您的鼓励是博主的最大动力！  

