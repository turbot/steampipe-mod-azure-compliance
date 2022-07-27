## Description

TDE with Customer-managed key support provides increased transparency and control over the TDE Protector, increased security with an HSM-backed external service.

With TDE, data is encrypted at rest with a symmetric key (called the database encryption key) stored in the database or data warehouse distribution. To protect this data encryption key (DEK) in the past, only a certificate that the Azure SQL Service managed could be used. Now, with Customer-managed key support for TDE, the DEK can be protected with an asymmetric key that is stored in the Key Vault. Key Vault is a highly available and scalable cloud-based key store which offers central key management.

Based on business needs or criticality of data/databases hosted a SQL server, it is recommended that the TDE protector is encrypted by a key that is managed by the data owner (Customer-managed key).

## Remediation

### From Console

Perform the following action to check whether access from Azure services is enabled:

1. Login to Azure console and navigate to [SQL Servers](https://portal.azure.com/#create/Microsoft.SQLServer).
2. For required SQL server instance, go to `Security` section from left pane.
3. Click on `Transparent data encryption`.
4. Select `Customer-managed key` and select an admin.
5. Browse through your key vaults to select an existing key or create a new key in Key Vault.
6. Check `Make selected key the default TDE protector`.
5. Click **Save**.

### From Command Line

Command to encrypt SQL server's TDE protector with a Customer-managed key

```bash
az sql server tde-key >> Set --resource-group <resourceName> --server <dbServerName> --server-key-type {AzureKeyVault} [--kid <keyIdentifier>]
```

**Note**
- By Default, Microsoft managed TDE protector is enabled for a SQL server and is encrypted by Service-managed key.
- Ensuring TDE is protected by a Customer-managed key on SQL Server does not ensures the encryption of SQL Databases. TDE setting on individual SQL database decides whether database is encrypted or not
