## Description

The Azure Key Vault enables users to store and keep secrets within the Microsoft Azure environment. Secrets in the Azure Key Vault are octet sequences with a maximum size of 25k bytes each. The exp (expiration time) attribute identifies the expiration time on or after which the secret MUST NOT be used. By default, secrets never expire. It is thus recommended to rotate secrets in the key vault and set an explicit expiration time for all secrets. This ensures that the secrets cannot be used beyond their assigned lifetimes.

## Remediation

### From Console

1. Go to `Key vaults`
2. For each Key vault, click on `Keys`.
3. Under the `Settings` section, Make sure `Enabled` is set to `Yes`
4. Set an appropriate `EXPIRATION DATE` on all keys.

### From Command Line

Command to update the `Expiration Date` for the key

```bash
az keyvault key set-attributes --name <keyName> --vault-name <vaultName> -- expires Y-m-d'T'H:M:S'Z'
```

**Note**

By default, secrets do not expire.
