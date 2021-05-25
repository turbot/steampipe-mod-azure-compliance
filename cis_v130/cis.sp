locals {
  cis_v130_common_tags = {
    benchmark   = "cis"
    cis_version = "v1.3.0"
    plugin      = "azure"
  }
}

benchmark "cis_v130" {
  title         = "CIS v1.3.0"
  description   = "The CIS Microsoft Azure Foundations Security Benchmark provides prescriptive guidance for establishing a secure baseline configuration for Microsoft Azure."
  documentation = file("./cis_v130/docs/cis_overview.md")
  tags          = local.cis_v130_common_tags
  children = [
    benchmark.cis_v130_1,
    benchmark.cis_v130_2,
    benchmark.cis_v130_3,
    benchmark.cis_v130_4,
    benchmark.cis_v130_5,
    benchmark.cis_v130_6,
    benchmark.cis_v130_7,
    benchmark.cis_v130_8,
    benchmark.cis_v130_9
  ]
}
