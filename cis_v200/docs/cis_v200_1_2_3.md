## Description

For designated users, they will be prompted to use their multi-factor authentication (MFA) process on login.

Enabling multi-factor authentication is a recommended setting to limit the use of Administrative accounts to authenticated personnel.

## Remediation

### From Azure Portal

1. From Azure Home open the Portal Menu in top left, and select Azure Active Directory.
2. Select `Security`.
3. Select `Conditional Access`.
4. Click `+ New policy`.
5. Enter a name for the policy.
6. Select `Users or workload identities`.
7. Check `Users and groups`.
8. Select administrative groups this policy should apply to and click `Select`.
9. Under `Exclude`, check `Users and groups`.
10. Select users this policy not should apply to and click `Select`.
11. Select `Cloud apps or actions`.
12. Select `All cloud apps`.
13. Select `Grant`.
14. Under Grant access, check `Require multifactor authentication` and click `Select`.
15. Set `Enable policy` to `Report-only`.
16. Click `Create`.

After testing the policy in report-only mode, update the `Enable policy` setting from `Report-only` to `On`.

### Default Value

By default, MFA is not enabled for any administrative accounts.
