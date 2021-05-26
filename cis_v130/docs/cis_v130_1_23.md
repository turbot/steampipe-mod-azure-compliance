## Description

Resource locking is a powerful protection mechanism that can prevent inadvertent modification/deletion of resources within Azure subscriptions/Resource Groups and is a recommended NIST configuration.

Given the resource lock functionality is outside of standard Role Based Access Control(RBAC), it would be prudent to create a resource lock administrator role to prevent inadvertent unlocking of resources.

## Remediation

### From Console

1. In the Azure portal, open a subscription or resource group where you want the custom role to be assignable.
2. Select `Access control (IAM)` from side bar
3. Click `Add` from top bar
4. Select **Add custom role**
5. In the Custom Role Name field enter `Resource Lock Administrator`
6. In the Description field enter Can `Administer Resource Lock`s
7. For Baseline permissions select **Start from scratch**
8. Click `next`
9. In the **Permissions** tab select **Add permissions**
10. in the Search for a permission box, type in `Microsoft.Authorization/locks` to search for permissions.
11. Select the check box next to the permission called `Microsoft.Authorization/locks`
12. click **add**
13. Click **Review+create**
14. Click **Create**
15. Assign the newly created role to the appropriate user.
