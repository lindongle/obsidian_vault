---
title: PPT不能浏览 officeonline
updated: 2026-06-05T23:49:41
created: 2026-07-05T17:04:40
---

PPT不能浏览 officeonline
2021年5月20日
9:56

<span style='color:#2D373C'>**eamcenter**Check-in fails for Office Online documents in Active Workspace</span>
<span style='color:#979797'>更新于2021年3月13日</span>
<span style='background:#879BAA'>Content & Document Management</span>
<span style='color:#2D373C'>Share</span>
<span style='background:#2387AA'>Copy to Clipboard</span>

<span style='color:#2D373C'>**详细信息**</span>
<span style='color:#2D373C'>**SYMPTOMS:**</span>

<span style='color:#2D373C'>Microsoft Office documents (Word, Excel, PowerPoint) edited in the Active Workspace viewer fail to check-in into Teamcenter and remain in edit mode.</span>

<span style='color:#2D373C'>A similar incorrect behavior is observed for documents that are coauthored thereby resulting in an inconsistent coauthoring session state.</span>

<span style='color:#2D373C'>These failures are due to recent updates to Google Chrome and Microsoft Chromium-based Edge browsers. The updates have set a default browser behavior that prevents Active Workspace and the Office Online viewer to communicate to Office Online Server for checking-in the edited documents.</span>

<span style='color:#2D373C'>Note: As of March, 2021 Microsoft has released a series of updates to their Office Online Server. As of their March 2021 cumulative update, Microsoft's Chromium-based Edge browser now works as expected for all scenarios. Google's Chrome browser now works for Word Online and Excel Online. PowerPoint Online still fails. See the workaround noted below for more details.</span>

<span style='color:#2D373C'>**WORKAROUND:**</span>

<span style='color:#2D373C'>To resolve this issue, perform the following steps:</span>
1.  <span style='color:#2D373C'>Close all Google Chrome browser sessions/windows and reopen the browser</span>
2.  <span style='color:#2D373C'>In your Google Chrome browser, open the following link:</span>
- <span style='color:#2D373C'>chrome://flags/#allow-sync-xhr-in-page-dismissal</span>
3.  <span style='color:#2D373C'>This should take you to the section: Allows synchronous XHR requests in page dismissal</span>
- <span style='color:#2D373C'>Set the value of the**Flag**to**Enabled**.</span>
4.  <span style='color:#2D373C'>Relaunch the browser.</span>
<span style='color:#2D373C'>ADDITIONAL INFORMATION:</span>

<span style='color:#2D373C'>Details of the browser change can be found here:</span>
<https://www.chromestatus.com/feature/4664843055398912>

<span style='color:#2D373C'>As of the</span>[March 9, 2021 Office Online Server update](https://support.microsoft.com/en-us/topic/description-of-the-security-update-for-office-online-server-march-9-2021-kb4493229-3ef63ab3-3945-ed16-b42b-51fc3d1ffd5e)<span style='color:#2D373C'>, this issue has still not been resolved for the PowerPoint Online viewer when running in the Google Chrome browser. The Word Online and Excel Online viewers now work as expected when running in the Google Chrome browser.</span>

<span style='color:#2D373C'>Here is our updated testing results:</span>

<span style='color:#2D373C'>**BROWSER**           **TEST RESULTS WITH PATCH APPLIED**</span>
<span style='color:#2D373C'>Mozilla Firefox        Always worked as expected (even before the patch was applied)</span>
<span style='color:#2D373C'>Google Chrome       Word Online and Excel Online work as expected;**PowerPoint Online still fails**</span>
<span style='color:#2D373C'>Microsoft Edge        Word Online, Excel Online and PowerPoint Online all work as expected</span>
<span style='color:#2D373C'>Chromium-based Edge  Word Online, Excel Online and PowerPoint Online all work as expected</span>

<span style='color:#2D373C'>**WORKAROUND \#2:**</span>

<span style='color:#2D373C'>If the above steps do no resolve the issue, verify the value of the**UNLOAD_OBJECTS**preference. If it is set to**false**, then set it to**true**.</span>

*来自 \< <https://support.sw.siemens.com/zh-CN/product/282219420/knowledge-base/PL8507423?pid=sc%3Asearch&pid_context=PowerPoint%20Online&index=content-external&audience=external>\>*
