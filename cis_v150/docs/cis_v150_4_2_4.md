## Description

Configure 'Send scan reports to' with email ids of concerned data owners/stakeholders for a critical SQL servers.

Vulnerability Assessment (VA) scan reports and alerts will be sent to email ids configured at 'Send scan reports to'. This may help in reducing time required for identifying risks and taking corrective measures.

## Remediation

### From Azure Console

1. Go to `SQL servers`
2. Select a server instance
3. Click on `Security Center`
4. Ensure that `Microsoft Defender for SQL` is set to `Enabled`
5. Select `Configure` next to `Enabled at subscription-level`
6. In Section `Vulnerability Assessment Settings`, configure `Storage Accounts` if not already
7. Configure email ids for concerned data owners/stakeholders at 'Send scan reports to'
8. Click `Save`

### From Powershell

If not already, Enable Advanced Data Security for a SQL Server:

```bash
Set-AZSqlServerThreatDetectionPolicy -ResourceGroupName <resource group name>
-ServerName <server name> -EmailAdmins $True
```

To enable ADS-VA service and Set 'Send scan reports to'

```bash
Update-AzSqlServerVulnerabilityAssessmentSetting `
-ResourceGroupName "<resource group name>"`
-ServerName "<Server Name>"`
-StorageAccountName "<Storage Name from same subscription and same Location" `
-ScanResultsContainerName "vulnerability-assessment" `
-RecurringScansInterval Weekly `
-EmailSubscriptionAdmins $true `
-NotificationEmail @("mail1@mail.com" , "mail2@mail.com")
```

### Default Value

By default, 'Send reports to' is blank.