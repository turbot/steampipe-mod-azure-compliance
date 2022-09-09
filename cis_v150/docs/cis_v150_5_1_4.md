## Description

Storage accounts with the activity log exports can be configured to use Customer Managed Keys (CMK).

Configuring the storage account with the activity log export container to use CMKs provides additional confidentiality controls on log data, as a given user must have read permission on the corresponding storage account and must be granted decrypt permission by the CMK.

## Remediation

### From Azure Portal

1. In right column, Click service `Storage Accounts` to access Storage account blade
2. Click on the storage account name
3. In Section `SETTINGS` click `Encryption`. It will show `Storage service encryption` configuration pane.
4. Check `Use your own key` which will expand `Encryption Key` Settings
5. Use option `Enter key URI` or `Select from Key Vault` to set up encryption with your own key

### From Azure CLI

```bash
az storage account update --name <name of the storage account> --resourcegroup <resource group for a storage account> --encryption-keysource=Microsoft.Keyvault --encryption-key-vault <Key Vault URI> --encryption-key-name <KeyName> --encryption-key-version <Key Version>
```

### Default Value

By default, for a storage account keySource is set to Microsoft.Storage allowing encryption with vendor Managed key and not a Customer Managed Key.