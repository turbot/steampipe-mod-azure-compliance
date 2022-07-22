## Description

None of the settings offered by ASC Default policy should be set to effect *Disabled*. A security policy defines the desired configuration of your workloads and helps ensure compliance with company or regulatory security requirements. ASC Default policy is associated with every subscription by default. ASC default policy assignment is set of security recommendations based on best practices.

Enabling recommendations in ASC default policy ensures that Azure security center provides ability to monitor all of the supported recommendations and allow automated action optionally for few of the supported recommendations.

## Remediation

### From Console

Perform the following action to check ASC Default policy is set to enabled:

1. Navigate to `Azure Policy`
2. On Policy "Overview" blade, Click on Policy `ASC Default(<Subscription:Subscription_ID>)`
3. On "ASC Default" blade, Click on `Edit Assignments`
4. In section `PARAMETERS`, configure the impacted setting to any other available value than `Disabled` or empty
5. Click `Save`
