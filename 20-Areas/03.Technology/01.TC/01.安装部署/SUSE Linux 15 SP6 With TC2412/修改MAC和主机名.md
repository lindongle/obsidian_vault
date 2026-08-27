---
title: 修改MAC和主机名
updated: 2026-08-27T09:58:44
created: 2026-07-05T17:04:40
tags:
  - TC安装部署
---

1.  修改主机名：第二天去主机中执行
[Linux系统中修改MAC地址的方法-CSDN博客](https://blog.csdn.net/2203_75758128/article/details/132939098)
sudo ip link set dev ==eth0== down
sudo ip link set dev ==eth0== address 00:16:3E:1E:D0:3F
sudo ip link set dev ==eth0== up
2.  ![image1](ddf8eb61ea824a49933c1cae141f8271.png)
> [!note]+ OCR: ddf8eb61ea824a49933c1cae141f8271.png
> 虚拟机设置硬件  选项设备  摘要  设备状态内存  8 GB  已连接(C)处理器  启动时连接(O)硬盘(SCSI)  120 GB CD/DVD (SATA)  正在使用文件 E:\春风\SLE-...  网络连接5网络适配器  NAT
> ④USB控制器    存网络适配器高级设置  X  物理网络公声卡  状态(P)显示器  传入传输享主机的 IP 地址带宽(B):  不受限共享的专用网络Kbps(K):  络数据包丢失(%)(P)  0.0  日延迟(毫秒)(T):日传出传输带宽(A):  不受限  LAN 区段(S)...  高级(V)...Kbps(S):  日数据包丢失(%)(L):  0.0  日延迟(毫秒)(E):日MAC 地址(M)00:16:3E:1E:D0:3F  生成(G)确定  取消  帮助添加(A)...  移除(R)确定  取消  帮助

3.  修改主机名
hostnamectlset-hostnamePLMServer
