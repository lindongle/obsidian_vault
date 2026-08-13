---
title: tortoisesvn-SVN图标覆盖无法正确显示 - ITranslater
updated: 2026-06-06T10:05
created: 2022-01-20T21:32:35
---

tortoisesvn-SVN图标覆盖无法正确显示 - ITranslater
星期四, 一月 20, 2022
1:32 下午

已剪辑自: <https://www.itranslater.com/qa/details/2583387274536813568>
我正在测试SVN。 配置完成后，我可以成功添加/提交文件。
但是，我在文件和文件夹上看不到状态图标。 谁能告诉我为什么？
[svn](https://www.itranslater.com/tag/2097013141459698688) [tortoisesvn](https://www.itranslater.com/tag/2102303084369150976)
[Windy](https://stackoverflow.com/users/822491/windy) asked 2020-07-13T23:55:17Z
15个解决方案
46 votes
就我而言，Dropbox叠加层在注册表中以“（引用的标识符）开头。我删除了所有”前缀，然后重新启动explorer.exe。
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\explorer\ShellIconOverlayIdentifiers
编辑：我安装了Windows 10，此解决方案不适用于我。 因此，我只是去了相同的注册表位置，删除了所有Google和SkyDrive记录，然后重新启动了explorer.exe。
第二次编辑：安装TortoiseGit后，无需任何自定义即可修复所有内容。
[Barry Guvenkaya](https://stackoverflow.com/users/3298119/barry-guvenkaya) answered 2020-07-13T23:56:26Z
29 votes
不幸的是，这是Windows上一个非常普遍的问题，其中图标未更新或消失了。 我觉得这很烦人。 通常可以通过刷新Windows文件夹（F5）或通过执行SVN清理来解决此问题，
Right click on the folder -\> TortoiseSVN -\> Clean up...  
Select Clean up working copy status
我从未能够永久解决此问题，这只是一种解决方法。 将TortoiseSVN保持在最新版本可能无济于事。
请注意，清理只会清理您的本地工作副本，不会对实际存储库做任何事情。 它是安全的操作。
显然，根据您的评论，这还不够。 您是否还有许多其他程序也使用覆盖图标？ 如果是这样，也许您可以在此线程中找到解决方案：Windows 7下没有显示TortoiseSVN图标？ 投票数第二多的答案还涉及网络驱动器等。
另外，安装后您是否重新启动了计算机？ 从TortoiseSVN常见问题解答：
您当然会在安装后重新启动PC吗？ 如果还没有，请现在就这样做。 TortoiseSVN是Windows Explorer Shell扩展，将与Explorer一起加载。
...
否则，请尝试进行修复安装（当然还要重新启动）。
[Avada Kedavra](https://stackoverflow.com/users/280104/avada-kedavra) answered 2020-07-13T23:55:57Z
28 votes
要解决此问题，请转到TortoiseSVN\>设置\>图标叠加\>状态缓存从默认更改为外壳。
如果使用驱动器A或B，请检查驱动器类型为A和B。
[Venkat](https://stackoverflow.com/users/4126628/venkat) answered 2020-07-13T23:56:51Z
11 votes
我遇到的问题是投递箱将其叠加层置于比SVN高的优先级
它们都在条目的开头放置空格，以将它们推到列表的顶部。
HKEY_LOCAL_MACHINE \\ SOFTWARE \\ Microsoft \\ Windows \\ CurrentVersion \\ Explorer \\ ShellIconOverlayIdentifiers \\
下一篇文章对此进行了更全面的说明，并显示了解决方法。
\[[HTTPS://]()呜呜呜.Gareth节目Saunders.co.UK/2015/03/22/managing-overlay-icons-佛如-Dropbox-安定-tortoise SVN-安定-tortoise git/\]
但是，由于我的机器上Dropbox经常更新相对性，并且我很少更新Tortoise SVN，因此我建议仅在Tortoise条目后面添加空格以将其推入列表，否则当Dropbox软件更新为 已安装。
[Sprotty](https://stackoverflow.com/users/101719/sprotty) answered 2020-07-13T23:57:33Z
7 votes
以下是步骤：
1.  运行“ regedit”并找到：“ HKEY_LOCAL_MACHINE \\ SOFTWARE \\ Microsoft \\ Windows \\ CurrentVersion \Explorer \\ ShellIconOverlayIdentifiers \\
2.  根据需要重命名文件夹（使用01\_，02_作为前缀）
3.  从任务管理器中终止explorer.exe，然后重新运行explorer.exe任务。
您会看到，根据给定的首选项，叠加层显示在您最初没有看到它们的地方
[comeOnGetIt](https://stackoverflow.com/users/3361121/comeongetit) answered 2020-07-13T23:58:11Z
5 votes
我在TortoiseGit和TortoiseSVN中遇到了这个问题。 与我为Tortoise所做的操作相比，DropBox重命名了其注册表项，并添加了更多的空格作为前缀“”。
Tortoise可以直接通过打开注册表编辑器单击TortoiseGit\>设置\>图标叠加\>叠加处理程序，然后单击启动注册表编辑器并重命名条目，以使第一个按字母顺序排列即可。
[TAdrian](https://stackoverflow.com/users/4019145/tadrian) answered 2020-07-13T23:58:35Z
3 votes
我的覆盖物突然消失了（或者我以为如此）。 我碰到了这篇文章\[<https://corengen.wordpress.com/2014/07/30/my-tortoisesvn-icon-overlays-have-disappeared/>\]，该文章指出Windows有15个用于覆盖图标的插槽； 4个窗口保留，其余11个留给其他应用程序。 不管注册表中有多少个覆盖项，Windows都会按字母顺序选择前11个。
当我升级Office时，OneDrive添加了覆盖图标-带很多空格-将Tortoise的覆盖图推到了阈值以下：Windows注册表由于我没有使用OneDrive，解决方案是在OneDrive项名中添加“ z” 。
[janidlo](https://stackoverflow.com/users/2800086/janidlo) answered 2020-07-13T23:59:01Z
3 votes
就我而言，乌龟图标根本没有显示，我尝试了这个并解决了我的问题：
1.  打开注册表
2.  HKEY_LOCAL_MACHINE \\ SOFTWARE \\ Microsoft \\ Windows \\ CurrentVersion \\ explorer \\ ShellIconOverlayIdentifiers
3.  删除所有文件夹OneDrive
4.  删除所有文件夹SkyDrive
（关键是将所有乌龟文件夹放在顶部）
1.  打开TaskManager并杀死资源管理器
2.  通过TaskManager重新运行资源管理器
[Isma Rekathakusuma](https://stackoverflow.com/users/8198089/isma-rekathakusuma) answered 2020-07-13T23:59:51Z
1 votes
就像Avada Kedavra所说的那样，这不是问题，实际上，此内容在“图标叠加设置”部分中进行了记录，并且还显示了波纹管。 您可以阅读并选择最喜欢的一种。
由于获取工作副本的状态需要花费相当长的时间， TortoiseSVN使用缓存来存储状态，因此资源管理器不会 在显示叠加层时会变得过于拥挤。 您可以选择 TortoiseSVN的缓存类型应根据您的系统和 此处的工作副本大小：
默认
在单独的进程中缓存所有状态信息 （TSVNCache.exe）。 该过程会监视所有驱动器的更改并 如果工作副本中的文件被修改，则再次获取状态。 该进程以最低的优先级运行，因此其他程序 不要因为它而被束缚。 这也意味着状态 信息不是实时的，但可能需要花费几秒钟的时间 叠加以进行更改。
优点：叠加层以递归方式显示状态，即文件是否 在工作副本内部的深处被修改，直到工作文件夹为止的所有文件夹 复制根也将显示修改后的叠加层。 而且自过程以来 可以将通知发送到外壳，左树上的覆盖 视图通常也会改变。
缺点：即使您不工作，该流程也会持续运行 在您的项目上。 它也使用大约10-50 MB的RAM，具体取决于 工作副本的数量和大小。
贝壳
缓存是直接在Shell扩展dll中完成的，但是 仅适用于当前可见的文件夹。 每次导航到 另一个文件夹，状态信息再次被获取。
优点：只需要很少的内存（大约1 MB RAM），并且可以 实时显示状态。
缺点：由于仅缓存了一个文件夹，因此叠加层不会显示 状态递归。 对于大型工作副本，可能需要更多时间 在资源管理器中显示文件夹而不是使用默认缓存。 还有 mime-type列不可用。
没有
使用此设置，TortoiseSVN不会在以下位置获取状态 全部在资源管理器中。 因此，文件不会覆盖并 如果对文件夹进行了版本控制，则仅会获得“正常”覆盖。 没有别的 显示了叠加层，也没有多余的列可用。
优点：绝对不使用额外的内存，并且不会减慢速度 浏览器中的所有资源管理器。
缺点：文件和文件夹的状态信息未显示在 资源管理器。 要查看您的工作副本是否被修改，您必须使用 “检查修改”对话框。
[Cleinilton Fernandes](https://stackoverflow.com/users/3738405/cleinilton-fernandes) answered 2020-07-14T00:01:11Z
0 votes
首先清除Windows系统中的临时文件，然后重新启动系统。
运行\> %temp%\>删除所有文件
[Sharathi RB](https://stackoverflow.com/users/3715564/sharathi-rb) answered 2020-07-14T00:01:35Z
0 votes
从Windows 7升级到10时，我遇到了同样的问题。最终，我必须重新安装SVN并重新启动系统，然后它才能正常工作。 但是，我必须手动将每个SVN目录升级到新的SVN 1.8格式（右键单击将其自动显示在资源管理器中，以将目录升级到最新版本）。 希望这可以帮助。
[chandank](https://stackoverflow.com/users/1390050/chandank) answered 2020-07-14T00:01:56Z
0 votes
我找到了一个简单的解决方案，只需打开TortoiseSVN的“设置”，然后展开“图标覆盖”，选择“图标集”并更改图标集。
我的默认图标集是XP Style，我将其更改为Win10，因为Win10是我当前使用的操作系统。
![image1](27b992c885db43e094a22cd19573af63.jpg)
重新启动计算机，问题得到解决。
[Jiahao Cai](https://stackoverflow.com/users/5685664/jiahao-cai) answered 2020-07-14T00:02:24Z
0 votes
Windows上的Tortoise SVN经常与实际文件状态失去同步。在这种情况下，请尝试执行svn cleanup。
另外，它也可能取决于源文件的位置，不同的驱动器，网络驱动器等。Tortoise中有一个选项允许或禁止在远程驱动器上叠加图标。
签入：TortoiseSVN /设置/图标叠加/驱动器类型
[fduff](https://stackoverflow.com/users/1052126/fduff) answered 2020-07-14T00:02:53Z
0 votes
就我而言，所有图标突然消失了。
解决方案：
1.  转到任务管理器并杀死资源管理器
2.  在任务管理器文件中（新任务 （运行））=\>资源管理器
一切又出现了...
[mkane](https://stackoverflow.com/users/6203414/mkane) answered 2020-07-14T00:03:31Z
-1 votes
他们在安装Ankh SVN之后出现了
[Ned](https://stackoverflow.com/users/1438535/ned) answered 2020-07-14T00:03:50Z
translate from [https://stackoverflow.com:/questions/12069772/svn-icon-overlays-not-showing-properly](https://stackoverflow.com/questions/12069772/svn-icon-overlays-not-showing-properly)
