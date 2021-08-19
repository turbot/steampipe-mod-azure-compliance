benchmark "hipaa_hitrust_v92_control_of_operational_software" {
  title         = "Control of Operational Software"
  children = [
    benchmark.hipaa_hitrust_v92_0607_10h2system_23_10_h
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0607_10h2system_23_10_h" {
  title         = "0607.10h2System.23 - 10.h "
  description   = "The organization uses its configuration control program to maintain control of all implemented software and its system documentation and archive prior versions of implemented software and associated system documentation."
  children = [
    control.compute_vm_adaptive_application_controls_enabled,
    control.sql_server_and_databases_va_enabled
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}