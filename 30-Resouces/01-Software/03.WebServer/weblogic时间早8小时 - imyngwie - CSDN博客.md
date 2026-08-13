---
title: weblogic时间早8小时 - imyngwie - CSDN博客
updated: 2026-06-06T00:32
created: 2019-09-04T22:06:08
---

weblogic时间早8小时 - imyngwie - CSDN博客
星期三, 九月 4, 2019
2:06 下午

已剪辑自: <https://blog.csdn.net/iteye_16880/article/details/82093477>
最近运气好,各种诡异的bug,记录下来,以供之后查看  
有一个页面需要保存日期,在前台JS中DEBUG的时候都是正确的,可是存到数据库中,就发现日期少一天,准确的说是比选择的日期早了8个小时,基本就可以确定是时区的错误,  
开始查找,数据库时区,没问题,服务器系统时区,没问题,  
最终问题居然出在weblogic的时区上面...  
weblogic是使用自带的jre,而自带的jre中默认的时区就是GMT,而中国标准时间大家都知道是GMT+8,网上有说去改weblogic自带jre中的GMT文件,把GMT8改成GMT,但总觉得这样不是很好,如果有需要使用GMT标准时间的时候会有出问题的风险  
于是从weblogic的启动脚本上下手  
修改 domians/project/bin/startWebLogic.cmd  
找到类似  
set JAVA_OPTIONS=%JAVA_OPTIONS%
在最后面加上 -Duser.timezone=GMT+8 即设置时区为GMT+8 也可写为 Asia/shanghai  
修改之后为  
set JAVA_OPTIONS=%JAVA_OPTIONS% -Duser.timezone=GMT+8
保存,重新启动weblogic,问题解决
