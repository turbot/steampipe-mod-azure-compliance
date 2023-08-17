locals {
  fundamental_security_springcloud_common_tags = merge(local.fundamental_security_common_tags, {
    service = "Azure/SpringCloud"
  })
}

benchmark "fundamental_security_springcloud" {
  title       = "Spring Cloud"
  description = "This section contains recommendations for configuring Spring Cloud resources."
  children = [
    control.spring_cloud_service_network_injection_enabled
  ]

  tags = merge(local.fundamental_security_springcloud_common_tags, {
    type = "Benchmark"
  })
}
