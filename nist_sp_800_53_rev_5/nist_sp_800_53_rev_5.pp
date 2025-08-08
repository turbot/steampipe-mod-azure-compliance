locals {
  nist_sp_800_53_rev_5_common_tags = merge(local.azure_compliance_common_tags, {
    nist_sp_800_53_rev_5 = "true"
    type                 = "Benchmark"
  })
}

benchmark "nist_sp_800_53_rev_5" {
  title       = "Azure NIST SP 800-53 Revision 5"
  description = "NIST SP 800-53 Revision 5 represents a multi-year effort to develop the next generation of security and privacy controls needed to strengthen and support the U.S. federal government."
  documentation = file("./nist_sp_800_53_rev_5/docs/nist_sp_800_53_rev_5_overview.md")

  children = [
    benchmark.nist_sp_800_53_rev_5_ac,
    benchmark.nist_sp_800_53_rev_5_au,
    benchmark.nist_sp_800_53_rev_5_cm,
    benchmark.nist_sp_800_53_rev_5_cp,
    benchmark.nist_sp_800_53_rev_5_ia,
    benchmark.nist_sp_800_53_rev_5_ir,
    benchmark.nist_sp_800_53_rev_5_ra,
    benchmark.nist_sp_800_53_rev_5_sc,
    benchmark.nist_sp_800_53_rev_5_si
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}
