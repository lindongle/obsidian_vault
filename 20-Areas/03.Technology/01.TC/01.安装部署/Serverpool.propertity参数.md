---
title: Serverpool.propertity参数
updated: 2026-06-13T22:12:00
created: 2026-07-05T17:04:38
tags:
  - TC安装部署
---

**PROCESS_MAX**
服务器最大tcserver数，一般为可供tcserver使用内存数（M）/150M(一个tcserver一般不会超过200M)
如64G内存，全部用于做pool服务器，去除windows服务内存，大约64\*70%=45G左右
40\*1024/150=300左右，此参数可以设置为300。
正常
**PROCESS_TARGET**
在某个时间段，最少运行的tcserver数量。
如0800 80, 1000 120, 1800 80，则表示8点后tcserver最少为80个，到10点增加为120个，到下午18点，最少有80个。
PROCESS_TARGET的值在PROCESS_MAX的1/3左右。
**PROCESS_WARM**
温池服务器，为自动提前建立连接（热启动），以供用户登录的数量，如果设置为0，则超出target值后，将提示服务器不可用，稍后重试，等其他用户退出后再登录。即PROCESS_WARM为希望到达target后，自动预启动的tcserver的数量。当用户已经分配的tcserver数，超过了设置的target数，PROCESS_WARM参数才会有意义。即PROCESS_TARGET和PROCESS_WARM均为预加载的数量，即总的温池预加载进程数量为PROCESS_TARGET-已分配的tcserver+PROCESS_WARM设置的数量。当分配数量要超出整个预加载数量时，则自动创建tcserver（会消耗一定时间）。

设置思路：
<span style='color:red'>**PROCESS_TARGET，设置为当天总分配数（单台pool）的最小值或平均值。**</span>
<span style='color:red'>**PROCESS_WARM，设置为当天总分配数（单台pool）的最大值-PROCESS_TARGET，两者之和小于PROCESS_MAX的值。**</span>

