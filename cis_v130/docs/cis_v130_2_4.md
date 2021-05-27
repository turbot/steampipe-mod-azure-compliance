## Description

Enabling Azure Defender threat detection for SQL servers on machines, providing threat intelligence, anomaly detection, and behavior analytics in the Azure Security Center. Enabling it allows for greater defense-in-depth, with threat detection provided by the Microsoft Security Response Center (MSRC).

## Remediation

### From Console

Perform the following action to check Azure Defender is set to On for SQL Servers on machines:

1. Login to Azure console and navigate to [Security Center](https://portal.azure.com/#blade/Microsoft_Azure_Security/SecurityMenuBlade/0).
2. Select `Pricing & settings` blade under Management.
3. Click on the subscription name, `Azure Defender plans` blade got selected.
4. For the `SQL Servers on machines` resource type `Plan` should be set to **On**.

Perform the following action to enable Azure Defender for SQL Servers on machines:

1. Login to Azure console and navigate to [Security Center](https://portal.azure.com/#blade/Microsoft_Azure_Security/SecurityMenuBlade/0).
2. Select `Pricing & settings` blade under Management.
3. Click on the subscription name, `Azure Defender plans` blade got selected.
4. For the `SQL Servers on machines` resource type `Plan` set it to **On**.

### From Command Line

Command to enable Azure defender for SQL Servers on machines

```bash
az account get-access-token --query "{subscription:subscription,accessToken:accessToken}" --out tsv | xargs -L1 bash -c 'curl -X PUT -H "Authorization: Bearer $1" -H "Content-Type: application/json" https://management.azure.com/subscriptions/$0/providers/Microsoft.Security/pr icings/StorageAccounts?api-version=2018-06-01 -d@"input.json"'
```

Where `input.json` contains the request body json data as mentioned below

```json
{
  "id":"/subscriptions/<Your_Subscription_Id>/providers/Microsoft.Security/pricings/ StorageAccounts",
  "name":"StorageAccounts",
  "type":"Microsoft.Security/pricings",
  "properties":{
    "SqlserverVirtualMachines":"Standard"
  }
}
```
