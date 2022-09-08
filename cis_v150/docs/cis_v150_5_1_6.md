## Description

Ensure that network flow logs are captured and fed into a central log analytics workspace.

Network Flow Logs provide valuable insight into the flow of traffic around your network and feed into both Azure Monitor and Azure Sentinel (if in use), permitting the generation of visual flow diagrams to aid with analyzing for lateral movement, etc.

## Remediation

### From Azure Portal

1. Navigate to the `Azure Monitor` Blade
2. Select `Networking`
3. Select the `Network Watcher` option
4. Then `NSG Flow Logs`
5. Select `+ Create`
6. Select the desired Subscription.
7. Select the `+ NSG` and the network service group for a network.
8. Select the Storage Account to log and the retention in days to retain the log.
9. In `Configurations` keep the default value of v2. If you desire even further analysis select `Enable Traffic Analytics`, then the processing interval, and the Log Analytics Workspace.
10. Tag as desired, then go to `Create`. Then create.

**Warning:** The remediation policy creates remediation deployment and names them by concatenating the subscription name and the resource group name. The MAXIMUM permitted length of a deployment name is 64 characters. Exceeding this will cause the remediation task to fail.

### Default Value

By default Network Security Group logs are not sent to Log Analytics.