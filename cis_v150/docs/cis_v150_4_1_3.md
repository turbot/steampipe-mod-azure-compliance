## Description

Transparent Data Encryption (TDE) with Customer-managed key support provides increased transparency and control over the TDE Protector, increased security with an HSM-backed external service, and promotion of separation of duties.

Customer-managed key support for Transparent Data Encryption (TDE) allows user control of TDE encryption keys and restricts who can access them and when. Azure Key Vault, Azure’s cloud-based external key management system, is the first key management service where TDE has integrated support for Customer-managed keys. With Customer-managed key support, the database encryption key is protected by an asymmetric key stored in the Key Vault. The asymmetric key is set at the server level and inherited by all databases under that server.

## Remediation

### From Azure Console

1. Go to `SQL servers`

For the desired server instance

2. Click On `Transparent data encryption`
3. Set` Transparent data encryption` to `Customer-managed key`
4. Browse through your `key vaults` to Select an existing key or create a new key in
the Azure Key Vault.
5. Check `Make selected key the default TDE protector`

### From Azure CLI

Use the below command to encrypt SQL server's TDE protector with a Customermanaged key

```bash
az sql server tde-key set --resource-group <resourceName> --server
<dbServerName> --server-key-type {AzureKeyVault} --kid <keyIdentifier>
```

### Default Value

By Default, Microsoft managed TDE protector is enabled for a SQL server.