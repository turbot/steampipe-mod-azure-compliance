locals {
  cis_v140_common_tags = merge(local.azure_compliance_common_tags, {
    cis         = "true"
    cis_version = "v1.4.0"
  })
}

benchmark "cis_v140" {
  title         = "CIS v1.4.0"
  description   = "The CIS Microsoft Azure Foundations Security Benchmark provides prescriptive guidance for establishing a secure baseline configuration for Microsoft Azure."
  documentation = file("./cis_v140/docs/cis_overview.md")

  children = [
    benchmark.cis_v140_1,
    benchmark.cis_v140_2,
    benchmark.cis_v140_3,
    benchmark.cis_v140_4,
    benchmark.cis_v140_5,
    benchmark.cis_v140_6,
    benchmark.cis_v140_7,
    benchmark.cis_v140_8,
    benchmark.cis_v140_9
  ]

  tags = merge(local.cis_v140_common_tags, {
    type = "Benchmark"
  })
}
