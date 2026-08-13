---
title: 分类AI服务报错
updated: 2026-06-05T23:55
created: 2024-09-23T16:27:01
tags:
  - TC安装部署
---

Error: A dynamic link library (DLL) initialization routine failed.

at Object.Module.\_extensions..node (node:internal/modules/cjs/loader:1282:18)
at Module.load (node:internal/modules/cjs/loader:1076:32)
at Function.Module.\_load (node:internal/modules/cjs/loader:911:12)
at Module.require (node:internal/modules/cjs/loader:1100:19)
at require (node:internal/modules/cjs/helpers:119:18)
at Object.\<anonymous\> (D:\Siemens\Teamcenter2406\microservices\classification_ai_serving_service-1.0.0\node_modules\\tensorflow\tfjs-node\dist\index.js:58:16)
at Module.\_compile (node:internal/modules/cjs/loader:1198:14)
at Object.Module.\_extensions..js (node:internal/modules/cjs/loader:1252:10)
at Module.load (node:internal/modules/cjs/loader:1076:32)
at Function.Module.\_load (node:internal/modules/cjs/loader:911:12) {
code: 'ERR_DLOPEN_FAILED'
}

ERROR: License check failed. Please verify the appropriate license for Classification AI exists

使用tem删除Classification AI 微服务即可，（部署中心会自动识别到），部署中心生成脚本再重新部署一下。
