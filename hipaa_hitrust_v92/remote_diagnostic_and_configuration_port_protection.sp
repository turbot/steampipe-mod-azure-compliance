benchmark "hipaa_hitrust_v92_remote_diagnostic_and_configuration_port_protection" {
  title    = "Remote Diagnostic and Configuration Port Protection"
  children = [
    benchmark.hipaa_hitrust_v92_1192_01l1organizational_1_01_l,
    benchmark.hipaa_hitrust_v92_1193_01l2organizational_13_01_l,
    benchmark.hipaa_hitrust_v92_1194_01l2organizational_2_01_l,
    benchmark.hipaa_hitrust_v92_1195_01l3organizational_1_01_l,
    benchmark.hipaa_hitrust_v92_1196_01l3organizational_24_01_l,
    benchmark.hipaa_hitrust_v92_1197_01l3organizational_3_01_l
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1192_01l1organizational_1_01_l" {
  title    = "Access to network equipment is physically protected"
  children = [
    control.compute_vm_jit_access_protected
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service       = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_1193_01l2organizational_13_01_l" {
  title    = "Controls for the access to diagnostic and configuration ports include the use of a key lock and the implementation of supporting procedures to control physical access to the port"
  children = [
    control.network_security_group_remote_access_restricted
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service       = "Azure/Network"
  })
}

benchmark "hipaa_hitrust_v92_1194_01l2organizational_2_01_l" {
  title    = "Ports, services, and similar applications installed on a computer or network systems, which are not specifically required for business functionality, are disabled or removed"
  children = [
    control.appservice_web_app_remote_debugging_disabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service       = "Azure/AppService"
  })
}

benchmark "hipaa_hitrust_v92_1195_01l3organizational_1_01_l" {
  title    = "The organization reviews the information system within every three hundred and sixty- five (365) days to identify and disables unnecessary and non-secure functions, ports, protocols, and/or services"
  children = [
    control.appservice_function_app_remote_debugging_disabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service       = "Azure/AppService"
  })
}

benchmark "hipaa_hitrust_v92_1196_01l3organizational_24_01_l" {
  title       = "Identify unauthorized (blacklisted) software on the information system"
  description = "The organization identifies unauthorized (blacklisted) software on the information system, prevents program execution in accordance with a list of unauthorized (blacklisted) software programs, employs an allow-all, deny-by exception policy to prohibit execution of known unauthorized (blacklisted) software, and reviews and updates the list of unauthorized (blacklisted) software programs annually."
  children = [
    control.appservice_api_app_remote_debugging_disabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service       = "Azure/AppService"
  })
}

benchmark "hipaa_hitrust_v92_1197_01l3organizational_3_01_l" {
  title    = "The organization disables Bluetooth and peer-to-peer networking protocols within the information system determined to be unnecessary or non-secure"
  children = [
    control.compute_vm_adaptive_application_controls_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service       = "Azure/Compute"
  })
}