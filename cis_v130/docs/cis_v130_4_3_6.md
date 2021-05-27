## Description

It is recommended to enable *connection_throttling* on PostgreSQL Servers. Enabling *connection_throttling* helps the PostgreSQL database to set the verbosity of logged messages which in turn generates query and error logs with respect to concurrent connections, that could lead to a successful denial of service (DoS) attack by exhausting connection resources. A system can also fail or be degraded by an overload of legitimate users. Query and error logs can be used to identify, troubleshoot, and repair configuration errors and sub-optimal performance.

## Remediation

### From Console

1. Login to Azure console and navigate to [PostgreSQL Servers](https://portal.azure.com/#create/Microsoft.PostgreSQLServer).
2. For each database, go to `Settings` section from left pane.
3. Click on `Server parameters`.
4. Search for `connection_throttling`.
5. Click **ON** and save.

### From Command Line

Command to update `connection_throttling` configuration

```bash
az postgres server configuration set --resource-group <resourceGroupName> --server-name <serverName> --name connection_throttling --value on
```
