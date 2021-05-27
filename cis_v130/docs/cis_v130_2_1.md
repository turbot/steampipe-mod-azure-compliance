## Description

Enabling Azure Defender threat detection for Server, provides threat intelligence, anomaly detection, and behavior analytics in the Azure Security Center.

## Remediation

### From Console

Perform the following action to check Azure Defender is set to On for Servers:

1. Login to Azure console and navigate to [Security Center](https://portal.azure.com/#blade/Microsoft_Azure_Security/SecurityMenuBlade/0).
2. Select `Pricing & settings` blade under Management.
3. Click on the subscription name, `Azure Defender plans` blade got selected.
4. For the `Servers` resource type `Plan` should be set to **On**.

Perform the following action to enable Azure Defender for Servers:

1. Login to Azure console and navigate to [Security Center](https://portal.azure.com/#blade/Microsoft_Azure_Security/SecurityMenuBlade/0).
2. Select `Pricing & settings` blade under Management.
3. Click on the subscription name, `Azure Defender plans` blade got selected.
4. For the `Servers` resource type `Plan` set it to **On**.

### From Command Line

Command to enable Azure defender for servers

```bash
az account get-access-token --query "{subscription:subscription,accessToken:accessToken}" --out tsv | xargs -L1 bash -c 'curl -X PUT -H "Authorization: Bearer $1" -H "Content-Type: application/json" https://management.azure.com/subscriptions/$0/providers/Microsoft.Security/pr icings/VirtualMachines?api-version=2018-06-01 -d@"input.json"'
```

Where `input.json` contains the request body json data as mentioned below

```json
{
  "id":"/subscriptions/<Your_Subscription_Id>/providers/Microsoft.Security/pricings/ VirtualMachines",
  "name":"VirtualMachines",
  "type":"Microsoft.Security/pricings",
  "properties":{
    "pricingTier":"Standard"
  }
}
```
