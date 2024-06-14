locals {
  fedramp_high_common_tags = merge(local.azure_compliance_common_tags, {
    fedramp_high = "true"
    type         = "Benchmark"
  })
}

benchmark "fedramp_high" {
  title         = "FedRAMP High Regulatory Compliance"
  description   = "This benchmark ensures that the Azure resources are compliant with the FedRAMP High regulatory standard."
  documentation = ("./docs/fedramp_high_overview.md")

  children = [
    benchmark.fedramp_high_ac,
    benchmark.fedramp_high_au,
    benchmark.fedramp_high_cm,
    benchmark.fedramp_high_cp,
    benchmark.fedramp_high_ia,
    benchmark.fedramp_high_ir,
    benchmark.fedramp_high_ra,
    benchmark.fedramp_high_sc,
    benchmark.fedramp_high_si
  ]

  tags = local.fedramp_high_common_tags
}