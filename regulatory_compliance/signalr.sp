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
    fundamental_security = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "signalr_service_no_free_tier_sku" {
  title       = "SignalR Service should not use free tier SKU"
  description = "This control checks whether SignalR service uses paid SKU for its SLA."
  query       = query.signalr_service_no_free_tier_sku

  tags = merge(local.regulatory_compliance_signalr_common_tags, {
    fundamental_security = "true"
    other_checks         = "true"
  })
}

query "signalr_service_private_link_used" {
  sql = <<-EOQ
    with signalr_service_connection as (
      select
        distinct a.id
      from
        azure_signalr_service as a,
        jsonb_array_elements(private_endpoint_connections) as connection
      where
        connection -> 'PrivateLinkServiceConnectionState' ->> 'status' = 'Approved'
    )
    select
      a.id as resource,
      case
        when sku ->> 'tier' = 'Free' then 'skip'
        when c.id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when sku ->>'tier' = 'Free' then a.name || ' is of ' || (sku ->>'tier' )|| ' tier.'
        when c.id is null then a.name || ' not uses private link.'
        else a.name || ' uses private link.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_signalr_service as a
      left join signalr_service_connection as c on c.id = a.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "signalr_service_no_free_tier_sku" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when sku ->> 'tier' = 'Free' then 'alarm'
        else 'ok'
      end as status,
      a.name || ' is of ' || (sku ->>'tier' )|| ' tier.' as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_signalr_service as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}
