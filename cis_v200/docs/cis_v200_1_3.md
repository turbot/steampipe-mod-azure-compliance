## Description

Require administrators or appropriately delegated users to create new tenants.

It is recommended to only allow an administrator to create new tenants. This prevent users from creating new Azure AD or Azure AD B2C tenants and ensures that only authorized users are able to do so.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu.
2. Select `Azure Active Directory`.
3. Select `Users`.
4. Select `User settings`.
5. Set `Users can create Azure AD Tenants` to `No`.
