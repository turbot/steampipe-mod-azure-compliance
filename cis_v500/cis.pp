locals {
  cis_v500_common_tags = merge(local.azure_compliance_common_tags, {
    cis         = "true"
    cis_version = "v5.0.0"
  })
}

benchmark "cis_v500" {
  title         = "Azure CIS v5.0.0"
  description   = "The CIS Microsoft Azure Foundations Security Benchmark provides prescriptive guidance for establishing a secure baseline configuration for Microsoft Azure."
  documentation = file("./cis_v500/docs/cis_overview.md")

  children = [
    benchmark.cis_v500_2,
    benchmark.cis_v500_3,
    benchmark.cis_v500_4,
    benchmark.cis_v500_5,
    benchmark.cis_v500_6,
    benchmark.cis_v500_7,
    benchmark.cis_v500_8,
    benchmark.cis_v500_9,
    benchmark.cis_v500_10
  ]

  tags = merge(local.cis_v500_common_tags, {
    type = "Benchmark"
  })
}

