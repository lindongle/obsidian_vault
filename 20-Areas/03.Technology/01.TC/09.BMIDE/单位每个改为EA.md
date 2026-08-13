---
title: 单位每个改为EA
updated: 2026-06-05T23:15
created: 2022-04-14T10:04:37
---

CustomizingalldisplayednamesinOOTB
Performbelowstepstochangethedefaultvaluefrom“each”tospace.
(1)Open
\<your_install_dir\>\lang\textserver\\your_target_language\>\tc_text_locale.xml
file
(2)Change:\<!--!003059DisplayblankvalueofUOMtobe"each"--\>
\<keyid="k_uom_each"\>each\</key\>
To(byremoving"each"):
\<keyid="k_uom_each"\>EA\</key\>

Save&closetc_text_locale.xmlfile.
runthefollowingcommandintcdosenv

generate_client_meta_cache-u=infodba-p=\<infodba\>-g=dbageneratetextservers

stoptcservices
clearservercache
clienttheclientcache
restarttcservices
loginagaintocheckit.
