---
title: MBOM及订单BOM管理
updated: 2026-06-05T22:06:06
created: 2026-07-05T17:04:58
---

# <span style='color:#1E4E79'>MBOM管理</span>
## <span style='color:#2E75B5'>一、MBOM创建及变更现状</span>
### <span style='color:#5B9BD5'>1、MBOM创建及发布</span>
基于EBOM初始化MBOM--手动调整MBOM-走MBOM归档流程--归档后执行MBOM下发功能发送到SAP。（判断必须BOM在SAP中不存在）
### <span style='color:#5B9BD5'>2、MBOM的变更及发布</span>
**1）单个变更**
收到EBOM变更通知--修订升版--手动调整MBOM--走MBOM归档流程--归档后选择Bomview版本执行MBOM变更的下发功能发送到SAP（PLM中做新旧版本差异对比）。（判断BOM必须在SAP中存在）
**2）批量变更**
收到EBOM变更通知--对问题版本的零部件及关联的影响分析的MBOM导出到Excel中，在Excel中进行修改替换等保存--使用历史数据导入的功能，将系统中的MBOM进行批量修订升版并覆盖更新--更新后需要根据影响分析，手动找到要变更的MBOM，走归档流程--归档后，找到每个MBOM的BOMVIEW版本，逐个下发到SAP（逻辑同单个下发，不支持批量下发）
## <span style='color:#2E75B5'>二、MBOM优化建议</span>
### <span style='color:#5B9BD5'>1、手动单个或批量下发（不区分创建或更改）</span>
使用MCN对象，将所有要下发SAP的MBOM的Bomview版本，手动放到解决方案中，走MCN发布流程，在流程中增加下发校验节点，，通过现有下发功能，模拟下发，如果有数据问题或其他逻辑问题，退回或修改，直至下发校验无问题（校验逻辑，如果SAP中不存在，调用SAP创建接口中的数据检查逻辑，如果SAP中存在，调用BOM变更接口的逻辑，且变更差异由SAP根据PLM下发的最新版全数据与SAP中最新版的全数据进行差异比较，确保数据的准确性及PLM数据唯一源头），点击提交流程，归档，归档后通过handler自动下发到SAP。
### <span style='color:#5B9BD5'>2、自动单个或批量下发（不区分创建或更改）</span>
根据影响分析，将导出的MBOM在excel中调整完成后，选择MCN对象调用excel导入功能，将Excel中的所有父级BOM的Bomview版本均导入到MCN的解决方案文件夹中，其他流程及逻辑同1。
# <span style='color:#1E4E79'>订单BOM管理</span>
## <span style='color:#2E75B5'>一、订单BOM管理现状</span>
### <span style='color:#5B9BD5'>1、订单BOM的创建及发布</span>
不走PLM系统。
### <span style='color:#5B9BD5'>2、订单BOM的变更及发布</span>
在PLM中新建大货更改单，填写表单，更改内容，走审批流程，审批后，将对于的销售订单号对应的订单BOM调用SAP接口导入到Excel中，放到个人文件夹中。BOM工程师打开Excel表，对着已经发布的大货更改单中的更改内容进行调整。调整后保存。选择改后的Excel表，使用订单BOM变更下发功能下发到SAP中（差异下发）。
## <span style='color:#2E75B5'>二、订单BOM优化建议</span>
### <span style='color:#5B9BD5'>1、方案一</span>
订单的变更单审批流程在PLM中管理，但订单BOM 的具体修改过程放回SAP中管理
原因：1）其他制造部的订单BOM的维护人员大都分散在计划科或订单部门，与研发系统的管理范围定位关系不大，需增加license点数。2）按照目前，订单BOM的其他属性视图，PLM无法管理，即使在PLM进行了BOM行的修改，可能也无法控制订单BOM的其他信息的在SAP中的修改。3）目前在PLM中订单BOM修改后，直接发SAP（因修改前已经走了变更流程），只是将原来的SAP的修改权限放到了接口上，但是操作的人员实际权限未改变。
### <span style='color:#5B9BD5'>2、方案二</span>
优化现有订单BOM的修改过程
1）将PLM从SAP中导出的Excel的订单中，体现所有涉及到的SAP的订单视图均纳入进来。均通过此Excel就行修改。
2）改后的Excel再走一遍审批流程，进行下发，审批及下发过程同MBOM的审批及下发逻辑一致。
