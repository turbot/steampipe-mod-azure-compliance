locals {
  regulatory_compliance_appconfiguration_common_tags = {
    service = "Azure/AppConfiguration"
  }
}

control "app_configuration_private_link_used" {
  title       = "App Configuration should use private link"
  description = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The private link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to your app configuration instances instead of the entire service, you'll also be protected against data leakage risks."
  query       = query.app_configuration_private_link_used

  tags = merge(local.regulatory_compliance_appconfiguration_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

query "app_configuration_private_link_used" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        -- Only applicable to standard tier
        when sku_name = 'free' then 'skip'
        -- All networks, including the internet and private endpoints, can access this resource
        -- Checking if all network enabled and no private endpoint then it's public access
        when public_network_access = 'Enabled' and private_endpoint_connections is null then 'alarm'
        when private_endpoint_connections @>  '[{"privateLinkServiceConnectionStateStatus": "Approved"}]'::jsonb then 'ok'
        else 'alarm'
      end as status,
      case
        when sku_name = 'free' then a.name || ' is of ' || sku_name || ' tier.'
        when public_network_access = 'Enabled' and private_endpoint_connections is null then ' using public networks.'
        when private_endpoint_connections @>  '[{"privateLinkServiceConnectionStateStatus": "Approved"}]'::jsonb then a.name || ' using private link.'
        else a.name || ' not using private link.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_configuration a,
      azure_subscription sub;
  EOQ
}