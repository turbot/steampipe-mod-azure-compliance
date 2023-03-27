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

query "eventgrid_domain_private_link_used" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when public_network_access = 'Enabled' then 'alarm'
        when private_endpoint_connections is null then 'info'
        when private_endpoint_connections @>  '[{"privateLinkServiceConnectionStateStatus": "Approved"}]'::jsonb then 'ok'
        else 'alarm'
      end as status,
      case
        when public_network_access = 'Enabled' then a.name || ' using public networks.'
        when private_endpoint_connections is null then a.name || ' no private link exists.'
        when private_endpoint_connections @>  '[{"privateLinkServiceConnectionStateStatus": "Approved"}]'::jsonb
        then a.name || ' using private link.'
        else a.name || ' not using private link.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_eventgrid_domain a,
      azure_subscription sub;
  EOQ
}

query "eventgrid_topic_private_link_used" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when public_network_access = 'Enabled' then 'alarm'
        when private_endpoint_connections is null then 'info'
        when private_endpoint_connections @>  '[{"privateLinkServiceConnectionStateStatus": "Approved"}]'::jsonb then 'ok'
        else 'alarm'
      end as status,
      case
        when public_network_access = 'Enabled' then a.name || ' using public networks.'
        when private_endpoint_connections is null then a.name || ' no private link exists.'
        when private_endpoint_connections @>  '[{"privateLinkServiceConnectionStateStatus": "Approved"}]'::jsonb
        then a.name || ' using private link.'
        else a.name || ' not using private link.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_eventgrid_topic a,
      azure_subscription sub;
  EOQ
}