---
title: 联创PLM服务器要求-按现场环境更新
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:04:56
tags:
  - 联创
---

| PLMAppServer | 配置 |
|----|----|
| 主机名 | PLMAPPServer |
| 内存及CPU | 内存32G，cpu4\*8 |
| 本地盘 | C盘100G，D盘400G |
| 公网 ip | 172.16.254.41 |
<table style="width:80%;">
<colgroup>
<col style="width: 26%" />
<col style="width: 53%" />
</colgroup>
<thead>
<tr>
<th><p>---</p>
<p>PLMLicense</p></th>
<th>配置</th>
</tr>
</thead>
<tbody>
<tr>
<td>主机名</td>
<td>PLMLicServer</td>
</tr>
<tr>
<td>内存及CPU</td>
<td>内存16G，cpu2*2</td>
</tr>
<tr>
<td>本地盘</td>
<td>C盘100G</td>
</tr>
<tr>
<td>公网 ip</td>
<td>172.16.254.42</td>
</tr>
</tbody>
</table>
<table style="width:80%;">
<colgroup>
<col style="width: 26%" />
<col style="width: 53%" />
</colgroup>
<thead>
<tr>
<th><p>---</p>
<p>PLMTest</p></th>
<th>配置</th>
</tr>
</thead>
<tbody>
<tr>
<td>主机名</td>
<td>TC</td>
</tr>
<tr>
<td>内存及CPU</td>
<td>内存16G，cpu4*4</td>
</tr>
<tr>
<td>本地盘</td>
<td>C盘100G,D盘200G</td>
</tr>
<tr>
<td>公网 ip</td>
<td>172.16.254.39</td>
</tr>
</tbody>
</table>
<table>
<colgroup>
<col style="width: 24%" />
<col style="width: 37%" />
<col style="width: 37%" />
</colgroup>
<thead>
<tr>
<th><p>---</p>
<p>PLMSource（2台双机）</p></th>
<th>节点1</th>
<th>节点2</th>
</tr>
</thead>
<tbody>
<tr>
<td>主机名</td>
<td>PLMSource1</td>
<td>PLMSource2</td>
</tr>
<tr>
<td>内存及CPU</td>
<td>内存16G，cpu4*4</td>
<td>内存16G，cpu4*4</td>
</tr>
<tr>
<td>本地磁盘</td>
<td>C盘100G，D盘400G</td>
<td>C盘100G，D盘400G</td>
</tr>
<tr>
<td>公网IP ，网卡1</td>
<td>172.16.254.47</td>
<td>172.16.254.48</td>
</tr>
<tr>
<td>心跳IP，网卡2</td>
<td><p>172.1.1.10</p>
<p>子网掩码255.255.0.0</p></td>
<td><p>172.1.1.20</p>
<p>子网掩码255.255.0.0</p></td>
</tr>
<tr>
<td>群集名</td>
<td>PLMSource</td>
<td></td>
</tr>
<tr>
<td>群集IP</td>
<td><p>172.16.254.61</p>
<p></p></td>
<td></td>
</tr>
<tr>
<td>仲裁磁盘</td>
<td>Q盘，5G</td>
<td>共享盘，不能是一个分区。</td>
</tr>
<tr>
<td>oracle数据盘</td>
<td>E盘，1.5T</td>
<td>共享盘</td>
</tr>
<tr>
<td>文件数据盘</td>
<td>F盘，2.5T</td>
<td>共享盘</td>
</tr>
<tr>
<td>角色1</td>
<td><p>PLMORA</p>
<p>虚拟ip：172.16.254.62</p></td>
<td><p>监听服务</p>
<p>数据库服务，依赖于监听服务启动</p></td>
</tr>
<tr>
<td>角色2</td>
<td><p>PLMFSC</p>
<p>虚拟ip：172.16.254.63</p></td>
<td><p>FSC服务</p>
<p>依赖关系，依赖于PLMORA启动</p></td>
</tr>
</tbody>
</table>
