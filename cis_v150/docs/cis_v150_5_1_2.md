## Description

A Diagnostic Setting must exist. If a Diagnostic Setting does not exist, the navigation and options within this recommendation will not be available. Please review the recommendation at the beginning of this subsection titled: "Ensure that a 'Diagnostic Setting' exists."

The diagnostic setting should be configured to log the appropriate activities from the control/management plane.

A diagnostic setting controls how the diagnostic log is exported. Capturing the diagnostic setting categories for appropriate control/management plane activities allows proper alerting.

## Remediation

### From Azure Portal

1. Go to `Azure Monitor`
2. Click `Activity log`
3. Click on `Diagnostic settings`
4. Click on `Add diagnostic setting`
5. Enter a name for your new Diagnostic Setting
6. Check the following categories: `Administrative, Alert, Policy, and Security`
7. Choose the destination details according to your organization's needs.

### Using ARM Template via AZ PowerShell cmdlets

Create a file to hold the JSON

```bash
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-
  01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "settingName": {
    "type": "String"
    },
    "workspaceId": {
    "type": "String"
    }
  },
  "resources": [
    {
      "type": "Microsoft.Insights/diagnosticSettings",
      "apiVersion": "2017-05-01-preview",
      "name": "[parameters('settingName')]",
      "dependsOn": [],
      "properties": {
        "workspaceId": "[parameters('workspaceId')]",
        "logs": [
          {
          "category": "Administrative",
          "enabled": true
          },
          {
          "category": "Alert",
          "enabled": true
          },
          {
          "category": "Autoscale",
          "enabled": false
          },
          {
          "category": "Policy",
          "enabled": true
          },
          {
          "category": "Recommendation",
          "enabled": false
          },
          {
          "category": "ResourceHealth",
          "enabled": false
          },
          {
          "category": "Security",
          "enabled": true
          },
          {
          "category": "ServiceHealth",
          "enabled": false
          }
        ]
      }
    }
  ]
}
```

Reference the JSON in the New-AzSubscriptionDeployment call

```bash
$OMSWorkspace = Get-AzResource -ResourceType
"Microsoft.OperationalInsights/workspaces" -Name <Workspace Name>
New-AzSubscriptionDeployment -Name CreateDiagnosticSetting -location eastus -
TemplateFile CreateDiagnosticSetting.jsonc -settingName "Send Activity log to
workspace" -workspaceId $OMSWorkspace.ResourceId
```

### Default Value

When the diagnostic setting is created using Azure Portal, by default no categories are selected.