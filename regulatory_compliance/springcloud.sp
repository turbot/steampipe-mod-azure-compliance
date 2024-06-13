locals {
  regulatory_compliance_springcloud_common_tags = {
    service = "Azure/SpringCloud"
  }
}

control "spring_cloud_service_network_injection_enabled" {
  title       = "Azure Spring Cloud should use network injection"
  description = "Azure Spring Cloud instances should use virtual network injection for the following purposes: 1. Isolate Azure Spring Cloud from Internet. 2. Enable Azure Spring Cloud to interact with systems in either on premises data centers or Azure service in other virtual networks. 3. Empower customers to control inbound and outbound network communications for Azure Spring Cloud."
  query       = query.spring_cloud_service_network_injection_enabled

  tags = merge(local.regulatory_compliance_springcloud_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    rbi_itf_nbfc_v2016    = "true"
  })
}

query "spring_cloud_service_network_injection_enabled" {
  sql = <<-EOQ
    select
      distinct a.name as resource,
      case
        when sku_tier <> 'Standard' then 'skip'
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
