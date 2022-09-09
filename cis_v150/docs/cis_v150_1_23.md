## Description

Subscription ownership should not include permission to create custom owner roles. The principle of least privilege should be followed and only necessary privileges should be assigned instead of allowing full administrative access.

Classic subscription admin roles offer basic access management and include Account Administrator, Service Administrator, and Co-Administrators. It is recommended the least necessary permissions be given initially. Permissions can be added as needed by the account holder. This ensures the account holder cannot perform actions which were not intended.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu
2. Select `Subscriptions` under `Navigate`
3. Select in the left column `Access control (IAM)`
4. In the row select of filters `Role:,` then the `# Displayed`
5. In the list of checkmarks deselect 'Show all' to display no roles.
6. Search for `Owner` or select it if it already displayed to show only users with the Owner role
7. To remove this permission from a user, select the checkbox under the Owner
8. In the top row, select `Remove X`
9. Select Yes

### From Azure CLI

```bash
az role definition list
```
Check for entries with assignableScope of / or a subscription, and an action of * Verify the usage and impact of removing the role identified

```bash
az role definition delete --name "rolename"
```

### Default Value

By default, no custom owner roles are created.