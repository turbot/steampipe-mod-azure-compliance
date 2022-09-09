## Description

Enable `log_retention_days` on `PostgreSQL` Servers.

Enabling `log_retention_days` helps PostgreSQL Database to Sets number of days a log file is retained which in turn generates query and error logs. Query and error logs can be used to identify, troubleshoot, and repair configuration errors and suboptimal performance.

## Remediation

### From Azure Console

1. From Azure Home select the Portal Menu
2. Go to `Azure Database` for `PostgreSQL server`
3. For each database, click on `Server parameters`
4. Search for `log_retention_days`.
5. Enter value in range 4-7 (inclusive) and save.

### From Azure CLI

Use the below command to update `log_retention_days` configuration.

```bash
az postgres server configuration set --resource-group <resourceGroupName> --server-name <serverName> --name log_retention_days --value <4-7>
```

### Default Value

By default `log_retention_days` is disabled.