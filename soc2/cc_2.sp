locals {
  soc_2_cc_2_common_tags = merge(local.soc_2_common_tags, {
    soc_2_section_id = "cc2"
  })
}

benchmark "soc_2_cc_2" {
  title         = "CC2.0 - Common Criteria Related to Communication and Information"
  documentation = file("./soc2/docs/cc_2_2.md")
  tags          = local.soc_2_cc_2_common_tags
  children      = [
    benchmark.soc_2_cc_2_3,
    control.securitycenter_additional_email_configured
  ]
}

benchmark "soc_2_cc_2_3" {
  title         = "CC2.3 COSO Principle 15: The entity communicates with external parties regarding matters     affecting the functioning of internal control"
  description   = "Test"
  documentation = file("./soc2/docs/cc_2_3.md")
  children      = [
    control.securitycenter_additional_email_configured
  ]

  tags = merge(local.soc_2_cc_2_common_tags, {
    soc_2_item_id = "2.3"
    soc_2_type    = "automated"
  })
}