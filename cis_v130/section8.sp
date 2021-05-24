locals {
  cis_v130_8_common_tags = merge(local.cis_v130_common_tags, {
    cis_section_id = "8"
  })
}

benchmark "cis_v130_8" {
  title         = "8 Other Security Considerations"
  documentation = file("./cis_v130/docs/cis_v130_8.md")
  tags          = local.cis_v130_8_common_tags
  children = [
    control.cis_v130_8_2
  ]
}

# TODO 8.1 Ensure that the expiration date is set on all keys

control "cis_v130_8_2" {
  title       = "8.2 Ensure that the expiration date is set on all Secrets"
  description = "Ensure that all Secrets in the Azure Key Vault have an expiration time set."
  sql         = query.keyvault_secret_expiration_set.sql
  # documentation = file("./cis_v130/docs/cis_v130_8_2.md")

  tags = merge(local.cis_v130_8_common_tags, {
    cis_item_id = "8.2"
    cis_level   = "2"
    cis_type    = "automated"
  })
}
