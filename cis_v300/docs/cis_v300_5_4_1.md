## Description

Limiting your Cosmos DB to only communicate on whitelisted networks lowers its attack footprint.

Selecting certain networks for your Cosmos DB to communicate restricts the number of networks including the internet that can interact with what is stored within the database.

## Remediation

### From Azure Portal

1. Open the portal menu.
2. Select the Azure Cosmos DB blade.
3. Select a Cosmos DB account to audit.
4. Select `Networking`.
5. Under `Public network access`, select `Selected networks`.
6. Under `Virtual networks`, select `+ Add existing virtual network` or `+ Add a new virtual network`.
7. For existing networks, select subscription, virtual network, subnet and click `Add`. For new networks, provide a name, update the default values if required, and click `Create`.
8. Click `Save`.

### Default Value

By default, Cosmos DBs are set to have access all networks.
