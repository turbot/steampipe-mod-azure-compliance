benchmark "hipaa_hitrust_v92_user_authentication_for_external_connections" {
  title    = "User Authentication for External Connections"
  children = [
    benchmark.hipaa_hitrust_v92_1119_01j2organizational_3_01_j,
    benchmark.hipaa_hitrust_v92_1175_01j1organizational_8_01_j,
    benchmark.hipaa_hitrust_v92_1179_01j3organizational_1_01_j
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1119_01j2organizational_3_01_j" {
  title    = "Network equipment is checked for unanticipated dial-up capabilities"
  children = [
    control.compute_vm_jit_access_protected
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service       = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_1175_01j1organizational_8_01_j" {
  title    = "Remote access to business information across public networks only takes place after successful identification and authentication"
  children = [
    control.compute_vm_jit_access_protected
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service       = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_1179_01j3organizational_1_01_j" {
  title    = "The information system monitors and controls remote access methods"
  children = [
    control.compute_vm_jit_access_protected
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service       = "Azure/Compute"
  })
}