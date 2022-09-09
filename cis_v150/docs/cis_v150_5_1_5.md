## Description

Enable AuditEvent logging for key vault instances to ensure interactions with key vaults are logged and available.

Monitoring how and when key vaults are accessed, and by whom enables an audit trail of interactions with confidential information, keys and certificates managed by Azure Keyvault. Enabling logging for Key Vault saves information in an Azure storage account that the user provides. This creates a new container named `insights-logs-auditevent` automatically for the specified storage account, and this same storage account can be used for collecting logs for multiple key vaults.

## Remediation

## From Azure Portal

1. Go to `Keyvaults`
2. For each Key vault
3. Go to `Diagnostic settings`
4. Click on `Edit Settings`
5. Enable `Archive to a storage account`
6. Check `AuditEvent`
7. Change the retention days to be 180, 0 (for indefinite) or as appropriate

## From Azure CLI

```bash
az monitor diagnostic-settings update --name "Key vault retention policy" --resource "" --set retentionPolicy.days=90
```

### Default Value

By default, Diagnostic AuditEvent logging is not enabled for Key Vault instances.