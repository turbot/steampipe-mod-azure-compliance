locals {
  rbi_itf_nbfc_v2016_common_tags = merge(local.azure_compliance_common_tags, {
    rbi_itf_nbfc_v2016 = "true"
    type               = "Benchmark"
  })
}

benchmark "rbi_itf_nbfc_v2016" {
  title         = "Reserve Bank of India - IT Framework for NBFC Regulatory Compliance"
  documentation = file("./rbi_itf_nbfc_v2016/docs/rbi_itf_nbfc_v2016_overview.md")

  children = [
    benchmark.rbi_itf_nbfc_v2016_authentication_framework_for_customers,
    benchmark.rbi_itf_nbfc_v2016_maintenance_monitoring_analysis_audit_logs,
    benchmark.rbi_itf_nbfc_v2016_network_management_and_security,
    benchmark.rbi_itf_nbfc_v2016_patch_vulnerability_and_change_management,
    benchmark.rbi_itf_nbfc_v2016_preventing_execution_of_unauthorised_software,
    benchmark.rbi_itf_nbfc_v2016_secure_configuration,
    benchmark.rbi_itf_nbfc_v2016_secure_mail_and_messaging_systems,
    benchmark.rbi_itf_nbfc_v2016_user_access_control_management
  ]

  tags = local.rbi_itf_nbfc_v2016_common_tags
}
