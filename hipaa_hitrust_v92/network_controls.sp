benchmark "hipaa_hitrust_v92_network_controls" {
  title       = "Network Controls"
  description = "The organization monitors for all authorized and unauthorized wireless access to the information system and prohibits installation of wireless access points (WAPs) unless explicitly authorized in writing by the CIO or his/her designated representative."
  children = [
    benchmark.hipaa_hitrust_v92_0867_09m3organizational_17_09_m
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0867_09m3organizational_17_09_m" {
  title       = "Wireless access points are placed in secure areas and shut down when not in use (e.g. nights, weekends)"
  description = "Ensure the protection of information in networks and protection of the supporting network infrastructure."
  children = [
    control.storage_account_use_virtual_service_endpoint
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Storage"
  })
}