locals {
  cis_v200_5_common_tags = merge(local.cis_v200_common_tags, {
    cis_section_id = "5"
  })
}

locals {
  cis_v200_5_1_common_tags = merge(local.cis_v200_5_common_tags, {
    cis_section_id = "5.1"
  })
  cis_v200_5_2_common_tags = merge(local.cis_v200_5_common_tags, {
    cis_section_id = "5.2"
  })
  cis_v200_5_3_common_tags = merge(local.cis_v200_5_common_tags, {
    cis_section_id = "5.3"
  })
}

benchmark "cis_v200_5" {
  title         = "5 Logging and Monitoring"
  documentation = file("./cis_v200/docs/cis_v200_5.md")
  children = [
    benchmark.cis_v200_5_1,
    benchmark.cis_v200_5_2,
    benchmark.cis_v200_5_3,
    control.cis_v200_5_4,
    control.cis_v200_5_5
  ]

  tags = merge(local.cis_v200_5_common_tags, {
    type = "Benchmark"
  })
}

benchmark "cis_v200_5_1" {
  title         = "5.1 Configuring Diagnostic Settings"
  documentation = file("./cis_v200/docs/cis_v200_5_1.md")
  children = [
    control.cis_v200_5_1_1,
    control.cis_v200_5_1_2,
    control.cis_v200_5_1_3,
    control.cis_v200_5_1_4,
    control.cis_v200_5_1_5,
    control.cis_v200_5_1_6,
    control.cis_v200_5_1_7
  ]

  tags = merge(local.cis_v200_5_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v200_5_1_1" {
  title         = "5.1.1 Ensure that a 'Diagnostic Setting' exists"
  description   = "Enable Diagnostic settings for exporting activity logs. Diagnostic settings are available for each individual resource within a subscription. Settings should be configured for all appropriate resources for your environment."
  query         = query.manual_control
  documentation = file("./cis_v200/docs/cis_v200_5_1_1.md")

  tags = merge(local.cis_v200_5_1_common_tags, {
    cis_item_id = "5.1.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/Monitor"
  })
}

control "cis_v200_5_1_2" {
  title         = "5.1.2 Ensure Diagnostic Setting captures appropriate categories"
  description   = "A Diagnostic Setting must exist. If a Diagnostic Setting does not exist, the navigation and options within this recommendation will not be available. Please review the recommendation at the beginning of this subsection titled: 'Ensure that a 'Diagnostic Setting' exists.' The diagnostic setting should be configured to log the appropriate activities from the control/management plane."
  query         = query.monitor_diagnostic_settings_captures_proper_categories
  documentation = file("./cis_v200/docs/cis_v200_5_1_2.md")

  tags = merge(local.cis_v200_5_1_common_tags, {
    cis_item_id = "5.1.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v200_5_1_3" {
  title         = "5.1.3 Ensure the Storage Container Storing the Activity Logs is not Publicly Accessible"
  description   = "The storage account container containing the activity log export should not be publicly accessible."
  query         = query.monitor_logs_storage_container_not_public_accessible
  documentation = file("./cis_v200/docs/cis_v200_5_1_3.md")

  tags = merge(local.cis_v200_5_1_common_tags, {
    cis_item_id = "5.1.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v200_5_1_4" {
  title         = "5.1.4 Ensure the storage account containing the container with activity logs is encrypted with Customer Managed Key"
  description   = "Storage accounts with the activity log exports can be configured to use Customer Managed Keys (CMK)."
  query         = query.monitor_logs_storage_container_encryptes_with_byok
  documentation = file("./cis_v200/docs/cis_v200_5_1_4.md")

  tags = merge(local.cis_v200_5_1_common_tags, {
    cis_item_id = "5.1.4"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v200_5_1_5" {
  title         = "5.1.5 Ensure that logging for Azure Key Vault is 'Enabled'"
  description   = "Enable AuditEvent logging for key vault instances to ensure interactions with key vaults are logged and available."
  query         = query.keyvault_logging_enabled
  documentation = file("./cis_v200/docs/cis_v200_5_1_5.md")

  tags = merge(local.cis_v200_5_1_common_tags, {
    cis_item_id = "5.1.5"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/KeyVault"
  })
}

control "cis_v200_5_1_6" {
  title         = "5.1.6 Ensure that Network Security Group Flow logs are captured and sent to Log Analytics"
  description   = "Ensure that network flow logs are captured and fed into a central log analytics workspace."
  query         = query.manual_control
  documentation = file("./cis_v200/docs/cis_v200_5_1_6.md")

  tags = merge(local.cis_v200_5_1_common_tags, {
    cis_item_id = "5.1.6"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/KeyVault"
  })
}

control "cis_v200_5_1_7" {
  title         = "5.1.7 Ensure that logging for Azure AppService 'HTTP logs' is enabled"
  description   = "Enable AppServiceHTTPLogs diagnostic log category for Azure App Service instances to ensure all http requests are captured and centrally logged."
  query         = query.manual_control
  documentation = file("./cis_v200/docs/cis_v200_5_1_7.md")

  tags = merge(local.cis_v200_5_1_common_tags, {
    cis_item_id = "5.1.7"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/KeyVault"
  })
}

benchmark "cis_v200_5_2" {
  title         = "5.2 Monitoring using Activity Log Alerts"
  documentation = file("./cis_v200/docs/cis_v200_5_2.md")
  children = [
    control.cis_v200_5_2_1,
    control.cis_v200_5_2_2,
    control.cis_v200_5_2_3,
    control.cis_v200_5_2_4,
    control.cis_v200_5_2_5,
    control.cis_v200_5_2_6,
    control.cis_v200_5_2_7,
    control.cis_v200_5_2_8,
    control.cis_v200_5_2_9,
    control.cis_v200_5_2_10
  ]

  tags = merge(local.cis_v200_5_common_tags, {
    type    = "Benchmark"
    service = "Azure/Monitor"
  })
}

control "cis_v200_5_2_1" {
  title         = "5.2.1 Ensure that Activity Log Alert exists for Create Policy Assignment"
  description   = "Create an activity log alert for the Create Policy Assignment event."
  query         = query.monitor_log_alert_create_policy_assignment
  documentation = file("./cis_v200/docs/cis_v200_5_2_1.md")

  tags = merge(local.cis_v200_5_2_common_tags, {
    cis_item_id = "5.2.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v200_5_2_2" {
  title         = "5.2.2 Ensure that Activity Log Alert exists for Delete Policy Assignment"
  description   = "Create an activity log alert for the Delete Policy Assignment event."
  query         = query.monitor_log_alert_delete_policy_assignment
  documentation = file("./cis_v200/docs/cis_v200_5_2_2.md")

  tags = merge(local.cis_v200_5_2_common_tags, {
    cis_item_id = "5.2.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v200_5_2_3" {
  title         = "5.2.3 Ensure that Activity Log Alert exists for Create or Update Network Security Group"
  description   = "Create an Activity Log Alert for the Create or Update Network Security Group event."
  query         = query.monitor_log_alert_create_update_nsg
  documentation = file("./cis_v200/docs/cis_v200_5_2_3.md")

  tags = merge(local.cis_v200_5_2_common_tags, {
    cis_item_id = "5.2.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v200_5_2_4" {
  title         = "5.2.4 Ensure that Activity Log Alert exists for Delete Network Security Group"
  description   = "Create an activity log alert for the Delete Network Security Group event."
  query         = query.monitor_log_alert_delete_nsg
  documentation = file("./cis_v200/docs/cis_v200_5_2_4.md")

  tags = merge(local.cis_v200_5_2_common_tags, {
    cis_item_id = "5.2.4"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v200_5_2_5" {
  title         = "5.2.5 Ensure that Activity Log Alert exists for Create or Update Security Solution"
  description   = "Create an activity log alert for the Create or Update Security Solution event."
  query         = query.monitor_log_alert_create_update_security_solution
  documentation = file("./cis_v200/docs/cis_v200_5_2_5.md")

  tags = merge(local.cis_v200_5_2_common_tags, {
    cis_item_id = "5.2.5"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v200_5_2_6" {
  title         = "5.2.6 Ensure that Activity Log Alert exists for Delete Security Solution"
  description   = "Create an activity log alert for the Delete Security Solution event."
  query         = query.monitor_log_alert_delete_security_solution
  documentation = file("./cis_v200/docs/cis_v200_5_2_6.md")

  tags = merge(local.cis_v200_5_2_common_tags, {
    cis_item_id = "5.2.6"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v200_5_2_7" {
  title         = "5.2.7 Ensure that Activity Log Alert exists for Create or Update SQL Server Firewall Rule"
  description   = "Create an activity log alert for the Create or Update SQL Server Firewall Rule event."
  query         = query.monitor_log_alert_create_update_sql_servers_firewall_rule
  documentation = file("./cis_v200/docs/cis_v200_5_2_7.md")

  tags = merge(local.cis_v200_5_2_common_tags, {
    cis_item_id = "5.2.7"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v200_5_2_8" {
  title         = "5.2.8 Ensure that Activity Log Alert exists for Delete SQL Server Firewall Rule"
  description   = "Create an activity log alert for the 'Delete SQL Server Firewall Rule.'"
  query         = query.monitor_log_alert_delete_sql_servers_firewall_rule
  documentation = file("./cis_v200/docs/cis_v200_5_2_8.md")

  tags = merge(local.cis_v200_5_2_common_tags, {
    cis_item_id = "5.2.8"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v200_5_2_9" {
  title         = "5.2.9 Ensure that Activity Log Alert exists for Create or Update Public IP Address rule"
  description   = "Create an activity log alert for the Create or Update Public IP Addresses rule."
  query         = query.monitor_log_alert_create_update_public_ip_address
  documentation = file("./cis_v200/docs/cis_v200_5_2_9.md")

  tags = merge(local.cis_v200_5_2_common_tags, {
    cis_item_id = "5.2.9"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v200_5_2_10" {
  title         = "5.2.10 Ensure that Activity Log Alert exists for Delete Public IP Address rule"
  description   = "Create an activity log alert for the Delete Public IP Address rule."
  query         = query.monitor_log_alert_delete_public_ip_address
  documentation = file("./cis_v200/docs/cis_v200_5_2_10.md")

  tags = merge(local.cis_v200_5_common_tags, {
    cis_item_id = "5.2.10"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

benchmark "cis_v200_5_3" {
  title         = "5.3 Configuring Application Insights"
  documentation = file("./cis_v200/docs/cis_v200_5_3.md")
  children = [
    control.cis_v200_5_3_1
  ]

  tags = merge(local.cis_v200_5_common_tags, {
    type    = "Benchmark"
    service = "Azure/Monitor"
  })
}

control "cis_v200_5_3_1" {
  title         = "5.3.1 Ensure Application Insights are Configured"
  description   = "Application Insights within Azure act as an Application Performance Monitoring solution providing valuable data into how well an application performs and additional information when performing incident response. The types of log data collected include application metrics, telemetry data, and application trace logging data providing organizations with detailed information about application activity and application transactions. Both data sets help organizations adopt a proactive and retroactive means to handle security and performance related metrics within their modern applications."
  # query         = query.manual_control
  documentation = file("./cis_v200/docs/cis_v200_5_3_1.md")

  tags = merge(local.cis_v140_5_common_tags, {
    cis_item_id = "5.3.1"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v200_5_4" {
  title         = "5.4 Ensure that Azure Monitor Resource Logging is Enabled for All Services that Support it"
  description   = "Resource Logs capture activity to the data access plane while the Activity log is a subscription-level log for the control plane. Resource-level diagnostic logs provide insight into operations that were performed within that resource itself; for example, reading or updating a secret from a Key Vault. Currently, 95 Azure resources support Azure Monitoring (See the more information section for a complete list), including Network Security Groups, Load Balancers, Key Vault, AD, Logic Apps, and CosmosDB. The content of these logs varies by resource type. A number of back-end services were not configured to log and store Resource Logs for certain activities or for a sufficient length. It is crucial that monitoring is correctly configured to log all relevant activities and retain those logs for a sufficient length of time. Given that the mean time to detection in an enterprise is 240 days, a minimum retention period of two years is recommended."
  query         = query.manual_control
  documentation = file("./cis_v200/docs/cis_v200_5_4.md")

  tags = merge(local.cis_v200_5_common_tags, {
    cis_item_id = "5.4"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/Monitor"
  })
}

control "cis_v200_5_5" {
  title         = "5.5 Ensure that SKU Basic/Consumption is not used on artifacts that need to be monitored (Particularly for Production Workloads)"
  description   = "The use of Basic or Free SKUs in Azure whilst cost effective have significant limitations in terms of what can be monitored and what support can be realized from Microsoft. Typically, these SKU's do not have a service SLA and Microsoft will usually refuse to provide support for them. Consequently Basic/Free SKUs should never be used for production workloads."
  # query         = query.manual_control
  documentation = file("./cis_v200/docs/cis_v200_5_5.md")

  tags = merge(local.cis_v200_5_common_tags, {
    cis_item_id = "5.5"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}
