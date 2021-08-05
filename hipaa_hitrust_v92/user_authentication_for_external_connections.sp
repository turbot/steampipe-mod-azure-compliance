benchmark "hipaa_hitrust_v92_user_authentication_for_external_connections" {
  title         = "User Authentication for External Connections"
  children = [
    benchmark.hipaa_hitrust_v92_1119_01j2organizational_3_01_j,
    benchmark.hipaa_hitrust_v92_1175_01j1organizational_8_01_j,
    benchmark.hipaa_hitrust_v92_1179_01j3organizational_1_01_j
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1119_01j2organizational_3_01_j" {
  title         = "1119.01j2Organizational.3 - 01.j"
  description   = "Network equipment is checked for unanticipated dial-up capabilities"
  children = [
    control.compute_vm_jit_access_protected
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1175_01j1organizational_8_01_j" {
  title         = "0301.09o1Organizational.123 - 09.o"
  description   = "Remote access to business information across public networks only takes place after successful identification and authentication."
  children = [
    control.compute_vm_jit_access_protected
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1179_01j3organizational_1_01_j" {
  title         = "1179.01j3Organizational.1 - 01.j"
  description   = "The information system monitors and controls remote access methods."
  children = [
    control.compute_vm_jit_access_protected
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}