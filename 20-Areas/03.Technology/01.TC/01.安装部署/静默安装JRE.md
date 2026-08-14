---
title: 静默安装JRE
updated: 2026-06-13T22:12:00
created: 2026-07-05T17:04:40
tags:
  - TC安装部署
---

jdk-8u144-windows-x64.exe /s ADDLOCAL="ToolsFeature,SourceFeature,PublicjreFeature" INSTALLDIR=C:\Java\x64\jdk1.8.0_144 /INSTALLDIRPUBJRE=C:\Java\x64\jre1.8.0_144
