---
title: 分类ai索引微服务后台log一直报错
updated: 2026-06-06T10:09
created: 2024-07-26T17:17:22
---

![image1](189257b90fe24b49a6c721a07c2a6373.png)
D:\Siemens\Teamcenter13\microservices\classification_ai_serving_service-1.0.0\>nodejs\node.exe app.js 0
node:internal/modules/cjs/loader:1282
return process.dlopen(module, path.toNamespacedPath(filename));
^

Error: A dynamic link library (DLL) initialization routine failed.

at Object.Module.\_extensions..node (node:internal/modules/cjs/loader:1282:18)
at Module.load (node:internal/modules/cjs/loader:1076:32)
at Function.Module.\_load (node:internal/modules/cjs/loader:911:12)
at Module.require (node:internal/modules/cjs/loader:1100:19)
at require (node:internal/modules/cjs/helpers:119:18)
at Object.\<anonymous\> (D:\Siemens\Teamcenter13\microservices\classification_ai_serving_service-1.0.0\node_modules\\tensorflow\tfjs-node\dist\index.js:58:16)
at Module.\_compile (node:internal/modules/cjs/loader:1198:14)
at Object.Module.\_extensions..js (node:internal/modules/cjs/loader:1252:10)
at Module.load (node:internal/modules/cjs/loader:1076:32)
at Function.Module.\_load (node:internal/modules/cjs/loader:911:12) {
code: 'ERR_DLOPEN_FAILED'

