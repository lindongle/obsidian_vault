---
title: Teamcenter编码为什么会跳号
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:04:52
tags:
  - TC
---

Teamcenter编码为什么会跳号
2019年12月19日
0:01

## Teamcenter编码为什么会跳号 

![image1](f7c63131480045bb9bea505c0f1986a5.jpg)
Teamcenter可以根据命名规则自动生成编码,通常编码是连续的.但细心的用户会发现,如果TC服务器重启,TC新生成的编码并非是上次生成的下一个流水码。有时会有多达19个跳号。比如上次生成的编码是000086，重启后生成的编码是000105，这是什么原因呢？

TC11.2.2之前的版本中，取Item ID主要是通过计数器的方式。

从TC11.2.2开始，Teamcenter引入了序列的概念，通过序列生成**唯一**的ID数值.
关于序列在Oracle官方的解释：
*Sequences are database objects from whichmultiple users can generateunique integers. The sequence generator generates sequential numbers,which can help to generate unique primary keys automatically, and to coordinatekeys across multiple rows or tables.*

从TC11.2.2的补丁的sql脚本中我们可以看到，授予了infodba用户create sequence权限。  

![image2](931f1a30d14a428982557d6120fca88c.png)
但是用户在创建Item过程中，经常遇到指派Item ID不连续的问题。
比如从当ID指派到000035时，下一次指派ItemID时，有时会从000041开始。

**这是什么原因呢？**
因为存在序列缓存的概念
在TC中序列缓存默认的值为20，Oracle会将这些sequence缓存放在shared pool中
这样做，主要是为了提高从sequence取值的效率，而且取值越频繁，cache的值设置的越大，但是缓存的存在很可能会造成跳号.
当用户每次指派Item ID的时候，系统会从共享池中取值，如果缓存中的值没有了，或者缓存被清空了，Oracle会再生成20个缓存的值.
如果当前的值为000021，缓存为20，当值取到000035的时候，缓存被清空了，那么下一次取值将会从000041开始.（从21到40，这20个值都是缓存中的）注意，这里下一个取值不是从000055(000035+20)，而是000041(000021+20)

结合TC做几个测试

测试一：
在同一个Session中执行以下SQL语句（不在同一session中取序列会有差异）
取一个sequence值 （SEQ_16148149953160_ABE8E118是INFODBA拥有的序列）
SELECTTO_CHAR(SEQ_16148149953160_ABE8E118.nextval) AS val FROM dual;
结果是：27
查看当前sequence值  
SELECTTO_CHAR(SEQ_16148149953160_ABE8E118.currval ) AS val FROM dual;
结果是：27
新建零组件对话框中点击指派，系统会生成28  

![image3](b9aabe19a37c4db3b86657fb1afcb863.png)

然后不创建Item, 并且关闭创建对话框，再执行：  
SELECTTO_CHAR(SEQ_16148149953160_ABE8E118.nextval) AS val FROM dual;
结果：29

**<u>结论：</u>**
说明在回滚的事务中，序列号会被跳过
测试二：
执行以下SQL  
SELECTTO_CHAR(SEQ_16148149953160_ABE8E118.nextval) AS val FROM dual;
结果：30
通过TC取号，得到31，没有问题
![image4](a7c451b121bd47c3af698d407b77f142.png)

清空共享池（用sysdba角色执行）  
alter system flush shared_pool;
再通过TC取号，得到的值是41
![image5](600e0be710494c4681ed7958a757e5e5.png)

**<u>结论：</u>**
共享池清除会造成序列不连续，至于共享池为什么会清空，可能是数据库非正常down掉…这方面没有做深入的研究，**所以序列只能保证唯一性，但是不能保证连续性。**

测试三：
查看LAST_NUMBER
SELECT LAST_NUMBER FROM dba_sequences wheresequence_name='SEQ_16148149953160_ABE8E118'
结果：61
执行以下SQL  
SELECTTO_CHAR(SEQ_16148149953160_ABE8E118.nextval) AS val FROM dual;
结果：42
重复执行直到序列值为60，查看LAST_NUMBER还是61
再执行
SELECT TO_CHAR(SEQ_16148149953160_ABE8E118.nextval)AS val FROM dual;
查看LAST_NUMBER变为了81
结论：
默认情况下，TC的序列初始值为1，cache为20，当cache中20个值用完时，也就是取到21时，Oracle会生成新的20个cache，下次取到41时，又会生成20个cache在共享池中

另外，官方论坛中，不建议使用NOCACHE。

CACHE or NOCACHE, if your requirement is truly to make surethere are no gaps, then a sequence is the wrong solution. You may get fewergaps with NOCACHE

«span style='color:#404040'»If you use nocache - then every time you call sequence.nextvalyou will cause sys.seq\$ to be updated and committed.  
If you use cache 20 - then every 20th time you call sequence.nextval you willcause sys.seq\$ to be updated and committed.  
It is a performance thing, if you don't cache the next couple of sequencevalues in the SGA, you will be doing an update and commit every single time youcall nextval«/span»

即使用户的数据库是Microsoft SQL Server，出于同样的原因，也会跳号。总之，用户不用去纠结跳号，把编码当成是物料唯一性的标识就可以了。



阅读
在看
已同步到看一看[写下你的想法](javascript:;)
前往“发现”-“看一看”浏览“朋友在看”
![image6](ce63064de93a4c87aa5be8897dfad35f.png)
前往看一看
**看一看入口已关闭**
在“设置”-“通用”-“发现页管理”打开“看一看”入口
[我知道了](javascript:;)
已发送
取消
#### *发布到看一看 *
发送
最多200字，当前共字
发送中
相关阅读
[更多文章](javascript:;)

微信扫一扫  
关注该公众号

微信扫一扫  
使用小程序
[取消](javascript:void(0);) [允许](javascript:void(0);)
[取消](javascript:void(0);) [允许](javascript:void(0);)
[知道了](javascript:;)
[确定](javascript:void(0);)
[\<From: http://mp.weixin.qq.com/s?\_\_biz=MzI4MDYyNDY1Mw==&mid=2247483846&idx=1&sn=f6203271a0a1e2d21249a45043b1be06&chksm=ebb4eaa4dcc363b22a09bad73932094ef8abf2d67e5e5a87d492c09cd4f1ceaf4cd5ae19321d&mpshare=1&scene=1&srcid=1219kR3MLNYeRLfBCbqaEwiK&sharer_sharetime=1576684864334&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd\>](http://mp.weixin.qq.com/s?__biz=MzI4MDYyNDY1Mw==&mid=2247483846&idx=1&sn=f6203271a0a1e2d21249a45043b1be06&chksm=ebb4eaa4dcc363b22a09bad73932094ef8abf2d67e5e5a87d492c09cd4f1ceaf4cd5ae19321d&mpshare=1&scene=1&srcid=1219kR3MLNYeRLfBCbqaEwiK&sharer_sharetime=1576684864334&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd)
