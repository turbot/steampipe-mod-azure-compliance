locals {
  all_controls_springcloud_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/SpringCloud"
  })
}

benchmark "all_controls_springcloud" {
  title       = "Spring Cloud"
  description = "This section contains recommendations for configuring Spring Cloud resources."
  children = [
    control.spring_cloud_service_network_injection_enabled
  ]

  tags = merge(local.all_controls_springcloud_common_tags, {
    type = "Benchmark"
  })
}
