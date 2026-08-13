---
title: 修改TC日期及时间显示格式
updated: 2026-06-05T23:22
created: 2022-03-22T15:29:38
---

<span style='color:#2D373C'>如果是修改lang下面的timelocal_locale.xml文件</span>
<span style='color:#2D373C'>  \<!-- Used everywhere in the code --\></span>
<span style='color:#2D373C'> \<key id="DefaultDateFormat"\>%d-%b-%Y\</key\></span>
<span style='color:#2D373C'>然后重新生成缓存文件</span>
<span style='color:#2D373C'>generate_client_meta_cache -u=infodba -p=infodba  -g=dba generate textservers</span>
<span style='color:#2D373C'>重启启动服务，</span>
<span style='color:#2D373C'>那么显示的时候可以满足要求</span>

*来自 \< <https://support.sw.siemens.com/zh-CN/support-case/details/1c5175f0-a8f4-11ec-b0f5-2dbeeae73e2f>\>*
