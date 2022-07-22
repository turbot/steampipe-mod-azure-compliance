## Description

Restrict security group creation to administrators only.

When creating security groups is enabled, all users in the directory are allowed to create new security groups and add members to those groups. Unless a business requires this day-to-day delegation, security group creation should be restricted to administrators only.

## Remediation

### From Console

1. Log in to [Azure Active Directory](https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview)
2. Go to `Groups`
3. Go to `General` in setting section
4. Set `Users can create security groups in Azure portals, API or PowerShell` to **No**

**Note:** By default, Users can create security groups is set to Yes.
