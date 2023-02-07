locals {
  regulatory_compliance_eventgrid_common_tags = {
    service = "Azure/EventGrid"
  }
}

control "eventgrid_domain_private_link_used" {
  title       = "Azure Event Grid domains should use private link"
  description = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to your Event Grid domain instead of the entire service, you'll also be protected against data leakage risks."
  query       = query.eventgrid_domain_private_link_used

  tags = merge(local.regulatory_compliance_eventgrid_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "eventgrid_topic_private_link_used" {
  title       = "Azure Event Grid topics should use private link"
  description = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to your Event Grid topic instead of the entire service, you'll also be protected against data leakage risks."
  query       = query.eventgrid_topic_private_link_used

  tags = merge(local.regulatory_compliance_eventgrid_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

