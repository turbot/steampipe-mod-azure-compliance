locals {
  other_apimanagement_common_tags = merge(local.azure_compliance_common_tags, {
    service = "Azure/APIManagement"
  })
}

benchmark "other_apimanagement" {
  title         = "APIManagement"
  children = [
    control.apimanagement_service_client_certificate_enabled
  ]

  tags = merge(local.other_apimanagement_common_tags, {
    type = "Benchmark"
  })
}
