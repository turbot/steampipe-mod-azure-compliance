benchmark "hipaa_hitrust_v92_control_of_operational_software" {
  title    = "Control of Operational Software"
  children = [
    benchmark.hipaa_hitrust_v92_0605_10h1system_12_10_h,
    benchmark.hipaa_hitrust_v92_0607_10h2system_23_10_h
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0607_10h2system_23_10_h" {
  title   = "The organization uses its configuration control program to maintain control of all implemented software and its system documentation and archive prior versions of implemented software and associated system documentation."
  children = [
    control.compute_vm_adaptive_application_controls_enabled,
    control.compute_vm_scale_set_security_configuration_vulnerabilities_remediated
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service       = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_0605_10h1system_12_10_h" {
  title    = "Only authorized administrators are allowed to implement approved upgrades to software, applications, and program libraries, based on business requirements and the security implications of the release"
  children = [
    control.compute_vm_security_configuration_vulnerabilities_remediated
  ]

   tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service       = "Azure/Compute"
  })
}
