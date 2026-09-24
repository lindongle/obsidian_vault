---
author: TcConsultant
source: 微信公众号
url: https://mp.weixin.qq.com/s?__biz=Mzg3NDg2NDUzOQ==&mid=2247484376&idx=1&sn=a60cc975cee39fe734dab34ab59423a3&chksm=cf71be82bf0cf4ff2ae2301ae5d694d4bbad2058ade3a9e2ab44658535a3eb08c886e54c5223&mpshare=1&scene=1&srcid=0923g55lCAFlixnJT5XCtQci&sharer_shareinfo=231721a0843cb067a8d3d4a46eb8fab2&sharer_shareinfo_first=231721a0843cb067a8d3d4a46eb8fab2#rd
Created: 2026-09-23 12:24:05
tags:
  - awc
  - 系统配置
id: 6eec5c7e-7e43-44f0-b813-405fd32581a0
created: 2026-09-24T08:37:17
updated: 2026-09-24T08:37:21
---

公众号名称：PLM菜鸟

作者名称：TcConsultant

发布时间：2026-09-23 08:30

在Red Hat上安装AWC 2512时，有些AWC的组件是需要以Container（容器）跑在Docker上的，比如Gateway；虚拟机频繁重启可能会导致Container异常，错误体现为awbuild最后一步publish时会失败

![[99-Assets/76ba2f49384b1d9868f1986681f7a605_MD5.png]]

打开Portainer控制台，可以看到Service都在running

![[99-Assets/63dfa4ab7bfd3800a9f04c550b3b883d_MD5.png]]

但是Container全部空白

![[99-Assets/f169b552df147afcb62c75d8e0227685_MD5.png]]

尝试重装Services和Docker都无法解决问题，转而分析具体问题：

## 1、看容器真实状态（发现5个Dead僵尸容器）

```
docker ps -a | grep -I dead
```

![[99-Assets/f72a8d776a108441ae848e6e908ddbbb_MD5.png]]

## 2、手动删除这5个僵尸容器

先停止Docker服务

```
sudo systemctl stop docker docker.socket
```

然后删除

```
sudo rm -rf /var/lib/docker/containers/df20278cfd172fa9eefa7358937c27ac9c264bf636eac3aa6cccc9227df3c798 \
/var/lib/docker/containers/b614d65c0a072c9300817a67fe34f31e75dea00c4eaab86e415a32360a816cce \
/var/lib/docker/containers/e21a67c6c6cfff60a0cc69160ef743509e7bbe2c3974b9995ee8f3d72182ac1a \
/var/lib/docker/containers/b178b6445617ad60bf77cc8051806f03a8950eebf5f9a8e984905f0db995adc5 \
/var/lib/docker/containers/6e52169a7256b71adf28f70f151d0b17894816bcdb8c5fbefe123ea0191f0e1b
```

最后启动Docker服务

```
sudo systemctl start docker
```

最终所有Container正常启动，Gateway也能正常运行

![[99-Assets/5b195c66e9bad7efbf02a487fc830a07_MD5.png]]

最终原因分析：

Docker主机上有5个残留的僵尸dead 容器（没有名字），是Swarm task滚动更新后留下的孤儿记录。Portainer前端一渲染到“无名容器”就整页崩溃变空白（Portainer 已知 bug #12948 / #12987）。Services页正常，因为它读的是服务列表、不读这些容器，建议升级Portainer。

---

内容效果不满意？[点此反馈](https://feedback.notebooksyncer.com/feedback/355adf0c_1790137444090?u=https%3A%2F%2Fmp.weixin.qq.com%2Fs%3F__biz%3DMzg3NDg2NDUzOQ%3D%3D%26mid%3D2247484376%26idx%3D1%26sn%3Da60cc975cee39fe734dab34ab59423a3%26chksm%3Dcf71be82bf0cf4ff2ae2301ae5d694d4bbad2058ade3a9e2ab44658535a3eb08c886e54c5223%26mpshare%3D1%26scene%3D1%26srcid%3D0923g55lCAFlixnJT5XCtQci%26sharer_shareinfo%3D231721a0843cb067a8d3d4a46eb8fab2%26sharer_shareinfo_first%3D231721a0843cb067a8d3d4a46eb8fab2%23rd&s=obsidian)