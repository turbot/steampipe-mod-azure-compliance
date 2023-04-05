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

query "apimanagement_service_with_virtual_network" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when virtual_network_type != 'None' then 'ok'
        else 'alarm'
      end as status,
      a.name || ' Virtual network is set to '  ||  virtual_network_type as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_api_management a,
      azure_subscription sub;
  EOQ
}
