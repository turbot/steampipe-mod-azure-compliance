benchmark "hipaa_hitrust_v92_control_of_technical_vulnerabilities" {
  title         = "Control of Technical Vulnerabilities"
  children = [
    benchmark.hipaa_hitrust_v92_0709_10m1organizational_1_10_m,
    benchmark.hipaa_hitrust_v92_0713_10m2organizational_5_10_m,
    benchmark.hipaa_hitrust_v92_0714_10m2organizational_7_10_m,
    benchmark.hipaa_hitrust_v92_0717_10m3organizational_2_10_m,
    benchmark.hipaa_hitrust_v92_0718_10m3organizational_34_10_m,
    benchmark.hipaa_hitrust_v92_0719_10m3organizational_5_10_m,
    benchmark.hipaa_hitrust_v92_0710_10m2organizational_1_10_m,
    benchmark.hipaa_hitrust_v92_0716_10m3organizational_1_10_m,
    benchmark.hipaa_hitrust_v92_0711_10m2organizational_23_10_m
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0709_10m1organizational_1_10_m" {
  title    = "Technical vulnerabilities are identified, evaluated for risk and corrected in a timely manner"
  children = [
    control.sql_server_and_databases_va_enabled,
    control.compute_vm_security_configuration_vulnerabilities_remediated,
    control.compute_vm_scale_set_security_configuration_vulnerabilities_remediated,
    control.mssql_managed_instance_vulnerability_assessment_enabled,
    control.sql_database_vulnerability_findings_resolved,
    control.compute_vm_vulnerability_assessment_solution_enabled
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0713_10m2organizational_5_10_m" {
  title    = "Patches are tested and evaluated before they are installed"
  children = [
    control.compute_vm_security_configuration_vulnerabilities_remediated
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0718_10m3organizational_34_10_m" {
  title       = "The organization scans for vulnerabilities in the information system and hosted applications"
  description = "The organization scans for vulnerabilities in the information system and hosted applications to determine the state of flaw remediation monthly (automatically) and again (manually or automatically) when new vulnerabilities potentially affecting the systems and networked environments are identified and reported."
  children = [
    control.compute_vm_security_configuration_vulnerabilities_remediated
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}


benchmark "hipaa_hitrust_v92_0719_10m3organizational_5_10_m" {
  title    = "The organization updates the list of information system vulnerabilities scanned within every thirty (30) days or when new vulnerabilities are identified and reported"
  children = [
    control.mssql_managed_instance_vulnerability_assessment_enabled
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0714_10m2organizational_7_10_m" {
  title    = "The technical vulnerability management program is evaluated on a quarterly basis"
  children = [
    control.compute_vm_scale_set_security_configuration_vulnerabilities_remediated
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0717_10m3organizational_2_10_m" {
  title    = "Vulnerability scanning tools include the capability to readily update the information system vulnerabilities scanned"
  children = [
    control.compute_vm_scale_set_security_configuration_vulnerabilities_remediated
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0710_10m2organizational_1_10_m" {
  title    = "A hardened configuration standard exists for all system and network components"
  children = [
    control.mssql_managed_instance_vulnerability_assessment_enabled
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0716_10m3organizational_1_10_m" {
  title    = "The organization conducts an enterprise security posture review as needed but no less than once within every three-hundred-sixty-five (365) days, in accordance with organizational IS procedures"
  children = [
    control.sql_database_vulnerability_findings_resolved
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0711_10m2organizational_23_10_m" {
  title    = "A technical vulnerability management program is in place to monitor, assess, rank, and remediate vulnerabilities identified in systems"
  children = [
    control.compute_vm_vulnerability_assessment_solution_enabled
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}
