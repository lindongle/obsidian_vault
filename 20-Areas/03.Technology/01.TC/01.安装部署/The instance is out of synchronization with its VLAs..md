---
title: The instance is out of synchronization with its VLAs.
created: 2026-07-21T14:58:25+08:00
updated: 2026-07-21T20:27:35+08:00
---
![[企业微信截图_17846163487449.png]]
还原生产环境数据库时，数据库与卷不在同一时间，未停机还原导致数据库不一致；

[如何使用TeamCenter reference_manager工具修复VLA问题](https://support.sw.siemens.com/zh-CN/knowledge-base/KB000201513_EN_US)





执行：reference_manager -scan_vla -u=infodba -p=password -g=dba
查出以下结果：
![[Pasted image 20260721190016.png]]
找到带有 inconsistent VLAs found的地方
(PFND0PREFERENCEVALUE.VLA_18_3:PFND0STRINGVALUES): ==5 inconsistent VLAs found==

* uid,class-cnt,sequence

. A4jpkESMZ3tb7C,20,0-17

. A4mpkESMZ3tb7C,20,0-17

. A4ppkESMZ3tb7C,20,0-17

. AVkpDcIcZ3tb7C,20,0-20

. AVnpDcIcZ3tb7C,20,0-20

- 表示在表PFND0PREFERENCEVALUE对应的字段PUID和VLA_18_3为列表中的uid,class-cnt，如A4jpkESMZ3tb7C,20，20表示有20条。后面的0-17，表示在表PFND0STRINGVALUES对应的PUID=A4jpkESMZ3tb7C有0-17共18行，所以需要把前面字段的20改为18；
- 如果只有20，没有后面的0-17，则说明后面的表对应PUID为0行，则需要将PUDI对应的这个字段值改为0
* classic PSOccurrenceNotes:note_types[114] (PPSOCCURRENCENOTES.VLA_386_1:PNOTE_TYPES_0): ==3 inconsistent VLAs found==

* uid,class-cnt,sequence

. m2vpVj1xZ3tb7C,==2,==

. munpVj1xZ3tb7C,2,

. myrpVj1xZ3tb7C,2,
* classic PSOccurrenceNotes:note_texts[112] (PPSOCCURRENCENOTES.VLA_386_2:PNOTE_TEXTS_0): 3 inconsistent VLAs found

* uid,class-cnt,sequence

. m2vpVj1xZ3tb7C,2,

. munpVj1xZ3tb7C,2,

. myrpVj1xZ3tb7C,2,
**修复：**
```sql
UPDATE PPSOCCURRENCENOTES SET VLA_386_1=0,VLA_386_2=0 WHERE puid IN ('m2vpVj1xZ3tb7C','munpVj1xZ3tb7C','myrpVj1xZ3tb7C')
```
* classic Dataset:ref_types[3] (PDATASET.VLA_1179_3:PREF_TYPES): 4 inconsistent VLAs found

* uid,class-cnt,sequence

. 7DnpFbb5Z3tb7C,6,

. AknpV$tMZ3tb7C,1,0-1

. AkrpV$tMZ3tb7C,1,0-1

. n0opFne2Z3tb7C,1,
**修复：**
```sql
UPDATE PDATASET SET VLA_1179_3=0 WHERE puid in ('7DnpFbb5Z3tb7C','n0opFne2Z3tb7C')：
UPDATE PDATASET SET VLA_1179_3=2 WHERE puid in ('AknpV$tMZ3tb7C','AkrpV$tMZ3tb7C')
