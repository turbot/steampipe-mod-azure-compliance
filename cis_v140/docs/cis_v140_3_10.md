## Description

The Storage Blob service provides scalable, cost-efficient objective storage in the cloud. Storage Logging happens server-side and allows details for both successful and failed requests to be recorded in the storage account. These logs allow users to see the details of read, write, and delete operations against the blobs. Storage Logging log entries contain the following information about individual requests: Timing information such as start time, end-to-end latency, and server latency, authentication details , concurrency information and the sizes of the request and response messages.

Storage Analytics logs contain detailed information about successful and failed requests to a storage service. This information can be used to monitor individual requests and to diagnose issues with a storage service. Requests are logged on a best-effort basis.

## Remediation

### From Console

1. Login to Azure Storage Accounts
2. Select the specific Storage Account.
3. Navigate to `Monitoring (classic)` section from left bar. Click the **Diagnostics settings (classic)** blade
4. Set the `Status` to **On**, if set to Off
5. Select `Blob properties`
6. Select `Read`, `Write` and `Delete` options under the **Logging** section to enable Storage `Logging` for Blob service.

### From Command Line

Use the below command to enable the Storage Logging for Blob service.

```bash
az storage logging update --account-name <storageAccountName> --account-key <storageAccountKey> --services b --log rwd --retention 90
```
