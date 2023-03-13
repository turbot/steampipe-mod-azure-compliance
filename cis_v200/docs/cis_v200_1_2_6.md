## Description

For designated users, they will be prompted to use their multi-factor authentication (MFA) process on logins.

Enabling multi-factor authentication is a recommended setting to limit the use of Administrative actions and to prevent intruders from changing settings.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu and select `Azure Active Directory`.
2. Select `Security`.
3. Select `Conditional Access`.
4. Click `+ New policy`.
5. Enter a name for the policy.
6. Select `Users or workload identities`.
7. Under `Include`, select `All users`.
8. Under `Exclude`, check `Users and groups`.
9. Select users this policy should not apply to and click `Select`.
10. Select `Cloud apps or actions`.
11. Select `Select apps`.
12. Check the box next to `Microsoft Azure Management` and click `Select`.
13. Select `Grant`.
14. Under `Grant access`, check `Require multifactor authentication` and click `Select`.
15. Set `Enable policy` to `Report-only`.
16. Click `Create`.

After testing the policy in report-only mode, update the `Enable policy` setting from `Report-onl`y to `On`.

### Default Value

MFA is not enabled by default for administrative actions.

