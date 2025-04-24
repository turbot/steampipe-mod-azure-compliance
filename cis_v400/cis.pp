locals {
  cis_v400_common_tags = merge(local.azure_compliance_common_tags, {
    cis         = "true"
    cis_version = "v4.0.0"
  })
}

benchmark "cis_v400" {
  title         = "CIS v4.0.0"
  description   = "The CIS Microsoft Azure Foundations Foundations Security Benchmark provides prescriptive guidance for establishing a secure baseline configuration for Microsoft Azure Foundations."
  documentation = file("./cis_v400/docs/cis_overview.md")

  children = [
    benchmark.cis_v400_1,
    benchmark.cis_v400_10,
    benchmark.cis_v400_2,
    benchmark.cis_v400_3,
    benchmark.cis_v400_4,
    benchmark.cis_v400_6,
    benchmark.cis_v400_7,
    benchmark.cis_v400_8,
    benchmark.cis_v400_9,
  ]

  tags = merge(local.cis_v400_common_tags, {
    type = "Benchmark"
  })
}
