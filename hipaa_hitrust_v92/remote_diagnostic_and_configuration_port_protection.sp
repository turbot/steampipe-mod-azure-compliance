benchmark "hipaa_hitrust_v92_remote_diagnostic_and_configuration_port_protection" {
  title         = "Remote Diagnostic and Configuration Port Protection"
  children = [
    benchmark.hipaa_hitrust_v92_1192_01l1organizational_1_01_l,
    benchmark.hipaa_hitrust_v92_1193_01l2organizational_13_01_l,
    benchmark.hipaa_hitrust_v92_1194_01l2organizational_2_01_l,
    benchmark.hipaa_hitrust_v92_1195_01l3organizational_1_01_l,
    benchmark.hipaa_hitrust_v92_1196_01l3organizational_24_01_l
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1192_01l1organizational_1_01_l" {
  title         = "1192.01l1Organizational.1 - 01.l"
  description   = "Access to network equipment is physically protected."
  children = [
    control.compute_vm_jit_access_protected
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1193_01l2organizational_13_01_l" {
  title         = "1193.01l2Organizational.13 - 01.l"
  description   = "Controls for the access to diagnostic and configuration ports include the use of a key lock and the implementation of supporting procedures to control physical access to the port."
  children = [
    control.network_security_group_remote_access_restricted
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1194_01l2organizational_2_01_l" {
  title         = "1194.01l2Organizational.2 - 01.l"
  description   = "Ports, services, and similar applications installed on a computer or network systems, which are not specifically required for business functionality, are disabled or removed."
  children = [
    control.appservice_web_app_remote_debugging_disabled
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1195_01l3organizational_1_01_l" {
  title         = "1195.01l3Organizational.1 - 01.l"
  description   = "The organization reviews the information system within every three hundred and sixty- five (365) days to identify and disables unnecessary and non-secure functions, ports, protocols, and/or services."
  children = [
    control.appservice_function_app_remote_debugging_disabled
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1196_01l3organizational_24_01_l" {
  title         = "1196.01l3Organizational.24 - 01.l"
  description   = "The organization identifies unauthorized (blacklisted) software on the information system, prevents program execution in accordance with a list of unauthorized (blacklisted) software programs, employs an allow-all, deny-by exception policy to prohibit execution of known unauthorized (blacklisted) software, and reviews and updates the list of unauthorized (blacklisted) software programs annually."
  children = [
    control.appservice_api_app_remote_debugging_disabled
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}
