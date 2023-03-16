## Description

By default, Azure Functions, Web, and API Services can be deployed over FTP. If FTP is required for an essential deployment workflow, FTPS should be required for FTP login for all App Service Apps and Functions.

Azure FTP deployment endpoints are public. An attacker listening to traffic on a wifi network used by a remote employee or a corporate network could see login traffic in clear-text which would then grant them full control of the code base of the app or service. This finding is more severe if User Credentials for deployment are set at the subscription level rather than using the default Application Credentials which are unique per App.

## Remediation

### From Azure Portal

1. Go to the Azure Portal.
2. Select `App Services`.
3. Click on an app.
4. Select `Settings` and then `Configuration`.
5. Under `General Settings`, for the `Platform Settings`, the `FTP state` should be set to `Disabled` or `FTPS Only`.

### From Azure CLI

For each out of compliance application, run the following choosing either 'disabled' or 'FtpsOnly' as appropriate:

```bash
az webapp config set --resource-group <resource group name> --name <app name> --ftps-state [disabled|FtpsOnly]
```

### From PowerShell

For each out of compliance application, run the following:

```bash
Set-AzWebApp -ResourceGroupName <resource group name> -Name <app name> - FtpsState <Disabled or FtpsOnly>
```

### Default Value

By default, FTP based deployment is `All allowed`.
