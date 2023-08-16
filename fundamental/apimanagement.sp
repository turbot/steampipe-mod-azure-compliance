locals {
  fundamental_security_apimanagement_common_tags = {
    service = "Azure/APIManagement"
  }
}

benchmark "fundamental_security_apimanagement" {
  title       = "API Management"
  description = "This section contains recommendations for configuring APIManagement resources."
  children = [
    control.apimanagement_service_client_certificate_enabled,
    control.apimanagement_service_with_virtual_network
  ]
}
