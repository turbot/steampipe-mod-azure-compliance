## Description

Limit guest user permissions.

Limiting guest access ensures that guest accounts do not have permission for certain directory tasks, such as enumerating users, groups or other directory resources, and cannot be assigned to administrative roles in your directory. If guest access in not limited, they have the same access to directory data as regular users.

## Remediation

### From Console

1. Log in to [Azure Active Directory](https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview)
2. Go to `External Identities` in side bar
3. Go to `External collaboration settings` further from side bar
4. Set Guest users permissions to limited as per organization policy.

See more details [here](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/users-default-permissions#member-and-guest-users)
