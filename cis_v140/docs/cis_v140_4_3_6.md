## Description

It is recommended to enable *log_retention_days* on PostgreSQL Servers. Enabling *log_retention_days* helps PostgreSQL database to sets number of days a log file is retained which in turn generates query and error logs. Query and error logs can be used to identify, troubleshoot, and repair configuration errors and sub-optimal performance.

## Remediation

### From Console

1. Login to Azure console and navigate to [PostgreSQL Servers](https://portal.azure.com/#create/Microsoft.PostgreSQLServer).
2. For each database, go to `Settings` section from left pane.
3. Click on `Server parameters`.
4. Search for `log_retention_days`.
5. Enter value in range of `4-7` and click save.

### From Command Line

Command to update `log_retention_days` configuration

```bash
az postgres server configuration show --resource-group <resourceGroupName> --server-name <serverName> --name log_retention_days
```
