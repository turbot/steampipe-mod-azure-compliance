## Description

Diagnostic Logs capture activity to the data access plane while the Activity log is a subscription-level log for the control plane. Resource-level diagnostic logs provide insight into operations that were performed within that resource itself, for example, getting a secret from a Key Vault. Currently, 32 Azure resources support Diagnostic Logging (See the references section for a complete list), including Network Security Groups, Load Balancers, Key Vault, AD, Logic Apps and CosmosDB. The content of these logs varies by resource type. For example, Windows event system logs are a category of diagnostics logs for VMs, and blob, table, and queue logs are categories of diagnostics logs for storage accounts. A number of back-end services were not configured to log and store Diagnostic Logs for certain activities or for a sufficient length. It is crucial that logging systems are correctly configured to log all relevant activities and retain those logs for a sufficient length of time. By default, Diagnostic Logs are not enabled. Given that the mean time to detection in an enterprise is 240 days, a minimum retention period of two years is recommended. *Note*: The CIS Benchmark covers some specific Diagnostic Logs separately.

A lack of Diagnostic Logs reduces the visibility into the data plane and therefore an organization's ability to detect reconnaissance, authorization attempts or other malicious activity. Unlike Activity Logs, Diagnostic Logs are not enabled by default. Specifically, without Diagnostic Logs it would be impossible to tell which entities had accessed a data store that which was breached. In addition, alerts for failed attempts to access APIs for Web Services or Databases are only possible when Diagnostic Logging is enabled.

## Remediation

### From Console

The specific steps for configuring resources within the Azure console vary depending on resource, but typically the steps are:

1. Login to Azure conplse, go to the resource
2. Click on **Diagnostic settings**
3. In the blade that appears, click `Add diagnostic setting`
4. Configure the diagnostic settings
5. Click on **Save**

### From Command Line

Enable logging for all resources which support Diagnostic Logs to ensure interactions within the resource are logged and available. The skeleton command for creating logs and metrics with unlimited retention on a generic resource are shown below.

```bash
az monitor diagnostic-settings create --resource {ID} -n {name} \
--event-hub-rule {eventHubRuleID} --storageaccount {storageAccount} \
--logs '[
   {
      "category":"WorkflowRuntime",
      "enabled":true,
      "retentionPolicy":{
         "enabled":false,
         "days":0
      }
   }
]' \
--metrics '[
   {
      "category":"WorkflowRuntime",
      "enabled":true,
      "retentionPolicy":{
         "enabled":false,
         "days":0
      }
   }
]'
```
