## Description

Require administrators to register third-party applications.

It is recommended to let administrator register custom-developed applications. This ensures that the application undergoes a security review before exposing active directory data to it.

## Remediation

### From Console

1. Log in to [Azure Active Directory](https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview)
2. Go to `Users`
3. Go to `User settings` in side bar
4. Set `Users can register applications` to **No**

**Note:** By default, `Users can add gallery apps to their Access Panel` is set to 'No'.
