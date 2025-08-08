locals {
  fedramp_high_common_tags = merge(local.azure_compliance_common_tags, {
    fedramp_high = "true"
    type         = "Benchmark"
  })
}

benchmark "fedramp_high" {
  title         = "Azure FedRAMP High"
  description   = "The Federal Risk and Authorization Management Program (FedRAMP) is a U.S. Federal government program that provides a standardized approach to security assessment, authorization, and continuous monitoring for cloud products and services. The FedRAMP program has helped to accelerate the adoption of secure cloud solutions through the reuse of assessments and authorizations across government agencies. FedRAMP leverages a standardized set of requirements, established in accordance with the Federal Information Security Management Act (FISMA), to improve consistency and confidence in the security of cloud solutions. Cloud Service Providers (CSP) that support U.S. government customers or operate on U.S. government information are responsible for complying with the requirements established by the FedRAMP program. In May 2020 the Salesforce Government Cloud Plus achieved a provisional Authority to Operate (ATO) at the high impact level issued by the FedRAMP Joint Authorization Board (JAB)."
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
