## Description

It is recommended to enable Vulnerability Assessment (VA) service scans for critical SQL servers and corresponding SQL databases. Enabling Azure Defender for SQL server does not enables Vulnerability Assessment capability for individual SQL databases unless storage account is set to store the scanning data and reports.

The Vulnerability Assessment service scans databases for known security vulnerabilities and highlight deviations from best practices, such as misconfigurations, excessive permissions, and unprotected sensitive data. Results of the scan include actionable steps to resolve each issue and provide customized remediation scripts where applicable.

Enabling Azure Defender for SQL does not enable VA scanning by setting Storage Account automatically.

## Remediation

### From Console

1. Login to Azure console and navigate to [SQL Servers](https://portal.azure.com/#create/Microsoft.SQLServer).
2. For each server instance, go to Security section from left pane.
3. Click on `Security Center`.
4. Make sure `Enable Azure Defender for SQL` is `On`.
5. Select `Configure` next to Azure Defender for SQL: Enabled at the server-level.
6. In section `VULNERABILITY ASSESSMENT SETTINGS`, select subscription and storage account.
7. Click **Save**.

### From PowerShell

Enable Azure Defender for a SQL if not enabled

```powershell
Set-AZSqlServerThreatDetectionPolicy -ResourceGroupName <resource group name> -ServerName <server name> -EmailAdmins $True
```

To enable ADS-VA service by setting Storage Account

```powershell
Update-AzSqlServerVulnerabilityAssessmentSetting ` -ResourceGroupName "<resource group name>"`
-ServerName "<Server Name>"`
-StorageAccountName "<Storage Name from same subscription and same Location" `
-ScanResultsContainerName "vulnerability-assessment" ` -RecurringScansInterval Weekly `
-EmailSubscriptionAdmins $true `
-NotificationEmail @("mail1@mail.com" , "mail2@mail.com")
```
