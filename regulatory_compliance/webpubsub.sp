locals {
  regulatory_compliance_webpubsub_common_tags = {
    service = "Azure/WebPubSub"
  }
}

control "web_pub_sub_private_link_used" {
  title       = "Azure Web PubSub Service should use private link"
  description = "Azure Private Link lets you connect your virtual networks to Azure services without a public IP address at the source or destination. The private link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to your Azure Web PubSub Service, you can reduce data leakage risks. Learn more about private links at: https://aka.ms/awps/privatelink."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_webpubsub_common_tags, {
    nist_sp_800_53_rev_5  = "true"
  })
}
