## Description

Microsoft Azure creates a default bad password policy that is already applied to Azure administrative and normal user accounts. This is not applied to user accounts that are synced from an on-premise Active Directory unless Azure AD Connect is used and you enable EnforceCloudPasswordPolicyForPasswordSyncedUsers. Please see the list in default values on the specifics of this policy.

Enabling this gives your organization further customization on what secure passwords are allowed. Setting a bad password list enables your organization to fine-tune its password policy further, depending on your needs. Removing easy-to-guess passwords increases the security of access to your Azure resources.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu
2. Select `Azure Active Directory` in the menu that opens, and then `Security`.
3. Under `Management` select `Authentication`, then `Password Protection`.
4. Set the `Enforce custom list` to `Yes`.
5. Double click the custom password list to add a string.

Please **note** that at this point of time, there is no Azure CLI or other API commands available to programmatically conduct security configuration for this recommendation.

### Default Value

By default the custom bad password list is not 'Enabled'. Organizational-specific terms can be added to the custom banned password list, such as the following examples:
- Brand names
- Product names
- Locations, such as company headquarters
- Company-specific internal terms
- Abbreviations that have specific company meaning
- Months and weekdays with your company's local languages