locals {
  controls_by_service_springcloud_common_tags = merge(local.controls_by_service_common_tags, {
    service = "Azure/SpringCloud"
  })
}

benchmark "controls_by_service_springcloud" {
  title       = "Spring Cloud"
  description = "This section contains recommendations for configuring Spring Cloud resources."
  children = [
    control.spring_cloud_service_network_injection_enabled
  ]

  tags = merge(local.controls_by_service_springcloud_common_tags, {
    type = "Benchmark"
  })
}
