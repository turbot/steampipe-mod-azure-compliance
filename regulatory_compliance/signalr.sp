locals {
  regulatory_compliance_signalr_common_tags = {
    service = "Azure/SignalRService"
  }
}

control "signalr_service_private_link_used" {
  title       = "Azure SignalR Service should use private link"
  description = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The private link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to your Azure SignalR Service resource instead of the entire service, you'll reduce your data leakage risks."
  query       = query.signalr_service_private_link_used

  tags = merge(local.regulatory_compliance_signalr_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}
