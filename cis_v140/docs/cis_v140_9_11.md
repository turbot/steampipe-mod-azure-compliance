## Description

Encryption keys ,Certificate thumbprints and Managed Identity Credentials can be coded into the APP service, this renders them visible as part of the configuration, to maintain security of these keys it is better to store in an Azure Keyvault and reference them from the Keyvault.

App secrets control access to the application and thus need to be secured externally to the app configuration, storing the secrets externally and referencing them in the configuration also enables key rotation without having to redeploy the app service.

## Remediation

### From Console

It has 2 steps process

1. Setup `keyvault`.
2. Setup the app service to use keyvault.

For more information, refer guide for [Key Vault references for App service and functions](https://docs.microsoft.com/en-us/azure/app-service/app-service-key-vault-references)
