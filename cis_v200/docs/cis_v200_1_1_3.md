## Description

Enable multi-factor authentication for all non-privileged users.

Multi-factor authentication requires an individual to present a minimum of two separate forms of authentication before access is granted. Multi-factor authentication provides additional assurance that the individual attempting to gain access is who they claim to be. With multi-factor authentication, an attacker would need to compromise at least two different authentication mechanisms, increasing the difficulty of compromise and thus reducing the risk.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu.
2. Select the `Azure Active Directory` blade.
3. Then `Users`.
4. Select `All Users`.
5. Click on `Per-User MFA` button on the top bar.
6. Ensure that for all users `MULTI-FACTOR AUTH STATUS` is `Enabled`.

Follow Microsoft Azure documentation and enable multi-factor authentication in your environment.

[https://docs.microsoft.com/en-us/azure/active-directory/authentication/tutorial-enable-azure-mfa](https://docs.microsoft.com/en-us/azure/active-directory/authentication/tutorial-enable-azure-mfa)

Enabling and configuring MFA is a multi-step process. Here are some additional resources on the process within Azure AD:
- [https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/howto-conditional-access-policy-admin-mfa](https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/howto-conditional-access-policy-admin-mfa)
- [https://docs.microsoft.com/en-us/azure/active-directory/authentication/howto-mfa-getstarted#enable-multi-factor-authentication-with-conditional-access](https://docs.microsoft.com/en-us/azure/active-directory/authentication/howto-mfa-getstarted#enable-multi-factor-authentication-with-conditional-access)
- [https://docs.microsoft.com/en-us/azure/active-directory/authentication/howto-mfa-mfasettings](https://docs.microsoft.com/en-us/azure/active-directory/authentication/howto-mfa-mfasettings)

### Default Value

By default, multi-factor authentication is disabled for all users.
