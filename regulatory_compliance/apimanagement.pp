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
    fedramp_high          = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "apimanagement_service_client_certificate_enabled" {
  title       = "API Management client certificate should be enabled"
  description = "Ensure API Management client certificate is enabled. This control is non-compliant if API Management client certificate is disabled."
  query       = query.apimanagement_service_client_certificate_enabled

  tags = local.regulatory_compliance_apimanagement_common_tags
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
      azure_subscription sub
    where
      sub.subscription_id = a.subscription_id
      ${replace(local.resource_group_filter_qualifier_sql, "__QUALIFIER__", "a.")};
  EOQ
}

query "apimanagement_service_client_certificate_enabled" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when enable_client_certificate then 'ok'
        else 'alarm'
      end as status,
      case
        when enable_client_certificate then a.name || ' client certificate enabled.'
        else a.name || ' client certificate disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_api_management a,
      azure_subscription sub
    where
      sub.subscription_id = a.subscription_id
      ${replace(local.resource_group_filter_qualifier_sql, "__QUALIFIER__", "a.")};
  EOQ
}
