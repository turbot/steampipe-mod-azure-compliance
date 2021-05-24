## Description

Restrict security group management to administrators only.

Restricting security group management to administrators only prohibits users from making changes to security groups. This ensures that security groups are appropriately managed and their management is not delegated to non-administrators.

## Remediation

### From Console

1. Log in to [Azure Active Directory](https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview)
2. Go to `Groups`
3. Go to `General` in setting section
4. Ensure that `Owners can manage group membership requests in the Access Panel` is set to **No**

**Note:** By default, `Owners can manage group membership requests in the Access Panel` is set to `No`.
