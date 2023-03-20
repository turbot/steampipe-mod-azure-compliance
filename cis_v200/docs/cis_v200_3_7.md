## Description

Disallowing public access for a storage account overrides the public access settings for individual containers in that storage account.

The default configuration for a storage account permits a user with appropriate permissions to configure public (anonymous) access to containers and blobs in a storage account. Keep in mind that public access to a container is always turned off by default and must be explicitly configured to permit anonymous requests. It grants read- only access to these resources without sharing the account key, and without requiring a shared access signature. It is recommended not to provide anonymous access to blob containers until, and unless, it is strongly desired. A shared access signature token or Azure AD RBAC should be used for providing controlled and timed access to blob containers. If no anonymous access is needed on any container in the storage account, it’s recommended to set allowBlobPublicAccess false at the account level, which forbids any container to accept anonymous access in the future.

## Remediation

### From Azure Portal

First, follow Microsoft documentation and create shared access signature tokens for your blob containers. Then,

1. Go to `Storage Accounts`.
2. For each storage account, go to `Networking` in `Security + networking`.
3. Set `Public Network Access` to `Disabled` if no anonymous access is needed on the storage account.

### From Azure CLI

Set 'Public Network Access' to `Disabled` on the storage account

1. Set 'Allow Blob Public Access' to false on the storage account

```bash
az storage account update --name <storage-account> --resource-group <resource-group> --public-network-access Disabled
```

### From PowerShell

For each Storage Account, run the following to set the `PublicNetworkAccess` setting to `Disabled`.

```bash
Set-AzStorageAccount -ResourceGroupName <resource group name> -Name <storage account name> -PublicNetworkAccess Disabled
```

### Default Value

By default, `Public Network Access` is set to `Enabled from all networks` for the Storage Account.
