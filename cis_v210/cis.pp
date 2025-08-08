locals {
  cis_v210_common_tags = merge(local.azure_compliance_common_tags, {
    cis         = "true"
    cis_version = "v2.1.0"
  })
}

benchmark "cis_v210" {
  title         = "Azure CIS v2.1.0"
  description   = "The CIS Microsoft Azure Foundations Security Benchmark provides prescriptive guidance for establishing a secure baseline configuration for Microsoft Azure."
  documentation = file("./cis_v210/docs/cis_overview.md")

  children = [
    benchmark.cis_v210_1,
    benchmark.cis_v210_2,
    benchmark.cis_v210_3,
    benchmark.cis_v210_4,
    benchmark.cis_v210_5,
    benchmark.cis_v210_6,
    benchmark.cis_v210_7,
    benchmark.cis_v210_8,
    benchmark.cis_v210_9,
    benchmark.cis_v210_10
  ]

  tags = merge(local.cis_v210_common_tags, {
    type = "Benchmark"
  })
}
