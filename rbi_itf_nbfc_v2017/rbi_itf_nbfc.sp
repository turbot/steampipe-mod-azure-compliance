locals {
  rbi_itf_nbfc_v2017_common_tags = merge(local.azure_compliance_common_tags, {
    rbi_itf_nbfc_v2017 = "true"
    type               = "Benchmark"
  })
}

benchmark "rbi_itf_nbfc_v2017" {
  title         = "Reserve Bank of India - IT Framework for NBFC Regulatory Compliance"
  documentation = file("./rbi_itf_nbfc_v2017/docs/rbi_itf_nbfc_v2017_overview.md")

  children = [
    benchmark.rbi_itf_nbfc_v2017_business_continuity_planning,
    benchmark.rbi_itf_nbfc_v2017_is_audit,
    benchmark.rbi_itf_nbfc_v2017_it_governance,
    benchmark.rbi_itf_nbfc_v2017_it_information_and_cyber_security,
    benchmark.rbi_itf_nbfc_v2017_it_operations
  ]

  tags = local.rbi_itf_nbfc_v2017_common_tags
}
