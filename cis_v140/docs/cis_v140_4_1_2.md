## Description

It is recommended to enable *Transparent Data Encryption* on every SQL database. Azure SQL database *transparent data encryption* helps to protect against the threat of malicious activity by performing real-time encryption and decryption of the database, associated backups and transaction log files at rest without requiring changes to the application.

Transparent Data Encryption (TDE) can be enabled or disabled on individual SQL Database level and not on the SQL Server level. TDE cannot be used to encrypt the logical master database in SQL Database.

Default setting for *Transparent data encryption* is set to *On*.

## Remediation

### From Console

1. Login to Azure console and navigate to [SQL Databases](https://portal.azure.com/#create/Microsoft.SQLDatabase).
2. For each DB instance, go to Security section from left pane.
3. Click on `Transparent data encryption`.
4. Set `Transparent data encryption` to **On**.
5. Click **Save**.

### From Command Line

```bash
az sql db tde set --resource-group <resourceGroup> --server <dbServerName> -- database <dbName> --status Enabled
```
