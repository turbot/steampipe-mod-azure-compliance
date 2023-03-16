## Description

Ensure that all Global Administrators are notified if any other administrator resets their password.

Global Administrator accounts are sensitive. Any password reset activity notification, when sent to all Global Administrators, ensures that all Global administrators can passively confirm if such a reset is a common pattern within their group. For example, if all Global Administrators change their password every 30 days, any password reset activity before that may require administrator(s) to evaluate any unusual activity and confirm its origin.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu.
2. Select `Azure Active Directory`.
3. Select `Users`.
4. Select `Password reset`.
5. Under Manage, select `Notifications`.
6. Set `Notify all admins when other admins reset their password?` to `Yes`.

### Default Value

By default, `Notify all admins when other admins reset their password?` is set to "No".