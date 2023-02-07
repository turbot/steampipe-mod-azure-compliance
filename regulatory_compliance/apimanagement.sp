locals {
  regulatory_compliance_apimanagement_common_tags = {
    service = "Azure/APIManagement"
  }
}

control "apimanagement_service_with_virtual_network" {
  title       = "API Management services should use a virtual network"
  description = "Azure Virtual Network deployment provides enhanced security, isolation and allows you to place your API Management service in a non-internet routable network that you control access to. These networks can then be connected to your on-premises networks using various VPN technologies, which enables access to your backend services within the network and/or on-premises. The developer portal and API gateway, can be configured to be accessible either from the Internet or only within the virtual network."
  query       = query.apimanagement_service_with_virtual_network

  tags = merge(local.regulatory_compliance_apimanagement_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}
