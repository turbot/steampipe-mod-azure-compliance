## Description

Enable sensitive data encryption at rest using Customer Managed Keys rather than Microsoft Managed keys.

By default, data in the storage account is encrypted using Microsoft Managed Keys at rest. All Azure Storage resources are encrypted, including blobs, disks, files, queues, and tables. All object metadata is also encrypted. However, if you want to control and manage this encryption key yourself, you can specify a customer-managed key, that key is used to protect and control access to the key that encrypts your data. You can also choose to automatically update the key version used for Azure Storage encryption whenever a new version is available in the associated Key Vault.

## Remediation

### From Console

1. Login to `Azure Storage Accounts`
2. For each storage account, go to **Encryption** under `Security + networking`
3. Set **Customer Managed Keys**
4. Select the Encryption key and enter the appropriate setting value as documented [here](https://docs.microsoft.com/en-us/azure/storage/common/storage-service-encryption)
5. Click **Save**

**Note:** By default, Encryption type is set to Microsoft Managed Keys.
