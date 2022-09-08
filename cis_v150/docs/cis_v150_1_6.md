## Description

Ensures that two alternate forms of identification are provided before allowing a password reset.

A Self-service Password Reset (SSPR) through Azure Multi-factor Authentication (MFA) ensures the user's identity is confirmed using two separate methods of identification. With multiple methods set, an attacker would have to compromise both methods before they could maliciously reset a user's password.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu
2. Select `Azure Active Directory`
3. Then `Users`
4. Select `Password reset`
5. Then `Authentication methods`
6. Set the `Number of methods required to reset` to `2`

Please **note** that at this point of time, there is no Azure CLI or other API commands available to programmatically conduct security configuration for this recommendation.

### Default Value

By default, the `Number of methods required to reset` is set to "2".