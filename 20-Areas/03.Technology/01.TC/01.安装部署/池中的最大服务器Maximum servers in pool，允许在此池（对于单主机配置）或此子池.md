---
title: 池中的最大服务器Maximum servers in pool，允许在此池（对于单主机配置）或此子池
updated: 2026-09-02T16:30:04
created: 2026-07-05T17:04:39
tags:
  - TC安装部署
---

![image1](0dcfb0b6e4424f0584287ee22399bca0.png)

«span style='font-family:"Microsoft YaHei";color:red'»池中的最大服务器«/span»Maximum servers in pool«span style='font-family:"Microsoft YaHei";color:red'»，«/span»«span style='font-family: "Microsoft YaHei"'»允许在此池（对于单主机配置）或此子池（对于多主机配置）中运行的«/span»Teamcenter«span style='font-family:"Microsoft YaHei"'»服务器进程的最大数量。«/span»
«span style='font-family:"Microsoft YaHei";color:red'»最小温服务器«/span»Minimum warm servers«span style='font-family:"Microsoft YaHei";color:red'»，«/span»«span style='font-family: "Microsoft YaHei"'»此池中已启动但未登录的«/span»Teamcenter«span style='font-family:"Microsoft YaHei"'»服务器进程的最小数目。«/span»
如果需要在不超过最大服务器进程数的情况下保持最小的热服务器数，服务器管理器会对正在使用的服务器进行超时。
«span style='font-family:"Microsoft YaHei";color:red'»目标服务器进程数«/span»Target number of server processes«span style='font-family:"Microsoft YaHei";color:red'»，«/span»«span style='font-family: "Microsoft YaHei"'»指定时间内此池或子池中可用的目标服务器进程数。«/span»
将这些值指定为用逗号分隔的时间和整数对。例如：0700 3，1700 2此值将服务器进程的目标数目设置为上午7点到下午5点之间的3个，以及下午5点到上午7点之间的2个。
•如果服务器进程数低于指定目标，则会添加温服务器以达到此数目。在这种情况下，热服务器的数量超过了最小值。即如果设置的target的进程数为100，但实际登录到该Pool服务器上的用户数为60，则会自动启动tcserver进程40个，以满足设置的target数量。如果最小温服务器个数为10，则40超过了设置的最小值10。
•如果服务器进程的数量超过指定的目标，则只保留最小数量的热服务器，并在服务器超时时终止服务器。**即如果设置的target的进程数为100，，如果温池数为20，则需要始终保持20个空闲tcserver以备登录，如果第101个用户登录，则会占用1个温池数量，则为保持20个空闲，会自动再启动一个空的tcserver。即温池可以设置为同一时间登录的最小用户数量，如果Max最大数量为150个，温池数量为20个，则最多允许登录数为150-20=130**

![image2](04f95d0749804c30861139d7df8119d7.png)

![image3](167e6866f8304a31ba90bbf0895dfb40.png)
«span style='font-family:"Microsoft YaHei";color:red'»参数说明«/span»Max Servers«span style='font-family: "Microsoft YaHei";color:red'»指«/span»«span style='font-family:"Microsoft YaHei"'»定允许在服务器池中运行的«/span»Teamcenter«span style='font-family:"Microsoft YaHei"'»服务器进程的最大数目。«/span»
单主机配置可以包含单个服务器池。如果创建多主机配置，则可以创建服务器池和子池。服务器总数不允许超过最大服务器值。
Min Warm Servers指定服务器池中已启动但未登录的Teamcenter服务器进程的最小数目(即提前预留的tcserever数)。
服务器管理器可以根据需要暂停服务器，但始终保持最小就绪（热）服务器。
目标服务器指定在指定时间内服务器池或子池中可用的服务器进程的目标数目。将这些值指定为以逗号分隔的时间和整数对。例如，值0700 3 1700 2将服务器进程的目标数目设置为从早上7点到下午5点的3台服务器。 从下午5点到早上7点有两台服务器。 如果服务器进程数低于指定的目标，则添加热服务器以达到此数目。 在这种情况下，热服务器的数量超过了最小值。如果服务器进程数超过指定的目标，则只保留最小数量的热服务器，服务器
超时时将终止。

