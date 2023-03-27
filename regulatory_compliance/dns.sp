locals {
  regulatory_compliance_dns_common_tags = {
    service = "Azure/DNS"
  }
}

control "dns_azure_defender_enabled" {
  title       = "Azure Defender for DNS should be enabled"
  description = "Azure Defender for DNS provides an additional layer of protection for your cloud resources by continuously monitoring all DNS queries from your Azure resources. Azure Defender alerts you about suspicious activity at the DNS layer."
  query       = query.dns_azure_defender_enabled

  tags = merge(local.regulatory_compliance_dns_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

query "dns_azure_defender_enabled" {
  sql = <<-EOQ
    select
      pricing.id as resource,
      case
        when name = 'Dns' and pricing_tier = 'Standard' then 'ok'
        else 'alarm'
      end as status,
      case
        when name = 'Dns' and pricing_tier = 'Standard' then 'Dns azure defender enabled.'
        else name || 'Dns azure defender disabled.'
      end as reason
      ${replace(local.common_dimensions_pricing_qualifier_sql, "__QUALIFIER__", "pricing.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_security_center_subscription_pricing as pricing,
      azure_subscription as sub
    where
      sub.subscription_id = pricing.subscription_id
      and name = 'Dns';
  EOQ
}