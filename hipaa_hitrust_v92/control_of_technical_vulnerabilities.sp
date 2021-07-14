benchmark "hipaa_hitrust_v92_control_of_technical_vulnerabilities" {
  title         = "Control of Technical Vulnerabilities"
  children = [
    benchmark.hipaa_hitrust_v92_0709_10m1organizational_1_10_m,
    benchmark.hipaa_hitrust_v92_0716_10m3organizational_1_10_m
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0709_10m1organizational_1_10_m" {
  title         = "0709.10m1Organizational.1 - 10.m"
  description   = "Technical vulnerabilities are identified, evaluated for risk and corrected in a timely manner."
  children = [
    control.sql_server_and_databases_va_enabled,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0716_10m3organizational_1_10_m" {
  title         = "0716.10m3Organizational.1 - 10.m"
  description   = "The organization conducts an enterprise security posture review as needed but no less than once within every three-hundred-sixty-five (365) days, in accordance with organizational IS procedures."
  children = [
    control.sql_server_and_databases_va_enabled,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}