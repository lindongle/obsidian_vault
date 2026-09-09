---
title: ICD打包更新
updated: 2026-06-06T10:05
created: 2018-03-11T11:58:14
tags:
  - TC安装部署
---

1、将文件压缩为zip格式（不能压缩为rar然后修改后缀，否则会提示未能展开解决方案……zip），如cappcode.zip
![image1](95f9248042b14ee8906a5883c952bc13.gif)
2、复制一个icd文件进行编辑。文件命名与压缩包名字一致。cappcode.icd
![image2](bca072eed30f49bd82791fcda87b27a4.gif)
\# \$REVLINE_NO_HISTORY\$

\[NAME\]
CappCode for Rich Client 4-Tier

\[VERSION\]
2017081010

\[PREREQUISITE_SOLUTIONS\]
rac4t:11

\[SOLUTION\]
Y

\[SOLUTION_TYPE\]
DS_INSTANCE

\[COPYFILE\]
{
\[FROM\]
CappCode.zip
\[TO\]
wntx64
\[NAME\]
CappCode.zip
}
\[MANIFEST_INFO\]
{
\[SUBDIR\]
rac\plugins
\[DOWNLOAD_FILES\]
{
\[COMMON\]
\[NT_INTEL\]
\[WNTX64\]
CappCode.zip:2017081010
}

\[PACKAGED_FILES\]
{
\[COMMON\]

\[HPUX\]

\[LINUX\]

\[WNTX64\]
CappCode.zip:2017081010
}
}
3、新建更新文件夹，下面建立ICD文件夹，将压缩包与ICD文件夹并列放在更新文件夹中。icd文件放在icd文件夹下。
![image3](4aeb83d2afb6496392ea35dbea070f22.gif)
4、启动insweb，点击复制icd，定位到上面icd文件夹。点击确定进行复制。
5、选择分发实例，点击修改，点击右边复制ICD，提示进行复制，直接确定。
6、添加磁盘镜像，定位到上述zip所在文件夹。
6、如果分发该文件的第一版，则点击添加解决方案，找到icd文件中自定义的名字，勾选、确定。然后确定退出insweb。
7、如果分发给文件的第N版本，则修改ICD文件中的版本号（按文本递增），并覆盖zip文件。然后重新双击insweb.bat。点击复制icd。并重复5，然后点击重新安装解决方案，选中本次更新的解决方案，点击确定。然后退出insweb即可。
8、双击四层客户端，会自动将该压缩包下载到icd文件配置的文件路径中如rac\plugins（没有的文件夹会自动创建）。然后自动进行解压。解压完自动删除目录中的压缩文件。
icd文件中路径及压缩包均可配置多个。
报错：
1、双击时，卡在正在抽取界面
原因：压缩包内的文件存在中文。导致无法自动解压。
2、双击时，提示无法展开解决方案，zip。检查zip文件是否被损坏。

运行bat。设置自解压
![image4](f129f23d3fea4cf4a3b9917af6de879c.gif)
\# \$REVLINE_NO_HISTORY\$

\[NAME\]
jVueAX for Rich Client 4-Tier

\[VERSION\]
1.2

\[PREREQUISITE_SOLUTIONS\]
rac4t:11

\[SOLUTION\]
Y

\[SOLUTION_TYPE\]
DS_INSTANCE

\[COPYFILE\]
{
\[FROM\]
jVueAX.exe
\[TO\]
wntx64
\[NAME\]
jVueAX.exe
}
\[MANIFEST_INFO\]
{
\[SUBDIR\]
rac\plugins\reg
\[TARGETS\]
\<target name="new_solution_win64"\>
\<if\>
\<isadmin/\>
\<then\>
\<exec executable="\${SolutionPath}\jVueAX" failonerror="true"\>
\<arg value="/q"/\>
\</exec\>
\</then\>
\<else\>
\<messagebox message="Cannot regist jVueAX.ocx because Administrator login is required.\${LineSeparator}Install image can be found at \${SolutionPath}. Please have an Admin install it before using the product." ps="true"/\>
\</else\>
\</if\>
\</target\>
\[DOWNLOAD_FILES\]
{
\[COMMON\]
\[NT_INTEL\]
\[WNTX64\]
jVueAX.exe:1.2
}
}
