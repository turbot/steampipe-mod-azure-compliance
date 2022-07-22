## Description

Enabling Azure Defender threat detection for Azure SQL database servers, providing threat intelligence, anomaly detection, and behavior analytics in the Azure Security Center. It also allows for greater defense-in- depth, with threat detection provided by the Microsoft Security Response Center (MSRC).

## Remediation

### From Console

Perform the following action to check Azure Defender is set to On for Azure SQL database servers:

1. Go to `Microsoft Defender for Cloud`
2. Select `Environment Settings` blade
3. Click on the subscription name
4. Select the `Defender plans` blade
5. Review the chosen pricing tier. For the `Azure SQL Databases` resource type Plan should be set to `On`.

### From Command Line

Command to enable Azure defender for Azure SQL database servers

```bash
az account get-access-token --query "{subscription:subscription,accessToken:accessToken}" --out tsv | xargs -L1 bash -c 'curl -X PUT -H "Authorization: Bearer $1" -H "Content-Type: application/json" https://management.azure.com/subscriptions/$0/providers/Microsoft.Security/pricings/SqlServers?api-version=2018-06-01 -d@"input.json"'
```

Where `input.json` contains the request body json data as mentioned below

```json
{
  "id":"/subscriptions/<Your_Subscription_Id>/providers/Microsoft.Security/pricings/SqlServers",
  "name":"SqlServers",
  "type":"Microsoft.Security/pricings",
  "properties":{
    "pricingTier":"Standard"
  }
}
```
