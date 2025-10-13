locals {
  cis_v500_4_common_tags = merge(local.cis_v500_common_tags, {
    cis_section_id = "4"
  })
}

benchmark "cis_v500_4" {
  title         = "4 Database Services"
  documentation = file("./cis_v500/docs/cis_v500_4.md")
  children = [
    // Add subsections here
  ]

  tags = merge(local.cis_v500_4_common_tags, {
    type = "Benchmark"
  })
}

