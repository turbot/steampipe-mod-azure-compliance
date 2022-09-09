## Description

Azure AD is extended to include Azure AD B2B collaboration, allowing you to invite people from outside your organization to be guest users in your cloud account and sign in with their own work, school, or social identities. Guest users allow you to share your company's applications and services with users from any other organization, while maintaining control over your own corporate data.

Guest users in the Azure AD are generally required for collaboration purposes in Office 365, and may also be required for Azure functions in enterprises with multiple Azure tenants. Guest users are typically added outside your employee on-boarding/offboarding process and could potentially be overlooked indefinitely, leading to a potential vulnerability. To prevent this, guest users should be reviewed on a regular basis. During this audit, guest users should also be determined to not have administrative privileges.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu
2. Select `Azure Active Directory`
3. Then `Users and group`
4. Select `All Users`
5. Click on `Add filters` button, select `User type`, click `Apply`, select `Guest`, click `Apply`
6. Delete all `Guest` users that are no longer required or are inactive.

### From Azure CLI

Before deleting the user, set it to inactive using the ID from the Audit Procedure to determine if there are any dependent systems.

```bash
az ad user update --id <exampleaccountid@domain.com> --account-enabled
{false}
```

After determining that there are no dependent systems delete the user.

```bash
Remove-AzureADUser -ObjectId <exampleaccountid@domain.com>
```

### From Azure Powershell

Before deleting the user, set it to inactive using the ID from the Audit Procedure todetermine if there are any dependent systems.

```bash
Set-AzureADUser -ObjectId "<exampleaccountid@domain.com>" -AccountEnabled
false
```

After determining that there are no dependent systems delete the user.

```bash
PS C:\>Remove-AzureADUser -ObjectId <exampleaccountid@domain.com>
false
```

### Default Value

By default no guest users are created.