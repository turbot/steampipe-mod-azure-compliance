## Description

Security Center emails the subscription owners whenever a high-severity alert is triggered for their subscription. You should provide a security contact email address as an additional email address.

Azure Security Center emails the Subscription Owner to notify them about security alerts. Adding your Security Contact's email address to the 'Additional email addresses' field ensures that your organization's Security Team is included in these alerts. This ensures that the proper people are aware of any potential compromise in order to mitigate the risk in a timely fashion.

## Remediation

### From Console

1. Go to `Microsoft Defender for Cloud`
2. Click on `Environment Settings`
3. Click on the appropriate Management Group, Subscription, or Workspace
4. Click on `Email notifications`
5. Enter a valid security contact email address (or multiple addresses separated by commas) in the `Additional email addresses` field
6. Click `Save`

### From Command Line

Use the below command to set Security contact emails to `On`.

```bash
az account get-access-token --query "{subscription:subscription,accessToken:accessToken}" --out tsv | xargs -L1 bash -c 'curl -X PUT -H "Authorization: Bearer $1" -H "Content-Type: application/json" https://management.azure.com/subscriptions/$0/providers/Microsoft.Security/securityContacts/default?api-version=2020-00-01-preview -d@"input.json"'
```

Where `input.json` contains the request body json data as mentioned below

```json
{
  "id":"/subscriptions/<Your_Subscription_Id>/providers/Microsoft.Security/autoProvisioningSettings/default",
  "name":"default",
  "type":"Microsoft.Security/securityContacts",
  "properties":{
    "email": "<validEmailAddress>",
    "alertNotifications": "On",
    "alertsToAdmins": "On"
  }
}
```