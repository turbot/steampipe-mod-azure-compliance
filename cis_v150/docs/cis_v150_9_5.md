## Description

Managed service identity in App Service provides more security by eliminating secrets from the app, such as credentials in the connection strings. When registering with Azure Active Directory in App Service, the app will connect to other Azure services securely without the need for usernames and passwords.

App Service provides a highly scalable, self-patching web hosting service in Azure. It also provides a managed identity for apps, which is a turn-key solution for securing access to Azure SQL Database and other Azure services.

## Remediation

### From Azure Portal

1. Login to Azure Portal using https://portal.azure.com
2. Go to `App Services`
3. Click on each App
4. Under `Setting` section, Click on `Identity`
5. Under the `System assigned` pane, set `Status` to `On`

### From Azure CLI

To set Register with Azure Active Directory feature for an existing app, run the following command

```bash
az webapp identity assign --resource-group <RESOURCE_GROUP_NAME> --name <APP_NAME>
```

### From PowerShell

To register with Azure Active Directory feature for an existing app, run the following command:

```bash
Set-AzWebApp -AssignIdentity $True -ResourceGroupName <resource_Group_Name> - Name <App_Name>
```

### Default Value

By default, Managed service identity via Azure AD is disabled.