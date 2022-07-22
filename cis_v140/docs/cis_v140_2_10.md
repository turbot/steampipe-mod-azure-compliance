## Description

This setting enables Microsoft Cloud App Security (MCAS) integration with Security Center. Security Center offers an additional layer of protection by using Azure Resource Manager events, which is considered to be the control plane for Azure.

By analyzing the Azure Resource Manager records, Security Center detects unusual or potentially harmful operations in the Azure subscription environment. Several of the preceding analytics are powered by Microsoft Cloud App Security. To benefit from these analytics, subscription must have a Cloud App Security license. MCAS works only with Standard Tier subscriptions.

## Remediation

### From Console

Perform the following action to check Defender for Cloud Apps (MCAS):

1. Go to `Microsoft Defender for Cloud`
2. Select `Environment Settings` blade
3. Select `Security policy `blade
4. Click On `Edit Settings` to alter the the security policy for a subscription
5. Select the `Integrations` blade
6. Check/Enable option `Allow Microsoft Defender for Endpoint to access my data`
7. Select `Save`

### From Command Line

Command to enable Azure defender

```bash
az account get-access-token --query "{subscription:subscription,accessToken:accessToken}" --out tsv | xargs -L1 bash -c 'curl -X PUT -H "Authorization: Bearer $1" -H "Content-Type: application/json" https://management.azure.com/subscriptions/$0/providers/Microsoft.Security/settings/MCAS?api-version=2021-06-01 -d@"input.json"'
```

Where `input.json` contains the request body json data as mentioned below

```json
{
  "id":"/subscriptions/<Your_Subscription_Id>/providers/Microsoft.Security/settings/MCAS",
  "name":"DataExportSettings",
  "type":"Microsoft.Security/settings",
  "properties":{
    "enabled":"true"
  }
}
```
