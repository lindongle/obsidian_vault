---
title: filters.checkout.choices
updated: 2026-06-05T23:46
created: 2023-12-01T13:57:16
---

<span style='color:green'>**Assemblies Only**     Excludes any model that is not an assembly.</span>
<span style='color:green'>排除非装配的模型；</span>
<span style='color:green'>**Implied**         Includes "implied dependencies," i.e.models in the same item revision. (The "Required" filter excludes implied dependencies.)</span>
包括“隐式的依赖关系”，即相同Item版本的模型。(“Required”过滤器排除了隐式的依赖关系。)
<span style='color:green'>**Implied by Top**     Includes models in the same item revision as a model at the top of the hierarchy.</span>
包含顶层的模型对应的item版本的隐式依赖关系模型。
<span style='color:green'>**No Drawings**       Excludes implied drawings from the collection. "implied drawings" arethose in the same item revision.</span>
从集合中排除隐式的图纸。 “隐式图纸”是指同一Item版本中的图纸。
<span style='color:green'>**No Implied**       Excludes "implied dependencies," i.e. models in the same item revision.</span>
排除“隐式依赖关系”，即同一Item版本中的模型。
<span style='color:green'>**None**          Excludes all models from the collection, other than those at the top of the hierarchy.</span>
从集合中排除除顶层模型之外的所有模型。
<span style='color:green'>**Part to Assembly**    Adds an assembly model if it is referenced by a part, otherwise it does not change any previous filter's action. (The "Required"</span>
<span style='color:green'>filter excludes part to assembly relationships.)</span>
如果组件模型被零件引用，则添加该组件模型，否则不会更改任何先前过滤器的操作。 （“Reuired”筛选器将零件与装配体关系排除在外。）
<span style='color:green'>**Part to Part**      Adds a part model if it is referenced by a part, otherwise it does not change any previous filter's action. (The "Required"</span>
<span style='color:green'> filter excludes part to part relationships.)</span>
如果零件模型被零件引用，则添加该零件模型，否则不会更改任何先前过滤器的操作。 （“Reuired”筛选器排除Part到Part关系。）
<span style='color:green'>**Referenced by Top**    Adds a model if it is referenced by a model at the top of the hierarchy, otherwise it does not change any previous filter's action.</span>
如果模型被顶层模型引用，则添加该模型，否则它不会更改任何以前的筛选器的操作。
<span style='color:green'>**Required**        Adds models if they are required by SolidWorks, otherwise excludes models from the collection. Note: in assembly-to-assembly and assembly-to-part relations, the dependency is considered to be required if it is in the parent's BOM. If you remove a sub-assembly or part from the BOM in Teamcenter,the Manager will assume the dependency is not required.</span>
如果 SolidWorks 需要模型，则添加模型，否则将模型从集合中排除。 注意： 在“组件到组件”和“组件到零件”关系中，如果依赖关系位于父项的 BOM 表中，则认为该依赖关系是必需的。 如果从 Teamcenter 的 BOM 表中删除子装配体或部件，Manager 将假定不需要依赖关系。
<span style='color:green'>**Required Items**     Adds models if they are required by SolidWorks, plus their "implied dependencies,"  i.e. models or drawings in the same item revision. Otherwise, models are excluded from the collection. Note: in assembly-to-assembly and assembly-to-part relations, the dependency is considered to be required if it is in the parent's BOM. If you remove a sub-assembly or part from the BOM in Teamcenter, the Manager will assume the dependency is not required.</span>
<span style='color:#FA0000'>此选项可以下载子件的工程图</span>
如果 SolidWorks 需要模型，则添加模型及其“隐含依赖关系”，即同一Item版本中的模型或工程图。 否则，模型将从集合中排除。 注意： 在“组件到组件”和“组件到零件”关系中，如果依赖关系位于父项的 BOM 表中，则认为该依赖关系是必需的。 如果从 Teamcenter 的 BOM 表中删除子装配体或部件，Manager 将假定不需要依赖关系。
<span style='color:green'>**Suppressed**       Adds a model if it is referenced by a model in which it is suppressed, otherwise it does not change any previous filter's action. (The "Required" filter excludes suppressed models.)</span>
如果模型被隐含模型的模型引用，则添加该模型，否则不会更改任何以前的筛选器操作。 （“必需”筛选器不包括抑制的模型。
