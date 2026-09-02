---
title: PPT不能浏览 officeonline
updated: 2026-09-02T16:30:04
created: 2026-07-05T17:04:40
---

PPT不能浏览 officeonline
2021年5月20日
9:56

**eamcenter**Check-in fails for Office Online documents in Active Workspace
更新于2021年3月13日
Content & Document Management
Share
Copy to Clipboard

**详细信息**
**SYMPTOMS:**

Microsoft Office documents (Word, Excel, PowerPoint) edited in the Active Workspace viewer fail to check-in into Teamcenter and remain in edit mode.

A similar incorrect behavior is observed for documents that are coauthored thereby resulting in an inconsistent coauthoring session state.

These failures are due to recent updates to Google Chrome and Microsoft Chromium-based Edge browsers. The updates have set a default browser behavior that prevents Active Workspace and the Office Online viewer to communicate to Office Online Server for checking-in the edited documents.

Note: As of March, 2021 Microsoft has released a series of updates to their Office Online Server. As of their March 2021 cumulative update, Microsoft's Chromium-based Edge browser now works as expected for all scenarios. Google's Chrome browser now works for Word Online and Excel Online. PowerPoint Online still fails. See the workaround noted below for more details.

**WORKAROUND:**

To resolve this issue, perform the following steps:
1.  Close all Google Chrome browser sessions/windows and reopen the browser
2.  In your Google Chrome browser, open the following link:
- chrome://flags/#allow-sync-xhr-in-page-dismissal
3.  This should take you to the section: Allows synchronous XHR requests in page dismissal
- Set the value of the**Flag**to**Enabled**.
4.  Relaunch the browser.
ADDITIONAL INFORMATION:

Details of the browser change can be found here:
<https://www.chromestatus.com/feature/4664843055398912>

As of the[March 9, 2021 Office Online Server update](https://support.microsoft.com/en-us/topic/description-of-the-security-update-for-office-online-server-march-9-2021-kb4493229-3ef63ab3-3945-ed16-b42b-51fc3d1ffd5e), this issue has still not been resolved for the PowerPoint Online viewer when running in the Google Chrome browser. The Word Online and Excel Online viewers now work as expected when running in the Google Chrome browser.

Here is our updated testing results:

**BROWSER**           **TEST RESULTS WITH PATCH APPLIED**
Mozilla Firefox        Always worked as expected (even before the patch was applied)
Google Chrome       Word Online and Excel Online work as expected;**PowerPoint Online still fails**
Microsoft Edge        Word Online, Excel Online and PowerPoint Online all work as expected
Chromium-based Edge  Word Online, Excel Online and PowerPoint Online all work as expected

**WORKAROUND \#2:**

If the above steps do no resolve the issue, verify the value of the**UNLOAD_OBJECTS**preference. If it is set to**false**, then set it to**true**.

*来自 \< <https://support.sw.siemens.com/zh-CN/product/282219420/knowledge-base/PL8507423?pid=sc%3Asearch&pid_context=PowerPoint%20Online&index=content-external&audience=external>\>*
