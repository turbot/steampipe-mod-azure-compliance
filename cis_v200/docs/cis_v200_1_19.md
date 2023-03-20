## Description

Restrict security group creation to administrators only.

When creating security groups is enabled, all users in the directory are allowed to create new security groups and add members to those groups. Unless a business requires this day-to-day delegation, security group creation should be restricted to administrators only.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu.
2. Select `Azure Active Directory`.
3. Select `Groups`.
4. Select `General under Settings`.
5. Set `Users can create security groups in Azure portals, API or PowerShell` to `No`.

### Default Value

By default, `Users can create security groups in Azure portals, API or PowerShell` is set to `Yes`.