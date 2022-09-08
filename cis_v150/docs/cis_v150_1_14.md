## Description

Require administrators or appropriately delegated users to register third-party applications.

It is recommended to only allow an administrator to register custom-developed applications. This ensures that the application undergoes a formal security review and approval process prior to exposing Azure Active Directory data. Certain users like developers or other high-request users may also be delegated permissions to prevent them from waiting on an administrative user. Your organization should review your policies and decide your needs.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu
2. Select `Azure Active Directory`
3. Then `Users`
4. Select `User settings`, set `Users can register applications` to `No`

Please **note** that at this point of time, there is no Azure CLI or other API commands
available to programmatically conduct security configuration for this recommendation.

### From Powershell

```bash
Connect-MsolService
Set-MsolCompanyInformation -UsersPermissionToCreateLOBAppsEnabled $False
```

### Default Value

By default, `Users can register applications` is set to "Yes".