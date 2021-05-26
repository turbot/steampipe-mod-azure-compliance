## Description

The Azure Storage blobs contain data like ePHI, Financial, secret or personal. Erroneously modified or deleted accidentally by an application or other storage account user cause data loss or data unavailability. It is recommended the Azure Storage be made recoverable by enabling soft delete configuration. This is to save and recover data when blobs or blob snapshots are deleted.

There could be scenarios where users accidentally run delete commands on Azure Storage blobs or blob snapshot or attacker/malicious user does it deliberately to cause disruption. Deleting an Azure Storage blob leads to immediate data loss / non-accessible data. There is a property of Azure Storage blob service to make recoverable blobs.

  - Soft Delete

    Enabling this configuration for azure storage ensures that even if blobs/data were deleted from the storage account, Blobs/data objects remain recoverable for a particular time which set in the "*Retention policies*" `[Retention policies can be 7 days to 365 days]`.

## Remediation

### From Console

1. Login to Azure Storage Accounts
2. For each Storage Account, navigate to `Data Protection` under `Data management` section
3. Select `set soft delete enabled` and enter a number of days you want to retain soft deleted data.

### From Command Line

Update `retention days` in below command

```bash
az storage blob service-properties delete-policy update --days-retained <RetentionDaysValue> --account-name <StorageAccountName> --enable true
```
