benchmark "hipaa_hitrust_v92_remote_diagnostic_and_configuration_port_protection" {
  title         = "Remote Diagnostic and Configuration Port Protection"
  children = [
    benchmark.hipaa_hitrust_v92_1193_01l2organizational_13_01_l,
    benchmark.hipaa_hitrust_v92_1194_01l2organizational_2_01_l,
    benchmark.hipaa_hitrust_v92_1195_01l3organizational_1_01_l
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1193_01l2organizational_13_01_l" {
  title         = "1193.01l2Organizational.13 - 01.l"
  description   = "Controls for the access to diagnostic and configuration ports include the use of a key lock and the implementation of supporting procedures to control physical access to the port."
  children = [
    control.hipaa_hitrust_v92_1193_01l2organizational_13_01_l_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_1193_01l2organizational_13_01_l_1" {
  title         = "Management ports should be closed on your virtual machines"
  description   = "Open remote management ports are exposing your VM to a high level of risk from Internet-based attacks. These attacks attempt to brute force credentials to gain admin access to the machine."
  sql           = query.network_security_group_remote_access_restricted.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1194_01l2organizational_2_01_l" {
  title         = "1194.01l2Organizational.2 - 01.l"
  description   = "Ports, services, and similar applications installed on a computer or network systems, which are not specifically required for business functionality, are disabled or removed."
  children = [
    control.hipaa_hitrust_v92_1194_01l2organizational_2_01_l_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_1194_01l2organizational_2_01_l_1" {
  title         = "Remote debugging should be turned off for Web Applications"
  description   = "Remote debugging requires inbound ports to be opened on a web application. Remote debugging should be turned off."
  sql           = query.appservice_web_app_remote_debugging_disabled.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1195_01l3organizational_1_01_l" {
  title         = "1195.01l3Organizational.1 - 01.l"
  description   = "The organization reviews the information system within every three hundred and sixty- five (365) days to identify and disables unnecessary and non-secure functions, ports, protocols, and/or services."
  children = [
    control.hipaa_hitrust_v92_1195_01l3organizational_1_01_l_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_1195_01l3organizational_1_01_l_1" {
  title         = "Remote debugging should be turned off for Function Apps"
  description   = "Remote debugging requires inbound ports to be opened on function apps. Remote debugging should be turned off."
  sql           = query.appservice_function_app_remote_debugging_disabled.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}