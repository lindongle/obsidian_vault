---
title: DeepSeek本地部署教程，打造自己的“AI专属管家”！【低配电脑也能装】2025-09-05T0...
updated: 2026-06-13T22:08:29
created: 2026-07-05T17:04:52
tags:
  - TC
---

DeepSeek本地部署教程，打造自己的“AI专属管家”！【低配电脑也能装】2025-09-05T08:11:49.685Z
2025年9月5日
8:12

源网页：https://mp.weixin.qq.com/s?\_\_biz=Mzg5MTk0NDY5MQ==&mid=2247504066&idx=1&sn=de45d325b0716d8c06fa246f0456f294&chksm=ce44ae5ea3b11569e593a5b353757822fcc118d139eeae3110afa13ce193c5ff11e2ffdbf4e2&mpshare=1&scene=1&srcid=09059xnNpYYVQ4vR0Ggqd74O&sharer_shareinfo=3eef05c2b92edc9dff67c27a1df8fbe2&sharer_shareinfo_first=3eef05c2b92edc9dff67c27a1df8fbe2#rd
**网页内容：**
公众号名称：软件管家服务站
作者名称：管家服务01
发布时间：2025-09-01 07:31
![image1](728c32d1a01e4b5ca69c0ec97f1db1dc.gif)

![image2](e63a977792394203ba20803b0f82785d.png)

**软件介绍**

| DeepSeek（深度求索）是一款由杭州深度求索人工智能基础技术研究有限公司开发的人工智能大模型，能够理解自然语言及生成高质量文本内容。DeepSeek 作为一款开源且性能强大的大语言模型，支持灵活的本地部署方案，用户可以在本地环境中高效运行模型，无需支付在线 API 费用。模型部署完成后无需联网也可流畅运行，避免“服务器繁忙”"打造自己的AI管家"。本平台所提供的文件均为压缩文件，如果电脑上没有此软件，可[点此下载安装](https://mp.weixin.qq.com/mp/appmsgalbum?__biz=Mzg5MTk0NDY5MQ==&action=getalbum&album_id=3780715609516687362&token=1076718500&lang=zh_CN#wechat_redirect)。 |  |
|----|----|
| 语言：中文/英文 | 大小：929M |
| 安装环境：windows10及以上 |  |
| 配置要求：<span style='background:white'>CPU@2+GHz，内存@4G(或更高)</span> |  |
| 百度网盘下载地址<span style='color:#7A4FD6'>（复制到浏览器打开）</span>： |  |
| <https://pan.baidu.com/s/1duPVLXUvsoNIBdwQkfwKHA?pwd=xx9a提取码>: xx9a |  |
| 其他说明： |  |

<span style='color:red'>***<u>为避免链接失效，先转存到自己的网盘再下载。</u>***</span>

**安装说明**

<span style='color:red'>**第一步：下载软件**</span>

1.1：下载软件，为避免链接失效，先转存到自己的网盘再下载。（注：网盘扩容：使用手机APP注册并登录网盘，送100G网盘空间。）

![image3](cfa7866399494232afdcd813dcc71e61.png)

1.2：将下载好的文件选中，右击，解压到……

![image4](9d1f3c5b94dd4ff488d741f8f8ed61a2.png)

<span style='color:red'>**第二步：安装Ollama工具**</span>

2.1：打开解压后的文件夹，选中【setup】安装程序，右击【以管理员身份运行】。

![image5](abf93f7875b84460b031a0797b2416fd.png)

2.2：点击【Install】。

![image6](8e43edc2d1154932a789f93d76be7d3a.png)

2.3：等待安装完成。（<span style='color:red'>注：安装完成后，此界面会自动关闭。</span>）

![image7](a23d4bce7f0b4c05895a3a976cada004.png)

2.4：电脑【开始】菜单，右击鼠标，选择【Windows PowerShell（管理员）（A）】，有的叫【终端管理员】。

![image8](556b269b783c4cb881e2a5ec278c4815.png)

2.5：输入【<span style='color:#AC39FF'>ollama help</span>】，然后按键盘上的【回车Enter】键，如下提示，说明安装成功。

![image9](d880cf11385b42e2a63cd14f46a511bc.png)

<span style='color:red'>**第三步：安装DeepSeek模型**</span>

<span style='font-size:10.5pt'>3.1：</span><span style='font-size:11.0pt'>打开模型的官网地址：</span><span style='font-size:11.0pt;color:red'>https://ollama.com/library/deepseek-r1</span>

根据自己的电脑配置，下载对应的模型版本，本案以1.5b为例，打开后，复制对应版本的名字，如下图所示。

![image10](6a94f1ff79c44c4cb3d187b80742a72b.png)

附：各模型版本说明  

| <span style='color:white'>**模型版本**</span> |
|-----------------------------------------------|

| <span style='color:black'>**模型版本**</span> | <span style='color:black'>**所需空余空间**</span> | <span style='color:red'>**部署命令**</span> | <span style='color:black'>**配置说明**</span> |
|----|----|----|----|
| <span style='color:black'>1.5b</span> | <span style='color:black'>1.1GB</span> | <span style='color:red'>ollama run deepseek-r1:1.5b</span> | <span style='color:black'>适用于内存为4G的电脑，参数规模较小，适合轻量级任务。</span> |
| <span style='color:black'>7b</span> | <span style='color:black'>4.7GB</span> | <span style='color:red'>ollama run deepseek-r1:7b</span> | <span style='color:black'>适用于内存为16G的电脑，参数规模适中，适合中等复杂度的任务。</span> |
| <span style='color:black'>8b</span> | <span style='color:black'>4.9GB</span> | <span style='color:red'>ollama run deepseek-r1:8b</span> | <span style='color:black'>适用于内存为16G的电脑，参数规模适中，适合中等复杂度的任务。</span> |
| <span style='color:black'>14b</span> | <span style='color:black'>9GB</span> | <span style='color:red'>ollama run deepseek-r1:14b</span> | <span style='color:black'>适用于内存为16G的电脑，参数规模较大，适合较高复杂度的任务。</span> |
| <span style='color:black'>32b</span> | <span style='color:black'>20GB</span> | <span style='color:red'>ollama run deepseek-r1:32b</span> | <span style='color:black'>适用于内存较大的电脑，参数规模大，适合高复杂度任务和高准确性要求。</span> |
| <span style='color:black'>70b</span> | <span style='color:black'>43GB</span> | <span style='color:red'>ollama run deepseek-r1:70b</span> | <span style='color:black'>适用于内存较大的电脑，参数规模极大，适合极高复杂度任务和高准确性要求。</span> |
| <span style='color:black'>671b</span> | <span style='color:black'>404GB</span> | <span style='color:red'>ollama run deepseek-r1:671b</span> | <span style='color:black'>基础大模型，参数数量最多，模型容量极大，适合处理海量知识和复杂语言模式的任务。</span> |
<span style='color:red'>**配置说明：**</span>
<span style='color:black'>1.5b、7b、8b、14b、32b、70b 是蒸馏后的小模型，适合不同内存配置的电脑，适用于不同复杂度的任务。671b 是基础大模型，参数数量最多，模型容量极大，适合处理海量知识和复杂语言模式的任务，但对硬件要求极高。</span>

3.2：返回刚刚的【Windows PowerShell（管理员）（A）】或【终端管理员】工具界面，输入【ollama run<span style='color:red'>对应模型的版本名字</span>】，如【ollama rundeepseek-r1:1.5b】，并回车，会有如下安装提示，等待安装成功即可。

![image11](995fb210d9e9472eadeb17c1efb803cc.png)

3.3：等待安装。根据版本不同，模型有大有小，速度有快有慢。

![image12](ec107477a19d4f4aaec9550f03fdecbf.png)

3.4：提示【success】，说明安装成功。

![image13](2e0ee3631a8a491e9472a0c0040d5498.png)

3.5：输入任意文字，即可对话使用了。

![image14](862a5ed9de454fcca353a568d9a8c6b6.png)

3.6：每次使用时，在【开始】处右击，选择【windows powershell】或【终端管理员】，进入终端工具，输入【ollama run<span style='color:red'>对应模型版本</span>】，如【<span style='color:red'>ollama run deepseek-r1:1.5b</span>】即可进入对话模式。

![image15](b22a05a8b059456cabee938658da2e3a.png)

<span style='color:red'>**第四步：安装可视化工具：Chatbox**</span>

4.1：返回刚刚下载并解压的文件夹，找到【Chatbox-1.15.4-Setup】右击【以管理员身份运行】。（如有新版，可更新。）

![image16](58997f3d1ebc4e77ad4c5e69155516f5.png)

4.2：点【下一步】。

![image17](197e0d15b3984615994a8f58a46eaac2.png)

4.3：将安装位置改为D盘，然后点【安装】。

![image18](ae0a71f7c8324366bb2c3d3a4c406582.png)

4.4：等待安装完成。

![image19](482b42eb1f134d3bb91afde8d71c4d31.png)

4.5：勾选【运行】，然后点【完成】。

![image20](037e9411e7b24199a8682a445237670b.png)

4.6：选择【使用自己的API Key或本地模型】。

![image21](d369ac1b784f4ff593746b2679d4c28d.png)

4.7：选择【ollama API】。

![image22](40744c3101b043ce9a954b1504673f31.png)

4.8：选择【deepseek-r1:1.5b】，然后点【保存】。

![image23](5da5890d643f4f1f866f4c9e2d12b17a.png)

4.9：即可正常使用了。（后期在桌面图标打开即可。）

![image24](c485004e95684aaebeb5d61496c54688.png)

<span style='font-weight:bold; font-size:12.0pt;color:#548DD4;background:white'>END</span>  

![image25](b6f8ace8dcd14360809be57a6721043c.jpg)
<span style='font-size:7.5pt; color:#333333;background:#F2FEFF'>免责声明：软件资源均来源于网络，仅供交流学习交流，版权归属原版权方所有，版权争议与本公众号无关，下载后不可商用或非法用途；如果您访问和下载此文件，视同同意本声明，一切后果自行承担。支持正版软件，购买注册。</span>

**网页截图：**
[Webpage.html](173112b17ec347e78f9a85c6c9540753.html)
