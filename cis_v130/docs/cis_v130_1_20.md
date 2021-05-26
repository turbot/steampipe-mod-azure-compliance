## Description

Joining devices to the active directory should require Multi-factor authentication.

Multi-factor authentication is recommended when adding devices to Azure AD. When set to `Yes`, users who are adding devices from the internet must first use the second method of authentication before their device is successfully added to the directory. This ensures that rogue devices are not added to the directory for a compromised user account

## Remediation

### From Console

1. Log in to [Azure Active Directory](https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview)
2. Go to `Devices` in left bar
3. Go to `Device settings` in left bar
4. Set `Devices to be Azure AD joined or Azure AD registered require Multi-Factor Authentication` to **Yes**

**Note:** By default, `Devices to be Azure AD joined or Azure AD registered require Multi-Factor Authentication` is set to `No`.
