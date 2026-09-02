---
title: 修改TC日期及时间显示格式
updated: 2026-09-02T16:30:05
created: 2026-07-05T17:04:47
---

如果是修改lang下面的timelocal_locale.xml文件
  \<!-- Used everywhere in the code --\>
 \<key id="DefaultDateFormat"\>%d-%b-%Y\</key\>
然后重新生成缓存文件
generate_client_meta_cache -u=infodba -p=infodba  -g=dba generate textservers
重启启动服务，
那么显示的时候可以满足要求

*来自 \< <https://support.sw.siemens.com/zh-CN/support-case/details/1c5175f0-a8f4-11ec-b0f5-2dbeeae73e2f>\>*
