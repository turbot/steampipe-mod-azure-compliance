benchmark "rbi_itf_nbfc_v2016_preventing_execution_of_unauthorised_software" {
  title = "Preventing Execution Of Unauthorised Software"
  children = [
    benchmark.rbi_itf_nbfc_v2016_preventing_execution_of_unauthorised_software_2
  ]

  tags = local.rbi_itf_nbfc_v2016_common_tags
}

benchmark "rbi_itf_nbfc_v2016_preventing_execution_of_unauthorised_software_2" {
  title = "Preventing Execution Of Unauthorised Software-2"
  children = [
    benchmark.rbi_itf_nbfc_v2016_preventing_execution_of_unauthorised_software_2_3
  ]

  tags = local.rbi_itf_nbfc_v2016_common_tags
}

benchmark "rbi_itf_nbfc_v2016_preventing_execution_of_unauthorised_software_2_3" {
  title = "Security Update Management-2.3"
  children = [
    control.sql_database_vulnerability_findings_resolved,
    control.compute_vm_system_updates_installed,
  ]

  tags = local.rbi_itf_nbfc_v2016_common_tags
}