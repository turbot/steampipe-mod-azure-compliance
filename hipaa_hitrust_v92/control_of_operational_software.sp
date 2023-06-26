benchmark "hipaa_hitrust_v92_control_of_operational_software" {
  title       = "Control of Operational Software"
  description = "There shall be procedures in place to control the installation of software on operational systems."
  children = [
    benchmark.hipaa_hitrust_v92_0606_10h2system,
    benchmark.hipaa_hitrust_v92_0607_10h2system
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0606_10h2system" {
  title = "Applications and operating systems are successfully tested for usability, security and impact prior to production"
  children = [
    control.compute_vm_container_security_configurations_vulnerabilities_remediated
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_0607_10h2system" {
  title       = "The organization uses its configuration control program to maintain control of all implemented software and its system documentation and archive prior versions of implemented software and associated system documentation"
  children = [
    control.compute_vm_adaptive_application_controls_enabled,
    control.compute_vm_scale_set_security_configuration_vulnerabilities_remediated
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}