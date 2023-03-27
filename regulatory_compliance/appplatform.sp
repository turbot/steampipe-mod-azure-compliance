# Non-Config rule query

query "spring_cloud_service_network_injection_enabled" {
  sql = <<-EOQ
    select
      distinct a.name as resource,
      case
        when sku_tier <> 'Standard' then 'Skip'
        when sku_tier = 'Standard' and network_profile ->> 'ServiceRuntimeSubnetID' is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when sku_tier <> 'Standard' then a.name || ' is of ' || sku_tier || ' tier.'
        when sku_tier = 'Standard' and network_profile ->> 'ServiceRuntimeSubnetID' is not null then a.name || ' network injection enabled.'
        else a.name || ' network injection disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_spring_cloud_service as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}
