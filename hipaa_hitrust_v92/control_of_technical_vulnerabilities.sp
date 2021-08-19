benchmark "hipaa_hitrust_v92_control_of_technical_vulnerabilities" {
  title         = "Control of Technical Vulnerabilities"
  children = [
    benchmark.hipaa_hitrust_v92_0709_10m1organizational_1_10_m,
    benchmark.hipaa_hitrust_v92_0713_10m2organizational_5_10_m,
    benchmark.hipaa_hitrust_v92_0718_10m3organizational_34_10_m,
    benchmark.hipaa_hitrust_v92_0719_10m3organizational_5_10_m
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0709_10m1organizational_1_10_m" {
  title         = "0709.10m1Organizational.1 - 10.m"
  description   = "Technical vulnerabilities are identified, evaluated for risk and corrected in a timely manner."
  children = [
    control.sql_server_and_databases_va_enabled,
    control.compute_vm_security_configuration_vulnerabilities_remediated
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0713_10m2organizational_5_10_m" {
  title         = "0713.10m2Organizational.5 - 10.m"
  description   = "Patches are tested and evaluated before they are installed."
  children = [
    control.compute_vm_security_configuration_vulnerabilities_remediated
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0718_10m3organizational_34_10_m" {
  title         = "0718.10m3Organizational.34 - 10.m"
  description   = "The organization scans for vulnerabilities in the information system and hosted applications to determine the state of flaw remediation monthly (automatically) and again (manually or automatically) when new vulnerabilities potentially affecting the systems and networked environments are identified and reported."
  children = [
    control.compute_vm_security_configuration_vulnerabilities_remediated
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}


benchmark "hipaa_hitrust_v92_0719_10m3organizational_5_10_m" {
  title         = "0719.10m3Organizational.5 - 10.m"
  description   = "The organization updates the list of information system vulnerabilities scanned within every thirty (30) days or when new vulnerabilities are identified and reported."
  children = [
    control.compute_vm_security_configuration_vulnerabilities_remediated
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}