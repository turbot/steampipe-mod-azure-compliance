locals {
  fundamental_security_springcloud_common_tags = {
    service = "Azure/SpringCloud"
  }
}

benchmark "fundamental_security_springcloud" {
  title       = "Spring Cloud"
  description = "This section contains recommendations for configuring SpringCloud resources."
  children = [
    control.spring_cloud_service_network_injection_enabled
  ]
}
