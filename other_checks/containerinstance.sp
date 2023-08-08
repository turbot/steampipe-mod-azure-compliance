locals {
  other_containerinstance_common_tags = merge(local.azure_compliance_common_tags, {
    service = "Azure/ContainerInstance"
  })
}

benchmark "other_containerinstance" {
  title = "ContainerInstance"
  children = [
    control.container_instance_container_group_in_virtual_network
  ]

  tags = merge(local.other_containerinstance_common_tags, {
    type = "Benchmark"
  })
}
