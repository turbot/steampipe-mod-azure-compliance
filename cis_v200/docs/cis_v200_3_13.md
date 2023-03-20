## Description

The Storage Blob service provides scalable, cost-efficient object storage in the cloud. Storage Logging happens server-side and allows details for both successful and failed requests to be recorded in the storage account. These logs allow users to see the details of read, write, and delete operations against the blobs. Storage Logging log entries contain the following information about individual requests: timing information such as start time, end-to-end latency, and server latency; authentication details; concurrency information; and the sizes of the request and response messages.

Storage Analytics logs contain detailed information about successful and failed requests to a storage service. This information can be used to monitor each individual request to a storage service for increased security or diagnostics. Requests are logged on a best- effort basis.

Storage Analytics logging is not enabled by default for your storage account.

## Remediation

### From Azure Portal

1. From the default portal page select `Storage Accounts`.
2. Select the specific Storage Account.
3. Click the `Diagnostics settings` under the `Monitoring` section in the left column.
4. Select the 'blob' tab indented below the storage account.
5. Click '+ Add diagnostic setting'.
6. Select `StorageRead`, `StorageWrite` and `StorageDelete` options under the `Logging` section to enable Storage Logging for Blob service.
7. Select a destination for your logs to be sent to.

### From Azure CLI

Use the below command to enable the Storage Logging for Blob service.

```bash
az storage logging update --account-name <storageAccountName> --account-key <storageAccountKey> --services b --log rwd --retention 90
```

### Default Value

By default, storage account blob service logging is disabled for read, write, and delete operations.
