## Description

Create an activity log alert for the `Delete Security Solution` event.

Monitoring for Delete Security Solution events gives insight into changes to the active security solutions and may reduce the time it takes to detect suspicious activity.

## Remediation

### From Console

1. Login to `Azure Monitor` console
2. Select `Alerts`
3. Click On **New Alert Rule**
4. Under Scope, click **Select resource**
5. Select the appropriate subscription under Filter by `subscription`
6. Select `Policy Assignment` under **Filter by resource type**
7. Select `All` for **Filter by location**
8. Click on the `subscription resource` from the entries populated under `Resource`
9. Verify Selection preview shows All Policy assignment (policyAssignments) and your selected subscription name
10. Click **Done**
11. Under `Condition` section click **Add Condition**
12. Select `Delete Security Solutions` signal
13. Click **Done**
14. Under `Action group` in `Actions` section, select **Add action groups** and complete creation process or select appropriate action group
15. Under `Alert rule details`, enter `Alert rule name` and `Description`
16. Select appropriate `resource group` to save the alert to
17. Check `Enable alert rule` upon creation checkbox
18. Click **Create** alert rule

### From Command Line

Use the below command to create an Activity Log Alert for `Create` or `Update Network Security Groups`

```bash
az account get-access-token --query "{subscription:subscription,accessToken:accessToken}" \
--out tsv | xargs -L1 bash -c 'curl -X PUT -H "Authorization: Bearer $1" -H \
"Content-Type:application/json" \
https://management.azure.com/subscriptions/$0/resourceGroups/<Resource_Group_ToCreate_Alert_In>/providers/microsoft.insights/activityLogAlerts/<Unique_Alert_Name>?api-version=2017-04-01 -d@"input.json"'
```

Where input.json contains the Request body JSON data as mentioned below.

```json
{
  "location":"Global",
  "tags":{

  },
  "properties":{
     "scopes":[
        "/subscriptions/<Subscription_ID>"
     ],
     "enabled":true,
     "condition":{
        "allOf":[
           {
              "containsAny":null,
              "equals":"Administrative",
              "field":"category"
           },
           {
              "containsAny":null,
              "equals": "Microsoft.Security/securitySolutions/delete",
              "field":"operationName"
           }
        ]
     },
     "actions":{
        "actionGroups":[
           {
              "actionGroupId":"/subscriptions/<Subscription_ID>/resourceGroups/<Resource_Group_For_Alert_Group>/providers/microsoft.insights/actionGroups/<Alert_Group>",
              "webhookProperties":null
           }
        ]
     }
  }
}
```

Configurable Parameters for command line:

```bash
<Resource_Group_To Create_Alert_In> <Unique_Alert_Name>
```

Configurable Parameters for input.json:

```
<Subscription_ID> in scopes
<Subscription_ID> in actionGroupId
<Resource_Group_For_Alert_Group> in actionGroupId
<Alert_Group> in actionGroupId
```
