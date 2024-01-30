locals {
  all_controls_servicebus_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/ServiceBus"
  })
}

benchmark "all_controls_servicebus" {
  title       = "Service Bus"
  description = "This section contains recommendations for configuring Service Bus resources."
  children = [
    control.servicebus_name_space_private_link_used,
    control.servicebus_namespace_logging_enabled,
    control.servicebus_namespace_azure_ad_authentication_enabled,
    control.servicebus_namespace_no_overly_permissive_network_access,
    control.servicebus_premium_namespace_cmk_encrypted,
    control.servicebus_use_virtual_service_endpoint
  ]

  tags = merge(local.all_controls_servicebus_common_tags, {
    type = "Benchmark"
  })
}
