benchmark "hipaa_hitrust_v92_control_of_technical_vulnerabilities" {
  title         = "Control of Technical Vulnerabilities"
  children = [
    benchmark.hipaa_hitrust_v92_0709_10m1organizational_1_10_m
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