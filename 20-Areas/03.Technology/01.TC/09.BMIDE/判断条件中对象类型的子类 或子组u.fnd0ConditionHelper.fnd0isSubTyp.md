---
title: 判断条件中对象类型的子类 或子组u.fnd0ConditionHelper.fnd0isSubTyp...
updated: 2026-06-05T23:14
created: 2019-12-07T21:46:09
---

( ( o!=null ) AND u.fnd0ConditionHelper.fnd0isSubTypeOf(o,"ItemRevision" ))OR( ( t!= null) AND u.fnd0ConditionHelper.fnd0isSubTypeOf(t,"ItemRevision")) AND u.fnd0ConditionHelper.fnd0isSubGroupOf(u.group, "Engineeering")

<span style='color:#FA0000'>注意：如果组名不存在，则默认没有这个条件，且组名必须是主值；</span>

<span style='background:white'>Conditions appear in the</span><span style='font-weight:bold;background:white'>Filter Condition</span><span style='background:white'>list if they meet the following requirements:</span>
- <span style='background:white'>The condition name meets the naming requirement as configured in the</span><span style='font-weight:bold;background:white'>Fnd0FilterCondition</span>dynamic LOV.  
  As shipped, the naming requirement is that the condition name contains<span style='font-weight:bold;background:white'>WF</span><span style='background: white'>.</span>
- <span style='background:white'>The condition contains the following parameters:</span>
  - <span style='font-weight:bold;background:white'>WorkspaceObject o</span>
  - <span style='font-weight:bold;background:white'>ImanType t</span>
  - <span style='font-weight:bold;background:white'>UserSession u</span>
<span style='background:white'>Workflow template filters affect:</span>
- <span style='background:white'>The</span><span style='font-weight:bold; background:white'>Process Template</span><span style='background:white'>choices displayed by the</span><span style='font-weight:bold;background:white'>New Process Dialog</span><span style='background:white'>dialog box.</span>
- <span style='background:white'>The</span><span style='font-weight:bold; background:white'>Process Template List</span><span style='background:white'>choices displayed by the</span><span style='font-weight:bold;background:white'>New Item</span><span style='background:white'>dialog box</span><span style='font-weight:bold; background:white'>Define Workflow Information</span><span style='background: white'>page.</span>
<span style='background:white'>When a workflow process is being created for a selected object, its</span><span style='font-weight:bold;background:white'>WorkspaceObject</span><span style='background:white'>parameter is used for condition evaluation to get a filtered list of workflow templates. While creating a new Item, as the object is not yet created, filter condition evaluation can use object</span><span style='font-weight:bold;background:white'>ImanType</span><span style='background:white'>parameter to get the list of filtered workflow templates. The</span><span style='font-weight:bold;background:white'>UserSession</span><span style='background:white'>parameter is used to evaluate user session values such as user, group, and role.</span>
<span style='background:white'>Example: Filter workflow templates while initiating workflow process for existing DocumentRevision objects</span>
1.  «span style='color:#212529'»Use the following condition to filter workflow templates while initiating workflow process for a document revision.  
    Fnd0DocRevSubmitOnlyWF(WorkspaceObjecto,ImanTypet,UserSessionu)«/span»
2.  «span style='color:#212529'»Define the following expression:  
    (o!=null)AND(o.object_type="DocumentRevision")«/span»
<span style='color:#212529'>The condition expression validates when the object submitted is not null and the object type is**DocumentRevision**.</span>
<span style='color:#212529'>Note:</span>
<span style='color:#212529'>This condition does not work for subtypes of**DocumentRevision**.</span>
<span style='color:#212529'>Also this condition requires the object to evaluate the condition, so using this condition does not filter the templates from the**New Item**dialog box**Define Workflow Information**page.</span>
<span style='background:white'>Example: Filter workflow template for DocumentRevision and its subtypes</span>
1.  «span style='color:#212529'»Use the following condition when any user can submit a**DocumentRevision**object or its subtype objects to a specific workflow template.  
    Fnd0DocRevSubTypesWF(WorkspaceObjecto,ImanTypet,UserSessionu)«/span»
2.  «span style='color:#212529'»Define the following expression:  
    ((o!=null)ANDu.fnd0ConditionHelper.fnd0isSubTypeOf  
    (o,"DocumentRevision"))OR((t!=null)AND  
    u.fnd0ConditionHelper.fnd0isSubTypeOf(t,"DocumentRevision"))«/span»
    - «span style='color:#212529'»The condition expression can validate when the object submitted is not null and the object type is a subtype of**DocumentRevision**using the**fnd0isSubTypeOf**function on the**fnd0ConditionHelper**class.  
      ((o!=null)ANDu.fnd0ConditionHelper.fnd0isSubTypeOf  
      (o,"DocumentRevision"))  
      Note:  
      The**Fnd0ConditionHelper**class is a common placeholder that provides generic operations that can be used by condition expressions. See other available operations for the**fnd0ConditionHelper**business object in Business Modeler IDE. This expression clause is evaluated when the user tries to submit an existing**DocumentRevision**object to the workflow.«/span»
    - «span style='color:#212529'»Next the expression checks whether the given type is not null:  
      ((t!=null)ANDu.fnd0ConditionHelper.fnd0isSubTypeOf  
      (t,"DocumentRevision"))  

      The condition expression can validate when the given type is subtype of**DocumentRevision**using the**fnd0isSubTypeOf**function of the**fnd0ConditionHelper**class.«/span»
<span style='background:white'>Example: Filter workflow templates for document revision and its subtypes when the session user belongs to the Engineering group.</span>
1.  «span style='color:#212529'»Use the following condition when any user from**Engineering**group can submit a**DocumentRevision**or its subtypes to a specific workflow template. This example condition uses a nested condition that allows the reuse of existing conditions to write complex expressions.  
    Fnd0DocRevSubTypes_EngrGroupWF(WorkspaceObjecto,ImanTypet,  
    UserSessionu)«/span»
2.  «span style='color:#212529'»Define the following expression:  
    (Condition::Fnd0DocRevSubTypesWF(o,t,u)=true)AND  
    (u.fnd0ConditionHelper.fnd0isSubGroupOf(u.group,"Engineering"))«/span»
    - «span style='color:#212529'»The expression first checks if the given object or type is a subtype of**DocumentRevision**.  
      ((o!=null)ANDu.fnd0ConditionHelper.fnd0isSubTypeOf  
      (o,"DocumentRevision"))  
      This expression reuses the existing condition described above which validates whether the given object or type is a subtype of**DocumentRevision**.«/span»
    - «span style='color:#212529'»Next the expression checks whether the user is a member of the**Engineering**group.  
      (u.fnd0ConditionHelper.fnd0isSubGroupOf(u.group,"Engineering"))  

      The condition expression can validate when the user is a member of the**Engineering**group or its subgroups. The expression uses the**fnd0isSubGroupOf**function on the**fnd0ConditionHelper**class to validate user membership.«/span»
<span style='background:white'>Example: Filter workflow templates for any objects belonging to a specific project</span>
1.  «span style='color:#212529'»Use the following condition for configuring the workflow template for any business objects from a specific project:  
    Fnd0_F35_ProjectDataWF(WorkspaceObjecto,ImanTypet,UserSessionu)«/span»
2.  «span style='color:#212529'»Define the following expression:  
    Function::INLIST("F35",o.project_list,"project_name")  
    The expression checks whether the object submitted is assigned to a specific project and validates if the submitted object's**project_list**property contains a project with the name**F35**.«/span»

*来自 \< <https://docs.sw.siemens.com/documentation/external/PL20211116078608127/en-US/tc_help_sc/tc/14.1/tc_help_sc/en-US/plm00071/id1637957/xid597197/condition_syntax_for_workflow_template_filtering.html>\>*

