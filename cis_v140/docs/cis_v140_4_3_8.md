## Description

If Double Encryption is enabled, another layer of encryption is implemented at the hardware level before the storage or network level. Information will be encrypted before it is even accessed, preventing both interception of data in motion if the network layer encryption is broken and data at rest in system resources such as memory or processor cache. Encryption will also be in place for any backups taken of the database, so the key will secure access the data in all forms. For the most secure implementation of key based encryption, it is recommended to use a Customer Managed asymmetric RSA 2048 Key in Azure Key Vault.

## Remediation

### From Console

Perform the following action to check whether access from Azure services is enabled:

1. Go through the normal process of database creation.
2. On step 2 titled `Additional settings` ensure that `Infrastructure double encryption enabled` is `checked`
3. Acknowledge that you understand this will impact database performance.
4. Finish database creation as normal.
5. On the final `Review + create` screen, ensure that at the very bottom of the database properties, that `Infrastructure (Double) encryption` is `enabled`.

### From Command Line

Creating a New Server with Infrastructure Encryption Enabled

```bash
az postgres server create --resource-group <resourcegroup> --name <servername> --location <location> --admin-user <adminusername> --adminpassword <server_admin_password> --sku-name GP_Gen4_2 --version 11 --
infrastructure-encryption 'Enabled'
```

Updating a Server's Configuration

```bash
az postgres server configuration set -g <resourcegroup>-s <servername> --infrastructure-encryption <Enabled>
```
