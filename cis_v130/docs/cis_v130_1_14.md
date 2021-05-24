## Description

Restrict guest being able to invite other guests to collaborate with your organization.

Restricting invitations to administrators ensures that only authorized accounts have access to cloud resources. This helps to maintain "Need to Know" permissions and prevents inadvertent access to data.

## Remediation

### From Console

1. Log in to [Azure Active Directory](https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview)
2. Go to `External Identities`
3. Go to `External collaboration settings`
4. Ensure that Guests can invite is set to **No**

**Note:** By default, Guests can invite is set to `Yes`.
