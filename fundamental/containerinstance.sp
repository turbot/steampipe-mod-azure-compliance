locals {
  fundamental_security_containerinstance_common_tags = merge(local.fundamental_security_common_tags, {
    service = "Azure/ContainerInstance"
  })
}

benchmark "fundamental_security_containerinstance" {
  title       = "Container Instance"
  description = "This section contains recommendations for configuring ContainerInstance resources."
  children = [
    control.container_instance_container_group_encrypted_using_cmk,
    control.container_instance_container_group_in_virtual_network
  ]

  tags = merge(local.fundamental_security_containerinstance_common_tags, {
    type = "Benchmark"
  })
}
