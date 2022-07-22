## Description

It is recommended to enable auditing on SQL Servers. Enabling *auditing* at the server level ensures that all existing and newly created databases on the SQL server instance are audited. Auditing policy applied on the SQL database does not override auditing policy and settings applied on the particular SQL server where the database is hosted.

Auditing tracks database events and writes them to an audit log in the Azure storage account. It also helps to maintain regulatory compliance, understand database activity, and gain insight into discrepancies and anomalies that could indicate business concerns or suspected security violations.

Default setting for *Auditing* is set to *Off*.

## Remediation

### From Console

1. Login to Azure console and navigate to [SQL Servers](https://portal.azure.com/#create/Microsoft.SQLServer).
2. For each server instance, go to Security section from left pane.
3. Click on `Auditing`.
4. Set `Enable Azure SQL Auditing` to **On** and select a storage account for log destination.
5. Click **Save**.

### From PowerShell

1. Get the list of all SQL Servers

```powershell
Get-AzureRmSqlServer
```

2. For each Server, enable auditing.

```powershell
Set-AzureRmSqlServerAuditingPolicy -ResourceGroupName <resource group name> - ServerName <server name> -AuditType <audit type> -StorageAccountName <storage account name>
```
