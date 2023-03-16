## Description

Disable access from Azure services to PostgreSQL Database Server.

If access from Azure services is enabled, the server's firewall will accept connections from all Azure resources, including resources not in your subscription. This is usually not a desired configuration. Instead, set up firewall rules to allow access from specific network ranges or VNET rules to allow access from specific virtual networks.

## Remediation

### From Azure Portal

1. Login to Azure Portal using [https://portal.azure.com](https://portal.azure.com).
2. Go to `Azure Database for PostgreSQL servers`.
3. For each database, click on `Connection security`.
4. Under `Firewall rules`, set `Allow access to Azure services` to `No`.
5. Click `Save`.

### From Azure CLI

Use the below command to delete the AllowAllWindowsAzureIps rule for PostgreSQL Database.

```bash
az postgres server firewall-rule delete --name AllowAllWindowsAzureIps -- resource-group <resourceGroupName> --server-name <serverName>
```

### Default Value

The Azure Postgres firewall is set to block all access by default.
