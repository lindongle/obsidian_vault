--创建视图，第一步
create or replace view v_bom_compcount as
select pitm.pitem_id pid, prev.pitem_revision_id previd,occ.rparent_bvru,occ.pseq_no, occ.rchild_itemu,citm.pitem_id cid, ntype.pname, ntxt.pval_0 
from pitem pitm, pitemrevision prev, ppsoccurrence occ , pitem citm ,pnote_texts_0 ntxt,pnotetype ntype
where prev.ritems_tagu = pitm.puid and exists(select 'x' from pstructure_revisions str where str.puid = prev.puid and str.pvalu_0 = occ.rparent_bvru ) and citm.puid = occ.rchild_itemu 
and ntxt.puid = occ.rnotes_refu and exists(select 'x' from pnote_types_0 t where t.puid = ntxt.puid and t.pvalu_0 = ntype.puid)
and exists(select 'x' from pworkspaceobject pobj where pobj.puid = prev.puid and pobject_type in('Y5_SAP_AssemblyRevision','Y5_SAP_ProductRevision','Y5_SAP_MaterialRevision','Y5_SAP_PartRevision'))
and ntype.pname = 'Y5_component_count';

--备份表，第四步
create table ppsoccurrence_20220526 as select * from ppsoccurrence;
--测试XXX父级对应XXX子级数量--第五步
update ppsoccurrence occ set py5_ComponentQuantity = 
(select pval_0  from  v_bom_compcount  v where v.rparent_bvru = occ.rparent_bvru and v.rchild_itemu = occ.rchild_itemu and v.pseq_no = occ.pseq_no and rownum=1) 
where exists(select 'x' from v_bom_compcount  v where v.rparent_bvru = occ.rparent_bvru and v.rchild_itemu = occ.rchild_itemu and v.pseq_no = occ.pseq_no and v.pid = '10014488' and v.cid='12052078');

--更新所有数量--第六步
update ppsoccurrence occ set py5_ComponentQuantity = 
(select pval_0  from  v_bom_compcount  v where v.rparent_bvru = occ.rparent_bvru and v.rchild_itemu = occ.rchild_itemu and v.pseq_no = occ.pseq_no and rownum=1) 
where exists(select 'x' from v_bom_compcount  v where v.rparent_bvru = occ.rparent_bvru and v.rchild_itemu = occ.rchild_itemu and v.pseq_no = occ.pseq_no);

--创建视图，查看非数字与数字数据，第二步
create  or replace view v_all as 
SELECT v.*, nvl2(translate(v.pval_0,'/-1234567890.','/'),'0','1')  as datatype
FROM   v_bom_compcount v;

--datatype为0则为非数字，为1则为数字，第三步
select v.*,length(pval_0) from v_all v where datatype='0'

--SELECT  nvl2(translate('123-23','/-1234567890.','/'),'CHAR','NUMBER')   type FROM   dual ; 

--将带回车符的1替换为1
update pnote_texts_0 set pval_0='1' where  pval_0='1
';