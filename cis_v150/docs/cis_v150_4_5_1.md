## Description

Limiting your Cosmos DB to only communicate on whitelisted networks lowers its attack footprint.

Selecting certain networks for your Cosmos DB to communicate restricts the number of networks including the internet that can interact with what is stored within the database.

## Remediation

### From Azure Portal

1. Open the portal menu.
2. Select the Azure Cosmos DB blade
3. Select the subscription you wish to audit.
4. In the portal menu column select 'Firewalls and virtual networks'.
5. Select the Database you wish to audit.
6. Select 'Firewall and virtual networks'
7. Change the radio button for 'allow access from' is to 'selected networks'
8. Under the heading 'Virtual Networks' choose '+ Add existing virtual network' or '+ Add a new virtual network'.
9. For existing networks, select the subscription, virtual network, and subnet, then select 'Add'. For new networks follow similar steps but enter the configuration you desire

### Default Value

By default, Cosmos DBs are set to have access all networks.