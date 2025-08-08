locals {
  cis_v150_common_tags = merge(local.azure_compliance_common_tags, {
    cis         = "true"
    cis_version = "v1.5.0"
  })
}

benchmark "cis_v150" {
  title         = "Azure CIS v1.5.0"
  description   = "The CIS Microsoft Azure Foundations Security Benchmark provides prescriptive guidance for establishing a secure baseline configuration for Microsoft Azure."
  documentation = file("./cis_v150/docs/cis_overview.md")

  children = [
    benchmark.cis_v150_1,
    benchmark.cis_v150_2,
    benchmark.cis_v150_3,
    benchmark.cis_v150_4,
    benchmark.cis_v150_5,
    benchmark.cis_v150_6,
    benchmark.cis_v150_7,
    benchmark.cis_v150_8,
    benchmark.cis_v150_9,
    benchmark.cis_v150_10
  ]

  tags = merge(local.cis_v150_common_tags, {
    type = "Benchmark"
  })
}
