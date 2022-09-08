## Description

The storage account container containing the activity log export should not be publicly accessible.

Allowing public access to activity log content may aid an adversary in identifying weaknesses in the affected account's use or configuration.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu
2. Search for `Storage Accounts` to access Storage account blade
3. Click on the storage account name
4. In Section `Blob Service `click `Containers`. It will list all the containers in next blade
5. Look for a record with container named as `insight-operational-logs`. Click ... from right most column to open `Context menu`
6. Click `Access Policy` from `Context Menu` and set `Public Access Level` to `Private (no anonymous access)`

### From Azure CLI

```bash
az storage container set-permission --name insights-operational-logs --account-name <Storage Account Name> --public-access off
```

### Default Value

By default, public access is set to null (allowing only private access) for a container with activity log export.