## Description

Enable "Microsoft Defender for SQL" on critical SQL Servers.

Microsoft Defender for SQL is a unified package for advanced SQL security capabilities. Microsoft Defender is available for Azure SQL Database, Azure SQL Managed Instance, and Azure Synapse Analytics. It includes functionality for discovering and classifying sensitive data, surfacing and mitigating potential database vulnerabilities, and detecting anomalous activities that could indicate a threat to your database. It provides a single go-to location for enabling and managing these capabilities.

## Remediation

### From Azure Console

1. Go to `SQL servers` For each "critical" server instance (e.g. production SQL servers)
2. Click `Microsoft Defender for Cloud`
3. Click `Enable Microsoft Defender for SQL`

### From Powershell

Enable `Advanced Data Security` for a SQL Server:

```bash
Set-AzSqlServerThreatDetectionPolicy -ResourceGroupName <resource group name> -ServerName <server name> -EmailAdmins $True
```

**Note:**

- Enabling 'Microsoft Defender for SQL' from the Azure portal enables `Threat Detection`
- Using Powershell command `Set-AzSqlServerThreatDetectionPolicy` enables `Microsoft Defender for SQL` for a SQL server

### Default Value

By default, `Microsoft Defender for SQL` is set to `Off`.
