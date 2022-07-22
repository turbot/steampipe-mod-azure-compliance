## Description

It is recommended to disable access from Azure services to PostgreSQL Database Server. When access from Azure services is enabled, the server's firewall will accept connections from all Azure resources, including resources not in your subscription. This is usually not a desired configuration. Instead, setup firewall rules to allow access from specific network ranges or VNET rules to allow access from specific virtual networks.

## Remediation

### From Console

Perform the following action to check whether access from Azure services is enabled:

1. Login to Azure console and navigate to [PostgreSQL Servers](https://portal.azure.com/#create/Microsoft.PostgreSQLServer).
2. For each database, go to `Settings` section from left pane.
3. Click on `Connection security`.
4. In Firewall rules, ensure `Allow access to Azure services` is set to **No**.

### From Command Line

Command to delete the AllowAllAzureIps rule for PostgreSQL Database

```bash
az postgres server firewall-rule delete --name AllowAllAzureIps --resource- group <resourceGroupName> --server-name <serverName>
```
