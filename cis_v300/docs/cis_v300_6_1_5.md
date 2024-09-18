## Description

Ensure that network flow logs are captured and fed into a central log analytics workspace.

Network Flow Logs provide valuable insight into the flow of traffic around your network and feed into both Azure Monitor and Azure Sentinel (if in use), permitting the generation of visual flow diagrams to aid with analyzing for lateral movement, etc.

## Remediation

### From Azure Portal

1. Navigate to `Network Watcher`.
2. Select `NSG flow logs`.
3. Select `+ Create`.
4. Select the desired Subscription.
5. Select `+ Select NSG`.
6. Select a network security group.
7. Click `Confirm selection`.
8. Select or create a new Storage Account.
9. Input the retention in days to retain the log.
10. Click `Next`.
11. Under `Configuration`, select `Version 2`.
12. If rich analytics are required, select `Enable Traffic Analytics`, a processing interval, and a `Log Analytics Workspace`.
13. Select `Next`.
14. Optionally add Tags.
15. Select `Review + create`.
16. Select `Create`.

**Warning**
The remediation policy creates remediation deployment and names them by concatenating the subscription name and the resource group name. The MAXIMUM permitted length of a deployment name is 64 characters. Exceeding this will cause the remediation task to fail.

### Default Value

By default Network Security Group logs are not sent to Log Analytics.
