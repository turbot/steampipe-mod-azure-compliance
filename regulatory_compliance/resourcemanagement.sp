locals {
  regulatory_compliance_resourcemanagement_common_tags = {
    service = "Azure/ResourceManager"
  }
}

control "resource_manager_azure_defender_enabled" {
  title       = "Azure Defender for Resource Manager should be enabled"
  description = "Azure Defender for Resource Manager automatically monitors the resource management operations in your organization. Azure Defender detects threats and alerts you about suspicious activity."
  query       = query.resource_manager_azure_defender_enabled

  tags = merge(local.regulatory_compliance_resourcemanagement_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

query "resource_manager_azure_defender_enabled" {
  sql = <<-EOQ
    select
      pricing.id as resource,
      case
        when name = 'Arm' and pricing_tier = 'Standard' then 'ok'
        else 'alarm'
      end as status,
      case
        when name = 'Arm' and pricing_tier = 'Standard' then 'Arm azure defender enabled.'
        else name || 'Arm azure defender disabled.'
      end as reason
      ${replace(local.common_dimensions_pricing_qualifier_sql, "__QUALIFIER__", "pricing.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_security_center_subscription_pricing as pricing,
      azure_subscription as sub
    where
      sub.subscription_id = pricing.subscription_id
      and name = 'Arm';
  EOQ
}