locals {
  cis_v400_1_common_tags = merge(local.cis_v400_common_tags, {
    cis_section_id = "1"
  })
}

benchmark "cis_v400_1" {
  title         = "1 Identity and Access Management"
  documentation = file("./cis_v400/docs/cis_v400_1.md")
  children = [
    # Controls will be added here as per CIS v4.0.0 requirements
  ]

  tags = merge(local.cis_v400_1_common_tags, {
    type    = "Benchmark"
    service = "Azure/ActiveDirectory"
  })
} 