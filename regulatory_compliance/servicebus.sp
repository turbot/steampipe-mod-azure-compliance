locals {
  regulatory_compliance_servicebus_common_tags = {
    service = "Azure/ServiceBus"
  }
}

control "servicebus_namespace_logging_enabled" {
  title       = "Resource logs in Service Bus should be enabled"
  description = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes; when a security incident occurs or when your network is compromised."
  sql         = query.servicebus_namespace_logging_enabled.sql

  tags = merge(local.regulatory_compliance_servicebus_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "servicebus_name_space_private_link_used" {
  title       = "Azure Service Bus namespaces should use private link"
  description = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to Service Bus namespaces, data leakage risks are reduced."
  sql         = query.servicebus_name_space_private_link_used.sql

  tags = merge(local.regulatory_compliance_servicebus_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "servicebus_premium_namespace_cmk_encrypted" {
  title       = "Service Bus Premium namespaces should use a customer-managed key for encryption"
  description = "Azure Service Bus supports the option of encrypting data at rest with either Microsoft-managed keys (default) or customer-managed keys. Choosing to encrypt data using customer-managed keys enables you to assign, rotate, disable, and revoke access to the keys that Service Bus will use to encrypt data in your namespace. Note that Service Bus only supports encryption with customer-managed keys for premium namespaces."
  sql         = query.servicebus_premium_namespace_cmk_encrypted.sql

  tags = merge(local.regulatory_compliance_servicebus_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

