## Description

Enable AuditEvent logging for key vault instances to ensure interactions with key vaults are logged and available.

Monitoring how and when key vaults are accessed, and by whom, enables an audit trail of interactions with confidential information, keys, and certificates managed by Azure Keyvault. Enabling logging for Key Vault saves information in an Azure storage account which the user provides. This creates a new container named insights-logs-auditevent automatically for the specified storage account. This same storage account can be used for collecting logs for multiple key vaults.

## Remediation

## From Azure Portal

1. Go to `Key vaults`.
2. Select a Key vault.
3. Select `Diagnostic settings`.
4. Click on `Edit setting` against an existing diagnostic setting, or `Add diagnostic setting`.
5. If creating a new diagnostic setting, provide a name.
6. Check `Archive to a storage account`.
7. Under Categories, check `Audit Logs`.
8. Set an appropriate value for `Retention (days)`.
9. Click `Save`.

## From Azure CLI

To update an existing `Diagnostic Settings`

```bash
az monitor diagnostic-settings update --name "<diagnostics settings name>" -- resource <key vault resource ID> --set retentionPolicy.days=90
```

To create a new `Diagnostic Settings`

```bash
az monitor diagnostic-settings create --name <diagnostic settings name> -- resource <key vault resource ID> --logs "[{category:AuditEvents,enabled:true,retention- policy:{enabled:true,days:180}}]" --metrics "[{category:AllMetrics,enabled:true,retention- policy:{enabled:true,days:180}}]" <[--event-hub <event hub ID> --event-hub- rule <event hub auth rule ID> | --storage-account <storage account ID> |-- workspace <log analytics workspace ID> | --marketplace-partner-id <full
resource ID of third-party solution>]>
```

### From PowerShell

Create the `Log` settings object

```bash
$logSettings = @()
$logSettings += New-AzDiagnosticSettingLogSettingsObject -Enabled $true - RetentionPolicyDay 180 -RetentionPolicyEnabled $true -Category AuditEvent
```

Create the `Metric` settings object

```bash
$metricSettings = @()
$metricSettings += New-AzDiagnosticSettingMetricSettingsObject -Enabled $true -RetentionPolicyDay 180 -RetentionPolicyEnabled $true -Category AllMetrics
```

Create the `Diagnostic Settings` for each `Key Vault`

```bash
New-AzDiagnosticSetting -Name "<diagnostic setting name>" -ResourceId <key vault resource ID> -Log $logSettings -Metric $metricSettings [- StorageAccountId <storage account ID> | -EventHubName <event hub name> - EventHubAuthorizationRuleId <event hub auth rule ID> | -WorkSpaceId <log analytics workspace ID> | -MarketPlacePartnerId <full resource ID for third- party solution>]
```

### Default Value

By default, Diagnostic AuditEvent logging is not enabled for Key Vault instances.
