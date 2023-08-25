locals {
  controls_by_service_containerinstance_common_tags = merge(local.controls_by_service_common_tags, {
    service = "Azure/ContainerInstance"
  })
}

benchmark "controls_by_service_containerinstance" {
  title       = "Container Instance"
  description = "This section contains recommendations for configuring Container Instance resources."
  children = [
    control.container_instance_container_group_encrypted_using_cmk,
    control.container_instance_container_group_in_virtual_network
  ]

  tags = merge(local.controls_by_service_containerinstance_common_tags, {
    type = "Benchmark"
  })
}
