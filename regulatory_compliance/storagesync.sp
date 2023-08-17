locals {
  regulatory_compliance_storagesync_common_tags = {
    service = "Azure/FileSync"
  }
}

control "storage_sync_private_link_used" {
  title       = "Azure File Sync should use private link"
  description = "Creating a private endpoint for the indicated Storage Sync Service resource allows you to address your Storage Sync Service resource from within the private IP address space of your organization's network, rather than through the internet-accessible public endpoint. Creating a private endpoint by itself does not disable the public endpoint."
  query       = query.storage_sync_private_link_used

  tags = merge(local.regulatory_compliance_storagesync_common_tags, {
    fundamental_security = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

query "storage_sync_private_link_used" {
  sql = <<-EOQ
    with storagesync_service_connection as (
      select
        distinct a.id
      from
        azure_storage_sync as a,
        jsonb_array_elements(private_endpoint_connections) as connection
      where
        connection -> 'PrivateLinkServiceConnectionState' ->> 'status' = 'Approved'
    )
    select
      a.id as resource,
      case
        when incoming_traffic_policy = 'AllowAllTraffic' then 'alarm'
        when c.id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when incoming_traffic_policy = 'AllowAllTraffic' then a.name || ' using public networks.'
        when c.id is null then a.name || ' not uses private link.'
        else a.name || ' uses private link.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_storage_sync as a
      left join storagesync_service_connection as c on c.id = a.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}
