locals {
  all_controls_containerinstance_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/ContainerInstance"
  })
}

benchmark "all_controls_containerinstance" {
  title       = "Container Instance"
  description = "This section contains recommendations for configuring Container Instance resources."
  children = [
    control.container_instance_container_group_encrypted_using_cmk,
    control.container_instance_container_group_identity_provider_enabled,
    control.container_instance_container_group_in_virtual_network,
    control.container_instance_container_group_secured_environment_variable
  ]

  tags = merge(local.all_controls_containerinstance_common_tags, {
    type = "Benchmark"
  })
}
