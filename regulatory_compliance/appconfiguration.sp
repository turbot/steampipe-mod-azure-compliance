locals {
  regulatory_compliance_appconfiguration_common_tags = {
    service = "appconfiguration"
  }
}

control "app_configuration_private_link_used" {
  title       = "App Configuration should use private link"
  description = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The private link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to your app configuration instances instead of the entire service, you'll also be protected against data leakage risks."
  sql         = query.app_configuration_private_link_used.sql

  tags = merge(local.regulatory_compliance_appconfiguration_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}