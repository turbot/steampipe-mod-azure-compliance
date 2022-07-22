## Description

Enable security alert emails to subscription owners. Enabling security alert emails to subscription owners ensures that they receive security alert emails from Microsoft. This ensures that they are aware of any potential security issues and can mitigate the risk in a timely fashion.

## Remediation

### From Console

1. Go to `Microsoft Defender for Cloud`
2. Click on `Environment Settings`
3. Click on the appropriate Management Group, Subscription, or Workspace
4. Click on `Email notifications`
5. In the drop down of the `All users with the following roles` field select `Owner`
6. Click `Save`

### From Command Line

Use the below command to set `Send email also to subscription owners` to `On`.

```bash
az account get-access-token --query "{subscription:subscription,accessToken:accessToken}" --out tsv | xargs -L1 bash -c 'curl -X PUT -H "Authorization: Bearer $1" -H "Content-Type: application/json" https://management.azure.com/subscriptions/$0/providers/Microsoft.Security/securityContacts/default1 api-version=2017-08-01-preview -d@"input.json"'
```

Where `input.json` contains the request body json data as mentioned below

```json
{
  "id": "/subscriptions/<Your_Subscription_Id>/providers/Microsoft.Security/securityContacts/default1",
  "name": "default1",
  "type": "Microsoft.Security/securityContacts",
  "properties": {
  "email": "<validEmailAddress>",
  "alertNotifications": "On",
  "alertsToAdmins": "On",
  "notificationsByRole": "Owner"
  }
}
```
