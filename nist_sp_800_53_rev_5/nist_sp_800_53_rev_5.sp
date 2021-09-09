locals {
  nist_sp_800_53_rev_5_common_tags = {
    nist_sp_800_53_rev_5 = "true"
    plugin            = "azure"
  }
}

benchmark "nist_sp_800_53_rev_5" {
  title       = "NIST SP 800-53 Rev. 5"
  description = "To-do."
  documentation = file("./nist_sp_800_53_rev_5/docs/nist_sp_800_53_rev_5_overview.md")

  children = [
    benchmark.nist_sp_800_53_rev_5_ac,
    benchmark.nist_sp_800_53_rev_5_au,
    benchmark.nist_sp_800_53_rev_5_cm,
    benchmark.nist_sp_800_53_rev_5_cp,
    benchmark.nist_sp_800_53_rev_5_ia,
    benchmark.nist_sp_800_53_rev_5_ir
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}
