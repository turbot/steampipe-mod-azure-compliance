## Description

Enables emailing security alerts to the subscription owner or other designated security contact. Enabling security alert emails ensures that security alert emails are received from Microsoft. This ensures that the right people are aware of any potential security issues and are able to mitigate the risk.

## Remediation

### From Console

1. Login to Azure console and navigate to [Security Center](https://portal.azure.com/#blade/Microsoft_Azure_Security/SecurityMenuBlade/0).
2. Select `Pricing & settings` blade under Management.
3. Click on the appropriate Management Group, Subscription, or Tenant.
4. Click on `Email notifications`.
5. Enter a valid security contact email address in the `Additional email addresses` field.
6. Under `Notification types`, check the check box next to `Notify about alerts with the following severity (or higher)`, and select `High` from the drop down menu.
7. Click **Save**.

