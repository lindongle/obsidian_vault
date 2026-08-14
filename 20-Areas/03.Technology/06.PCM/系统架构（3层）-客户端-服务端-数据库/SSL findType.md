---
title: SSL findType
updated: 2026-06-05T23:43:40
created: 2026-07-05T17:04:51
---

**FindBySerialNumber（序列号）：**Find(X509FindType, Object, Boolean) 方法的 findValue 参数必须是一个字符串，该字符串表示证书对话框中显示的证书序列号，但不包含空格，或者由 GetSerialNumberString() 方法返回。
**FindByIssuerName（颁发者）：** Find(X509FindType, Object, Boolean) 方法的 findValue 参数必须是表示证书主题名称的字符串。与 FindBySubjectDistinguishedName 枚举值所提供的搜索相比，此搜索不太具体。使用 **FindBySubjectName（颁发给）** 值，Find(X509FindType, Object, Boolean) 方法使用提供的值执行不区分大小写的字符串比较。例如，如果您将“MyCert”传递给 Find(X509FindType, Object, Boolean) 方法，它将查找主题名称包含该字符串的所有证书，而不管其他主题值如何。按专有名称搜索是一种更精确的搜索。

**FindByThumbprint（指纹）：**Find(X509FindType, Object, Boolean) 方法的 findValue 参数必须是表示证书指纹的字符串。
[*X509FindType Enum (System.Security.Cryptography.X509Certificates) \| Microsoft Docs*](https://docs.microsoft.com/en-us/dotnet/api/system.security.cryptography.x509certificates.x509findtype?view=netframework-4.8)
