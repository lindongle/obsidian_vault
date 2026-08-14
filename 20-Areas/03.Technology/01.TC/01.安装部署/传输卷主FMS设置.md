---
title: 传输卷主FMS设置
updated: 2026-06-13T22:12:00
created: 2026-07-05T17:04:38
tags:
  - TC安装部署
---

\<?xml version="1.0" encoding="UTF-8"?\>
\<!DOCTYPE fmsworld SYSTEM "fmsmasterconfig.dtd"\>

\<fmsworld\>
\<fmsenterprise id="-1963241751" volumestate="normal"\>
\<fccdefaults\>
\<property name="FCC_CacheLocation" value="\$HOME/FCCCache\|/tmp/\$USER/FCCCache" overridable="true" /\>
\<property name="FCC_HashBlockPages" value="6144" overridable="true" /\>
\<property name="FCC_LogFile" value="\$HOME/fcc.log\|/tmp/\$USER/fcc.log" overridable="true" /\>
\<property name="FCC_MaxExtentFileSizeMegabytes" value="256" overridable="true" /\>
\<property name="FCC_MaxExtentFiles" value="11" overridable="true" /\>
\<property name="FCC_MaxReadCacheSize" value="1000M" overridable="true" /\>
\<property name="FCC_MaxWriteCacheSize" value="1000M" overridable="true" /\>
\<property name="FCC_MaximumNumberOfFilePages" value="28672" overridable="true" /\>
\<property name="FCC_MaximumNumberOfSegments" value="10688" overridable="true" /\>
\<property name="FCC_EnableDirectFSCRouting" value="false" overridable="false" /\>
\</fccdefaults\>
\<fscgroup id="mygroup"\>
\<fsc id="FSC_TCApp_Administrator" address="http://10.44.59.22:4544" ismaster="true"\>
\<volume id="00e45637968f8afb4ee9" enterpriseid="-1963241751" root="\\10.44.250.41\PDM\Siemens\volume" priority="0" /\>
\</fsc\>
\<fsc id="FSC_vol_Administrator" address="http://10.44.59.29:4544" ismaster="false"\>
\<transientvolume id="854b11a4236d8812aaf02a4b55405f82" enterpriseid="-1963241751" root="C:\\Temp\\transientVolume_infodba" /\>
\</fsc\>
\<clientmap default="true"\>
\<assignedfsc fscid="FSC_TCApp_Administrator" priority="0" /\>
\<assignedfsc fscid="FSC_vol_Administrator" priority="1" /\>
\</clientmap\>
\<clientmap subnet="10.44.0.0" mask="255.255.255.0"\>
\<assignedfsc fscid="FSC_TCApp_Administrator" priority="0" /\>
\<assignedfsc fscid="FSC_vol_Administrator" priority="1" /\>
\</clientmap\>
\</fscgroup\>
\</fmsenterprise\>
\</fmsworld\>

transientvolume id要在web层服务器上运行backup_xmlinfo得到的。--为保险，将tc_data中的tc_probat文件中的set Transient_Volume_Installation_Location=VOL，后面改为web层的主机名

另外主

