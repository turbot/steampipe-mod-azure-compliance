## Description

Enables emailing security alerts to the subscription owner or other designated security contact. Enabling security alert emails ensures that security alert emails are received from Microsoft. This ensures that the right people are aware of any potential security issues and are able to mitigate the risk.

## Remediation

### From Console

1. Go to `Microsoft Defender for Cloud`
2. Click on `Environment Settings`
3. Click on the appropriate Management Group, Subscription, or Workspace
4. Click on `Email notifications`
5. Under 'Notification types', check the check box next to `Notify about alerts with the following severity (or higher):` and select `High` from the drop down menu
6. Click `Save`

### From Command Line

Use the below command to set `Send email notification for high severity alerts` to `On`

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
  "alertsToAdmins": "On"
  }
 }
```
