locals {
  rbi_itf_nbfc_common_tags = merge(local.azure_compliance_common_tags, {
    rbi_itf_nbfc_2017 = "true"
    type              = "Benchmark"
  })
}

benchmark "rbi_itf_nbfc" {
  title         = "IT Governance"
  documentation = file("./rbi_itf_nbfc/docs/rbi_itf_nbfc_overview.md")

  children = [
    benchmark.rbi_itf_nbfc_it_governance,
    benchmark.rbi_itf_nbfc_it_policy,
    benchmark.rbi_itf_nbfc_it_information_and_cyber_security,
  ]

  tags = local.rbi_itf_nbfc_common_tags
}
