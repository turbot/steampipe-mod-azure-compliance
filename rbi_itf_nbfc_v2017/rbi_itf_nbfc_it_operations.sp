benchmark "rbi_itf_nbfc_v2017_it_operations" {
  title = "IT Operations"
  children = [
    benchmark.rbi_itf_nbfc_v2017_it_operations_4
  ]

  tags = local.rbi_itf_nbfc_v2017_common_tags
}

benchmark "rbi_itf_nbfc_v2017_it_operations_4" {
  title = "IT Operations-4"
  children = [
    benchmark.rbi_itf_nbfc_v2017_it_operations_4_2,
    benchmark.rbi_itf_nbfc_v2017_it_operations_4_4
  ]
}

benchmark "rbi_itf_nbfc_v2017_it_operations_4_2" {
  title = "IT Operations-4.2"
  children = [
    control.compute_vm_network_traffic_data_collection_linux_agent_installed
  ]
}

benchmark "rbi_itf_nbfc_v2017_it_operations_4_4" {
  title = "IT Operations-4.4"
  children = [
    benchmark.rbi_itf_nbfc_v2017_it_operations_4_4_a,
    benchmark.rbi_itf_nbfc_v2017_it_operations_4_4_b
  ]
}

benchmark "rbi_itf_nbfc_v2017_it_operations_4_4_a" {
  title = "IT Operations-4.4.a"
  children = [
    control.compute_vm_vulnerability_assessment_solution_enabled,
    control.securitycenter_azure_defender_on_for_appservice,
    control.securitycenter_azure_defender_on_for_sqldb
  ]
}

benchmark "rbi_itf_nbfc_v2017_it_operations_4_4_b" {
  title = "IT Operations-4.4.b"
  children = [
    control.compute_vm_network_traffic_data_collection_linux_agent_installed,
    control.securitycenter_azure_defender_on_for_sqldb
  ]
}
