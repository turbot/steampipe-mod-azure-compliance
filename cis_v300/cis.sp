locals {
  cis_v300_common_tags = merge(local.azure_compliance_common_tags, {
    cis         = "true"
    cis_version = "v3.0.0"
  })
}

benchmark "cis_v300" {
  title         = "CIS v3.0.0"
  description   = "The CIS Microsoft Azure Foundations Security Benchmark provides prescriptive guidance for establishing a secure baseline configuration for Microsoft Azure."
  documentation = file("./cis_v300/docs/cis_overview.md")

  children = [
    benchmark.cis_v300_2,
    // benchmark.cis_v300_3,
    // benchmark.cis_v300_4,
    // benchmark.cis_v300_5,
    benchmark.cis_v300_6,
    benchmark.cis_v300_7,
    benchmark.cis_v300_8,
    benchmark.cis_v300_9,
    benchmark.cis_v300_10
  ]

  tags = merge(local.cis_v300_common_tags, {
    type = "Benchmark"
  })
}
