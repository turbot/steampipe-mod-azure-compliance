locals {
  nist_sp_800_171_r2_common_tags = merge(local.azure_compliance_common_tags, {
    nist_sp_800_171_r2 = "true"
    type               = "Benchmark"
  })
}

benchmark "nist_sp_800_171_r2" {
  title         = "NIST SP 800-171 Revision 2"
  description   = "NIST SP 800-171 Revision 2 signifies a significant endeavor to enhance cybersecurity practices, specifically tailored for organizations engaging with the U.S. federal government."
  documentation = file("./nist_sp_800_171_r2/docs/nist_sp_800_171_r2_overview.md")

  children = [
    benchmark.nist_sp_800_171_r2_3_1,
    benchmark.nist_sp_800_171_r2_3_3,
    benchmark.nist_sp_800_171_r2_3_4,
    benchmark.nist_sp_800_171_r2_3_5,
    benchmark.nist_sp_800_171_r2_3_6,
    benchmark.nist_sp_800_171_r2_3_8,
    benchmark.nist_sp_800_171_r2_3_11,
    benchmark.nist_sp_800_171_r2_3_13,
    benchmark.nist_sp_800_171_r2_3_14
  ]

  tags = local.nist_sp_800_171_r2_common_tags
}
