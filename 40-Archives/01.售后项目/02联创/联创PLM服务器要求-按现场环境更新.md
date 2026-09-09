---
title: 联创PLM服务器要求-按现场环境更新
updated: 2026-06-11T18:37
created: 2018-06-06T10:42:14
tags:
  - 联创
---

| PLMAppServer | <span style='color:black'>配置</span> |
|----|----|
| <span style='color:black'>主机名</span> | <span style='color:black'>PLMAPPServer</span> |
| <span style='color:black'>内存及CPU</span> | <span style='color:black'>内存32G，cpu4\*8</span> |
| <span style='color:black'>本地盘</span> | <span style='color:black'>C盘100G，D盘400G</span> |
| <span style='color:black'>公网 ip</span> | <span style='color:black'>172.16.254.41</span> |
<table style="width:80%;">
<colgroup>
<col style="width: 26%" />
<col style="width: 53%" />
</colgroup>
<thead>
<tr>
<th><p>---</p>
<p>PLMLicense</p></th>
<th><span style='color:black'>配置</span></th>
</tr>
</thead>
<tbody>
<tr>
<td><span style='color:black'>主机名</span></td>
<td><span style='color:black'>PLMLicServer</span></td>
</tr>
<tr>
<td><span style='color:black'>内存及CPU</span></td>
<td><span style='color:black'>内存16G，cpu2*2</span></td>
</tr>
<tr>
<td><span style='color:black'>本地盘</span></td>
<td><span style='color:black'>C盘100G</span></td>
</tr>
<tr>
<td><span style='color:black'>公网 ip</span></td>
<td><span style='color:red'>172.16.254.42</span></td>
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
<th><span style='color:black'>配置</span></th>
</tr>
</thead>
<tbody>
<tr>
<td><span style='color:black'>主机名</span></td>
<td><span style='color:black'>TC</span></td>
</tr>
<tr>
<td><span style='color:black'>内存及CPU</span></td>
<td><span style='color:black'>内存16G，cpu4*4</span></td>
</tr>
<tr>
<td><span style='color:black'>本地盘</span></td>
<td><span style='color:black'>C盘100G,D盘200G</span></td>
</tr>
<tr>
<td><span style='color:black'>公网 ip</span></td>
<td><span style='color:black'>172.16.254.39</span></td>
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
<th><span style='color:black'>节点1</span></th>
<th><span style='color:black'>节点2</span></th>
</tr>
</thead>
<tbody>
<tr>
<td><span style='color:black'>主机名</span></td>
<td><span style='color:black'>PLMSource1</span></td>
<td><span style='color:black'>PLMSource2</span></td>
</tr>
<tr>
<td><span style='color:black'>内存及CPU</span></td>
<td><span style='color:black'>内存16G，cpu4*4</span></td>
<td><span style='color:black'>内存16G，cpu4*4</span></td>
</tr>
<tr>
<td><span style='color:black'>本地磁盘</span></td>
<td><span style='color:black'>C盘100G，D盘400G</span></td>
<td><span style='color:black'>C盘100G，D盘400G</span></td>
</tr>
<tr>
<td><span style='color:black'>公网IP ，网卡1</span></td>
<td><span style='color:red'>172.16.254.47</span></td>
<td><span style='color:red'>172.16.254.48</span></td>
</tr>
<tr>
<td><span style='color:black'>心跳IP，网卡2</span></td>
<td><p><span style='color:black'>172.1.1.10</span></p>
<p><span style='color:black'>子网掩码255.255.0.0</span></p></td>
<td><p><span style='color:black'>172.1.1.20</span></p>
<p><span style='color:black'>子网掩码255.255.0.0</span></p></td>
</tr>
<tr>
<td><span style='color:black'>群集名</span></td>
<td><span style='color:black'>PLMSource</span></td>
<td></td>
</tr>
<tr>
<td><span style='color:black'>群集IP</span></td>
<td><p><span style='color:red'>172.16.254.61</span></p>
<p><span style='color:black'></span></p></td>
<td><span style='color:black'></span></td>
</tr>
<tr>
<td><span style='color:black'>仲裁磁盘</span></td>
<td><span style='color:black'>Q盘，5G</span></td>
<td>共享盘，不能是一个分区。</td>
</tr>
<tr>
<td><span style='color:black'>oracle数据盘</span></td>
<td><span style='color:black'>E盘，1.5T</span></td>
<td>共享盘</td>
</tr>
<tr>
<td><span style='color:black'>文件数据盘</span></td>
<td><span style='color:black'>F盘，2.5T</span></td>
<td>共享盘</td>
</tr>
<tr>
<td><span style='color:black'>角色1</span></td>
<td><p><span style='color:black'>PLMORA</span></p>
<p><span style='color:red'>虚拟ip：172.16.254.62</span></p></td>
<td><p>监听服务</p>
<p>数据库服务，依赖于监听服务启动</p></td>
</tr>
<tr>
<td><span style='color:black'>角色2</span></td>
<td><p><span style='color:black'>PLMFSC</span></p>
<p><span style='color:red'>虚拟ip：172.16.254.63</span></p></td>
<td><p>FSC服务</p>
<p>依赖关系，依赖于PLMORA启动</p></td>
</tr>
</tbody>
</table>
