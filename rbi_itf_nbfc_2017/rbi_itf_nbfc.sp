locals {
  rbi_itf_nbfc_common_tags = merge(local.azure_compliance_common_tags, {
    rbi_itf_nbfc_2017 = "true"
    type              = "Benchmark"
  })
}

benchmark "rbi_itf_nbfc" {
  title         = "Reserve Bank of India - IT Framework for NBFC Regulatory Compliance"
  documentation = file("./rbi_itf_nbfc/docs/rbi_itf_nbfc_overview.md")

  children = [
    benchmark.rbi_itf_nbfc_it_governance,
    benchmark.rbi_itf_nbfc_it_policy,
    benchmark.rbi_itf_nbfc_it_information_and_cyber_security,
    benchmark.rbi_itf_nbfc_it_operations,
    benchmark.rbi_itf_nbfc_is_audit,
    benchmark.rbi_itf_nbfc_business_continuity_planning
  ]

  tags = local.rbi_itf_nbfc_common_tags
}
