## Description

Enabling Azure Defender threat detection for Container Registries, providing threat intelligence, anomaly detection, and behavior analytics in the Azure Security Center. It also allows for greater defense-in-depth, with threat detection provided by the Microsoft Security Response Center (MSRC).

## Remediation

### From Console

Perform the following action to check Azure Defender is set to On for Container Registries:

1. Go to `Microsoft Defender for Cloud`
2. Select `Environment Settings` blade
3. Click on the subscription name
4. Select the `Defender plans` blade
5. On the line in the table for `Storage` Select `On` under `Plan`
6. Select `Save`

### From Command Line

Command to enable Azure defender for Container Registries

```bash
az account get-access-token --query "{subscription:subscription,accessToken:accessToken}" --out tsv | xargs -L1 bash -c 'curl -X PUT -H "Authorization: Bearer $1" -H "Content-Type: application/json" https://management.azure.com/subscriptions/$0/providers/Microsoft.Security/pricings/StorageAccounts?api-version=2018-06-01 -d@"input.json"'
```

Where `input.json` contains the request body json data as mentioned below

```json
{
  "id":"/subscriptions/<Your_Subscription_Id>/providers/Microsoft.Security/pricings/ContainerRegistry",
  "name":"ContainerRegistry",
  "type":"Microsoft.Security/pricings",
  "properties":{
    "pricingTier":"Standard"
  }
}
```
