## Description

Enable automatic provisioning of the monitoring agent to collect security data. When this agent is turned on, Azure Security Center provisions the Microsoft Monitoring Agent on all existing supported Azure virtual machines and any new ones that are created.

The Microsoft Monitoring Agent scans for various security-related configurations and events such as system updates, OS vulnerabilities, endpoint protection, and provides alerts.

## Remediation

### From Console

Perform the following action to check Defender for Endpoint to access my data is enabled:

1. Go to `Microsoft Defender for Cloud`
2. Click on `Environment Settings`
3. Click on a subscription
4. Click on `Auto Provisioning` in the left column.
5. Ensure that `Log Analytics agent for Azure VMs` is set to `On`

### From Command Line

Use the below command to set `Automatic provisioning of monitoring agent` to `On`.

```bash
az account get-access-token --query "{subscription:subscription,accessToken:accessToken}" --out tsv | xargs -L1 bash -c 'curl -X PUT -H "Authorization: Bearer $1" -H "Content-Type: application/json" https://management.azure.com/subscriptions/$0/providers/Microsoft.Security/autoProvisioningSettings/default?api-version=2017-08-01-preview -d@"input.json"'
```

Where `input.json` contains the request body json data as mentioned below

```json
{
  "id":"/subscriptions/<Your_Subscription_Id>/providers/Microsoft.Security/autoProvisioningSettings/default",
  "name":"default",
  "type":"Microsoft.Security/autoProvisioningSettings",
  "properties":{
    "autoProvision":"On"
  }
}
```
