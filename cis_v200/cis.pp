locals {
  cis_v200_common_tags = merge(local.azure_compliance_common_tags, {
    cis         = "true"
    cis_version = "v2.0.0"
  })
}

benchmark "cis_v200" {
  title         = "CIS v2.0.0"
  description   = "The CIS Microsoft Azure Foundations Security Benchmark provides prescriptive guidance for establishing a secure baseline configuration for Microsoft Azure."
  documentation = file("./cis_v200/docs/cis_overview.md")

  children = [
    benchmark.cis_v200_1,
    benchmark.cis_v200_2,
    benchmark.cis_v200_3,
    benchmark.cis_v200_4,
    benchmark.cis_v200_5,
    benchmark.cis_v200_6,
    benchmark.cis_v200_7,
    benchmark.cis_v200_8,
    benchmark.cis_v200_9,
    benchmark.cis_v200_10
  ]

  tags = merge(local.cis_v200_common_tags, {
    type = "Benchmark"
  })
}
