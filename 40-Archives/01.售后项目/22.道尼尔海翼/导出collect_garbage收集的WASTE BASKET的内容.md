---
title: 导出collect_garbage收集的WASTE BASKET的内容
updated: 2026-06-05T22:49:03
created: 2026-07-05T17:05:02
---

SELECT FOLD.pvalu_0,FOLD.pseq,OBJ.pobject_name,OBJ.pobject_type,APP.plast_mod_date ,
U.puser_id
FROM PCONTENTS as FOLD,PWORKSPACEOBJECT OBJ ,PPOM_APPLICATION_OBJECT APP,PPOM_USER U
WHERE OBJ.puid = FOLD.pvalu_0 AND APP.puid = FOLD.pvalu_0 AND U.puid = APP.rowning_useru

AND EXISTS(SELECT 'X' FROM PWORKSPACEOBJECT POBJ WHERE POBJ.puid = FOLD.puid AND POBJ.pobject_name = 'WASTE BASKET')
AND EXISTS(SELECT 'X' FROM PPOM_APPLICATION_OBJECT PAPP WHERE PAPP.puid = FOLD.puid AND EXISTS(SELECT 'X' FROM PPOM_USER PU WHERE PU.puid = PAPP.rowning_useru AND PU.puser_id='infodba'))

order by FOLD.pseq
