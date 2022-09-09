## Description

Enable `connection_throttling` on `PostgreSQL` Servers.

Enabling connection_throttling helps the PostgreSQL Database to Set the verbosity of logged messages. This in turn generates query and error logs with respect to concurrent connections that could lead to a successful Denial of Service (DoS) attack by exhausting connection resources. A system can also fail or be degraded by an overload of legitimate users. Query and error logs can be used to identify, troubleshoot, and repair configuration errors and sub-optimal performance.

## Remediation

### From Azure Console

1. Login to Azure Portal using https://portal.azure.com
2. Go to `Azure Database` for `PostgreSQL server`
3. For each database, click on `Server parameters`
4. Search for `connection_throttling`.
5. Click `ON` and save.

### From Azure CLI

Use the below command to update `connection_throttling` configuration.

```bash
az postgres server configuration set --resource-group <resourceGroupName> --server-name <serverName> --name connection_throttling --value on
```

### Default Value

By default, `connection_throttle.enable` is set to `Off`.