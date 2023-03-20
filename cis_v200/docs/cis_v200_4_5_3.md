## Description

Cosmos DB can use tokens or AAD for client authentication which in turn will use Azure RBAC for authorization. Using AAD is significantly more secure because AAD handles the credentials and allows for MFA and centralized management, and the Azure RBAC better integrated with the rest of Azure.

AAD client authentication is considerably more secure than token-based authentication because the tokens must be persistent at the client. AAD does not require this.

## Remediation

Map all the resources that currently access to the Azure Cosmos DB account with keys or access tokens.
Create an Azure Active Directory (AAD) identity for each of these resources:
For Azure resources, you can create a managed identity . You may choose between system-assigned and user-assigned managed identities.
For non-Azure resources, create an AAD identity.
Grant each AAD identity the minimum permission it requires. When possible, we recommend you use one of the 2 built-in role definitions: Cosmos DB Built-in Data Reader or Cosmos DB Built-in Data Contributor.
Validate that the new resource is functioning correctly. After new permissions are granted to identities, it may take a few hours until they propagate. When all resources are working correctly with the new identities, continue to the next step.
You can use the az resource update powershell command:
- $cosmosdbname = "cosmos-db-account-name"
- $resourcegroup = "resource-group-name"
- $cosmosdb = az cosmosdb show --name $cosmosdbname --resource-group
- $resourcegroup | ConvertFrom-Json
az resource update --ids $cosmosdb.id --set properties.disableLocalAuth=true --latest- include-preview.

### Default Value:

The default is to use tokens/keys for client authentication.
