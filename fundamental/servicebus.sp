locals {
  fundamental_security_servicebus_common_tags = {
    service = "Azure/ServiceBus"
  }
}

benchmark "fundamental_security_servicebus" {
  title       = "Service Bus"
  description = "This section contains recommendations for configuring ServiceBus resources."
  children = [
    control.servicebus_name_space_private_link_used,
    control.servicebus_namespace_logging_enabled,
    control.servicebus_premium_namespace_cmk_encrypted
  ]
}
