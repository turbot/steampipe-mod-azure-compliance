locals {
  controls_by_service_apimanagement_common_tags = merge(local.controls_by_service_common_tags, {
    service = "Azure/APIManagement"
  })
}

benchmark "controls_by_service_apimanagement" {
  title       = "API Management"
  description = "This section contains recommendations for configuring API Management resources."
  children = [
    control.apimanagement_service_client_certificate_enabled,
    control.apimanagement_service_with_virtual_network
  ]

  tags = merge(local.controls_by_service_apimanagement_common_tags, {
    type = "Benchmark"
  })
}
