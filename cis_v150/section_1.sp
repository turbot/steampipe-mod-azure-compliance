locals {
  cis_v150_1_common_tags = merge(local.cis_v150_common_tags, {
    cis_section_id = "1"
  })
}

benchmark "cis_v150_1" {
  title         = "1 Identity and Access Management"
  documentation = file("./cis_v150/docs/cis_v150_1.md")
  children = [
  ]

  tags = merge(local.cis_v150_1_common_tags, {
    type    = "Benchmark"
    service = "Azure/ActiveDirectory"
  })
}