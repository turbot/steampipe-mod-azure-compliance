## Description

The principle of least privilege should be followed and only necessary privileges should be assigned instead of allowing full administrative access.

Classic subscription admin roles offer basic access management and include Account Administrator, Service Administrator, and Co-Administrators. It is recommended the least necessary permissions be given initially. Permissions can be added as needed by the account holder. This ensures the account holder cannot perform actions which were not intended.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu.
2. Select `Subscriptions`.
3. Select `Access control (IAM)`.
4. Select `Roles`.
5. Click `Type` and select `CustomRole` from the drop down menu.
6. Check the box next to each role which grants subscription administrator privileges.
7. Select `Remove`.
8. Select `Yes`.

### From Azure CLI

List custom roles:

```bash
az role definition list --custom-role-only True
```
Check for entries with `assignableScope` of / or the `subscription`, and an action of `*`. To remove a violating role:

```bash
az role definition delete --name <role name>
```

**Note** that any role assignments must be removed before a custom role can be deleted. Ensure impact is assessed before deleting a custom role granting subscription administrator privileges.

### Default Value

By default, no custom owner roles are created.
