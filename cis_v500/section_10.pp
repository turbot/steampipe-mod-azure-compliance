locals {
  cis_v500_10_common_tags = merge(local.cis_v500_common_tags, {
    cis_section_id = "10"
  })
}

benchmark "cis_v500_10" {
  title         = "10 Miscellaneous"
  documentation = file("./cis_v500/docs/cis_v500_10.md")
  children = [
    // Add subsections here
  ]

  tags = merge(local.cis_v500_10_common_tags, {
    type = "Benchmark"
  })
}

