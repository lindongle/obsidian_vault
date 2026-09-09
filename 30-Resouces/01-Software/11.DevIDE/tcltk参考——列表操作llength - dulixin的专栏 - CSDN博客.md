---
title: tcl/tk参考——列表操作llength - dulixin的专栏 - CSDN博客
updated: 2026-06-06T00:33
created: 2019-06-19T02:55:33
---

tcl/tk参考——列表操作llength - dulixin的专栏 - CSDN博客
2019年6月19日
2:55
已剪辑自: <https://blog.csdn.net/dulixin/article/details/2158574>
<span style='color:white'>.</span>
<span style='color:white'>.</span>
### <span style='color:#5B9BD5'>[名称](https://blog.csdn.net/dulixin/article/details/2158574)</span>
llength - 计算列表的元素个数
### <span style='color:#5B9BD5'>[语法](https://blog.csdn.net/dulixin/article/details/2158574)</span>
**llength** *list  *

### <span style='color:#5B9BD5'>[描述](https://blog.csdn.net/dulixin/article/details/2158574)</span>
将*list*当作一个列表来处理并返回一个十进制数的字符串表示列表中元素的个数。
### <span style='color:#5B9BD5'>[示例](https://blog.csdn.net/dulixin/article/details/2158574)</span>
结果是列表元素的个数：
% **llength** {a b c d e} 5 % **llength** {a b c} 3 % **llength** {} 0
元素并不一定是严格按照字典来的词，特别是当使用“{}”符号时：
% **llength** {a b {c d} e} 4 % **llength** {a b { } c d e} 6
一个空列表不一定是一个空字符串：
% set var { }; puts "\[string length \$var\],\[**llength** \$var\]" 1,0

