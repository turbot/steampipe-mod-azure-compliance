## Description

In some cases, Azure Storage sets the minimum TLS version to be version 1.0 by default. TLS 1.0 is a legacy version and has known vulnerabilities. This minimum TLS version can be configured to be later protocols such as TLS 1.2.

TLS 1.0 has known vulnerabilities and has been replaced by later versions of the TLS protocol. Continued use of this legacy protocol affects the security of data in transit.

## Remediation

### From Azure Console

1. Login to Azure Portal using https://portal.azure.com
2. Go to `Storage Accounts`
3. Click on each Storage Account
4. Under `Setting` section, Click on `Configuration`
5. Set the `minimum TLS version` to be Version 1.2

### From Azure CLI

```bash
az storage account update \
    --name <storage-account> \
    --resource-group <resource-group> \
    --min-tls-version TLS1_2
```

### From Azure Powershell

To set the minimum TLS version, run the following command:

```bash
Set-AzStorageAccount -AccountName <STORAGEACCOUNTNAME> `
                     -ResourceGroupName <RESOURCEGROUPNAME> `
                     -MinimumTlsVersion TLS1_2
```

### Default Value

If a storage account is created through the portal, the MinimumTlsVersion property for that storage account will be set to TLS 1.2.

If a storage account is created through PowerShell or CLI, the MinimumTlsVersion property for that storage account will not be set, and defaults to TLS 1.0.