## Description

Disable anonymous access to blob containers and disallow blob public access on storage account.

Anonymous, public read access to a container and its blobs can be enabled in Azure Blob storage. It grants read-only access to these resources without sharing the account key, and without requiring a shared access signature. It is recommended not to provide anonymous access to blob containers until, and unless, it is strongly desired. A shared access signature token should be used for providing controlled and timed access to blob containers. If no
anonymous access is needed on the storage account, it’s recommended to set allowBlobPublicAccess false.

## Remediation

### From Console

First, follow Microsoft documentation and create [shared access signature tokens](https://docs.microsoft.com/en-us/rest/api/storageservices/delegating-access-with-a-shared-access-signature) for your blob containers. Then,

1. Login to Azure Storage Accounts
2. For each storage account, go to `Containers` under **DATA STORAGE**
3. Select the container, click **Access policy**
4. Set **Change access level** in top bar, to `Private (no anonymous access)`
5. For each storage account overview page, under `Blob Service` check the value set
6. Click on selected storage account `Configuration` under settings section of left bar
7. Set **Disabled** if no anonymous access is needed on the storage account
8. Click **Save**

### From Command Line

1. Identify the container name from the audit command

2. Set the permission for public access to private(off) for the above container name, using the below command

```bash
az storage container set-permission --name <containerName> --public-access off --account-name <accountName> --account-key <accountKey>
```

3. Set Disabled if no anonymous access is wanted on the storage account

```bash
az storage account update --name <storage-account> --resource-group <resource-group> --allow-blob-public-access false
```

**Note:** By default, `Public access level` is set to `Private (no anonymous access)` for blob containers. By default, `AllowBlobPublicAccess` is set to `Null (allow in effect)` for storage account.
