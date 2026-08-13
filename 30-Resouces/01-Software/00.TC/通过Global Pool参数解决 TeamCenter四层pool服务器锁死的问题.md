---
title: 通过Global Pool参数解决 TeamCenter四层pool服务器锁死的问题
updated: 2026-06-06T10:08
created: 2020-03-01T11:58:30
tags:
  - TC
---

## <span style='color:#2E75B5'>通过Global Pool参数解决 TeamCenter四层pool服务器锁死的问题 </span>
最近在做项目过程中，客户向我们反馈了一个问题，问题描述如下：
系统版本：TC10.1.5+AW3.0
问题现象：“4层胖客户端”以及“AWC客户端”两种客户端经常性的全部被锁死，已经登录的用户操作没有反应，新的用户无法登陆（卡在登录界面），在Pool里面出现active状态的持续时间非常长的进程(持续几千~几万秒)。

<img src="d8ac0ceb27d14a5a8ea693c46e98c5ef.png" alt="image1" />
由于客户每天的业务量很大，此问题的最高出现频率甚至有时可以达到每天1~2次，而且此问题只能在最终用户反馈问题时才被发现，然后由管理员手动关闭出问题的进程，才能是系统恢复。每次出现问题，都会造成几个小时的系统停机，极大地影响了系统的正常使用。  

«span style='font-family:微软雅黑;font-size:11.0pt'»经过客户系统管理员共同研究分析，决定对于Global Pool中的“«/span»<span style='font-weight:bold;font-family:arial;font-size:10.0pt;color:red; background:white'>QUERY_TIMEOUT</span>«span style='font-family:微软雅黑;font-size: 11.0pt'»”参数进行调整，将其设置为7200秒（用户会执行某些时间比较长的报表输出操作因此设置的时间比较加长，如果没有此类操作建议设置在2000秒以内）。«/span»
<img src="C:\Users\lindo\AppData\Local\Temp\东乐 的笔记本\pandoc/media/image2.png" style="width:5.95833in;height:5.125in" alt="Status Config Operation Log Levels Manager Monitoring Pool Config Advanced Pool Config G 《 0b 引 PO 引 Config Hard Timeout Edit 〔 s 巳 0 ： Hard Timeout R 巳 〔 s 巳 0 ： Hard Timeout Stateless 〔 s 巳 0 ： Soft Timeout Edit 〔 s 巳 0 ： Soft Timeout R 巳 〔 s 巳 0 ： Soft Timeout Stateless 〔 s 巳 0 ： Process Max Per user ： user Timeout Stateless 〔 s 巳 0 ： Manager Availablity Interval 〔 s 巳 0 ： Manager Availablity Timeout 〔 s 巳 0 ： 28800 28800 28800 28800 28800 1 200 0 0 阝@二二二二二二二二二二] 阝@二二二二二二二二二二] 0 《 T 」 mc n r 手 制 适 " />
注：这个界面是 Managment Console的界面  

经过这个参数设置后，用户已经1个月没有出现过类似的问题。

«span style='font-family:微软雅黑;font-size:11.0pt'»同时Global Pool参数可以通过修改«/span»<span style='font-family:arial;font-size:10.0pt;background:white'>.war</span>«span style='font-family:"Microsoft YaHei";font-size:10.0pt;background:white'»发布包«/span»<span style='font-family:arial;font-size:10.0pt;background:white'></span>«span style='font-family:微软雅黑;font-size:11.0pt'»中的«/span»<span style='font-weight:bold;font-family:arial;font-size:10.0pt;background:white'>globalPoolConfig.properties</span>«span style='font-family:微软雅黑;font-size:11.0pt'»文件的内容实现。«/span»
<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><table style="width:11%;">
<colgroup>
<col style="width: 11%" />
</colgroup>
<thead>
<tr>
<th></th>
</tr>
</thead>
<tbody>
</tbody>
</table></th>
</tr>
</thead>
<tbody>
<tr>
<td><p>Global pool properties are used for setting configurations across all pools. This is an efficient option for making use of parallel CPU and memory resources to run Teamcenter servers.</p>
<p>Global pool properties are set in the<strong>Modify Context Parameter</strong>dialog box in the Web Application Manager and saved in the<strong>globalPoolConfig.properties</strong>file. This file is stored in the deployed web application WAR file in the<strong>lib\JETIServerAccessor.jar</strong>file during<strong>insweb</strong>installation. Time-out parameters are set globally across all pools. Pool sizing parameters must be configured individually for each pool.</p>
<table>
<colgroup>
<col style="width: 39%" />
<col style="width: 60%" />
</colgroup>
<thead>
<tr>
<th><span style='color:#666666'>Note</span></th>
<th>You can revise the<strong>globalPoolConfig.properties</strong>file and save it back to the<strong>.war</strong>file before deployment by the web application. Or if you prefer, you can place the revised file directly into the root directory of the web application server’s run-time environment, and override the version of the file in the<strong>.war</strong>file. For example, on WebLogic, place the revised file into the<strong>domain</strong>directory; on WebSphere, place it into the<strong>profile</strong>directory; or on JBoss, place it into the<strong>bin</strong>directory.</th>
</tr>
</thead>
<tbody>
</tbody>
</table>
<p><img src="299b7e93b5b94001b0e25eb5cb0c2250.png" alt="image3" /></p>
<p>The following excerpt from a<strong>globalPoolConfig.properties</strong>file is provided for illustration purposes only:<br />
</p>
<p></p>
<p>CACHE_CONFIG_PATH=TreeCacheTCP.xml<br />
PROCESS_MAX_PER_USER=0<br />
QUERY_TIMEOUT=0<br />
SOFT_TIMEOUT_EDIT=28800<br />
SOFT_TIMEOUT_READ=28800<br />
SOFT_TIMEOUT_STATELESS=1200<br />
HARD_TIMEOUT_EDIT=28800<br />
HARD_TIMEOUT_READ=28800<br />
HARD_TIMEOUT_STATELESS=28800<br />
USER_TIMEOUT_STATELESS=0<br />
ASSIGNMENT_TIMEOUT=60<br />
</p>
<p></p>
<p>Because this file is placed in the deployed web application WAR file during<strong>insweb</strong>installation, to override the values, the<strong>insweb</strong>command can be rerun to update these values in a new WAR file. Alternately, a copy from the<strong>insweb</strong>staging area can be placed in the Java EE application server startup directory.</p>
<p>You may want to increase the values of some of the<strong>SOFT_TIMEOUT</strong>values to reduce CPU overhead if these time-outs are common. The time-out configuration values are in seconds. Also, though the edit soft time-out default is 7200 seconds (two hours), the consequences are higher for such a time-out, and it may be desirable to increase that value as well.</p>
<p>Parameters include both hard and soft time-outs.</p>
<ul>
<li><p>Soft time-outs</p></li>
</ul>
<blockquote>
<p>Apply only when the number of servers in a server pool exceeds the<strong>PROCESS_TARGET</strong>parameter configured for the pool manager.</p>
</blockquote>
<ul>
<li><p>Hard time-outs</p></li>
</ul>
<blockquote>
<p>Always apply, regardless of the status of the server pool.</p>
</blockquote>
<p>Time-out parameters are available for the following server modes. The client controls the mode of its assigned server at any given moment.</p>
<ul>
<li><p>Edit mode</p></li>
</ul>
<blockquote>
<p>The client may switch its server to this mode when it (or auser) is making updates to server data that is not yet committed to the database. If the server is lost, these changes are lost.</p>
<p>For example, Structure Manager uses edit mode to allowusersto edit a BOM structure through multiple operations that change temporary data in the server and client until theusersaves the data.</p>
</blockquote>
<ul>
<li><p>Read mode</p></li>
</ul>
<blockquote>
<p>The client may switch its server to this mode when the client’s requests have set a temporary state in the server to be used by subsequent requests. If the server is lost, the client may require restart, and there may be performance issues as the client becomes consistent with a new server, but no significantuserwork is lost or corrupted.</p>
<p>For example, the rich client’s initial mode is read mode.</p>
</blockquote>
<ul>
<li><p>Stateless mode</p></li>
</ul>
<blockquote>
<p>This is the default mode for a server. The client uses this mode when no requests depend on the state that a previous request has made to the server. If the server is lost, the next request can be executed on a new server without functional issues except for the performance of assigning a new server.</p>
<p>For example, the web client is stateless.</p>
</blockquote>
<p>There is a time-out parameter for each combination of soft and hard time-outs combined with each of the three modes. For example, the<strong>SOFT_TIMEOUT_EDIT</strong>parameter applies to servers in edit mode when the server pool exceeds the value set by the<strong>PROCESS_TARGET</strong>parameter.</p>
<p>There are additional time-out parameters:</p>
<ul>
<li><p><span style='font-weight:bold;color:black'>USER_TIMEOUT_STATELESS</span></p></li>
</ul>
<blockquote>
<p>Configures the server idle time in seconds. This timeout applies after auserhits the limit defined by the<strong>PROCESS_MAX_PER_USER</strong>value.</p>
</blockquote>
<ul>
<li><p><span style='font-weight:bold;background:#FFFB00'>QUERY_TIMEOUT</span></p></li>
</ul>
<blockquote>
<p><span style='background:#FFFB00'>Configures the maximum time a server is allowed to process a single request. If this time is exceeded the server is terminated. A value of</span><span style='font-weight:bold;background:#FFFB00'>0</span><span style='background:#FFFB00'>turns off the query time-out, allowing a server to continue processing a request indefinitely.</span></p>
</blockquote>
<ul>
<li><p><strong>ASSIGNMENT_TIMEOUT</strong></p></li>
</ul>
<blockquote>
<p>Timeout (in seconds) for a server assignment to be completed. This includes the time for the server to authenticate theusercredentials and performuser-specific initialization.</p>
</blockquote></td>
</tr>
</tbody>
</table>

![image4](1ec2f1bc270744e0bfabb9fff67d6358.jpg)

阅读
在看
已同步到看一看[写下你的想法](javascript:;)
前往“发现”-“看一看”浏览“朋友在看”
![image5](55fc1606ee18440b9cc755996c28cded.png)
前往看一看
**看一看入口已关闭**
在“设置”-“通用”-“发现页管理”打开“看一看”入口
[我知道了](javascript:;)
已发送
取消
#### *<span style='color:#5B9BD5'>发送到看一看 </span>*
发送
通过Global Pool参数解决 TeamCenter四层pool服务器锁死的问题
最多200字，当前共字
发送中
[留言](javascript:;)
相关阅读
[更多文章](javascript:;)

微信扫一扫  
关注该公众号

微信扫一扫  
使用小程序
[取消](javascript:void(0);) [允许](javascript:void(0);)
[取消](javascript:void(0);) [允许](javascript:void(0);)
[知道了](javascript:;)
**长按识别前往小程序**

[\<From: http://mp.weixin.qq.com/s?\_\_biz=MzU4NTgwNjE2NA==&mid=2247483855&idx=1&sn=e674c4eaf3b655e49935aa7272dcf8c4&chksm=fd85b9f4caf230e29d6f23256739f7c0ca868ea75c825dd636f644e9d5a7c3faf40bbb413b05&mpshare=1&scene=1&srcid=&sharer_sharetime=1583034123262&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd\>](http://mp.weixin.qq.com/s?__biz=MzU4NTgwNjE2NA==&mid=2247483855&idx=1&sn=e674c4eaf3b655e49935aa7272dcf8c4&chksm=fd85b9f4caf230e29d6f23256739f7c0ca868ea75c825dd636f644e9d5a7c3faf40bbb413b05&mpshare=1&scene=1&srcid=&sharer_sharetime=1583034123262&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd)
