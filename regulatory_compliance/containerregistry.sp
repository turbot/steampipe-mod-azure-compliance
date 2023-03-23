locals {
  regulatory_compliance_containerregistry_common_tags = {
    service = "Azure/ContainerRegistry"
  }
}

control "container_registry_use_virtual_service_endpoint" {
  title       = "Container Registry should use a virtual network service endpoint"
  description = "This policy audits any Container Registry not configured to use a virtual network service endpoint."
  query       = query.container_registry_use_virtual_service_endpoint

  tags = merge(local.regulatory_compliance_containerregistry_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "container_registry_azure_defender_enabled" {
  title       = "Azure Defender for container registries should be enabled"
  description = "Azure Defender for container registries provides vulnerability scanning of any images pulled within the last 30 days, pushed to your registry, or imported, and exposes detailed findings per image."
  query       = query.container_registry_azure_defender_enabled

  tags = merge(local.regulatory_compliance_containerregistry_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "container_registry_restrict_public_access" {
  title       = "Container registries should not allow unrestricted network access"
  description = "Azure container registries by default accept connections over the internet from hosts on any network. To protect your registries from potential threats, allow access from only specific public IP addresses or address ranges. If your registry doesn't have an IP/firewall rule or a configured virtual network, it will appear in the unhealthy resources."
  query       = query.container_registry_restrict_public_access

  tags = merge(local.regulatory_compliance_containerregistry_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "container_registry_uses_private_link" {
  title       = "Container registries should use private link"
  description = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The private link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to your container registries instead of the entire service, you'll also be protected against data leakage risks."
  query       = query.container_registry_uses_private_link

  tags = merge(local.regulatory_compliance_containerregistry_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "container_registry_encrypted_with_cmk" {
  title       = "Container registries should be encrypted with a customer-managed key"
  description = "Use customer-managed keys to manage the encryption at rest of the contents of your registries. By default, the data is encrypted at rest with service-managed keys, but customer-managed keys are commonly required to meet regulatory compliance standards. Customer-managed keys enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management."
  query       = query.container_registry_encrypted_with_cmk

  tags = merge(local.regulatory_compliance_containerregistry_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "container_registry_vulnerabilities_remediated" {
  title       = "Vulnerabilities in Azure Container Registry images should be remediated"
  description = "Container image vulnerability assessment scans your registry for security vulnerabilities on each pushed container image and exposes detailed findings for each image (powered by Qualys). Resolving the vulnerabilities can greatly improve your containers' security posture and protect them from attacks."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_containerregistry_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

query "container_registry_azure_defender_enabled" {
  sql = <<-EOQ
    select
      -- Required Columns
      pricing.id as resource,
      case
        when name = 'ContainerRegistry' and pricing_tier = 'Standard' then 'ok'
        else 'alarm'
      end as status,
      case
        when name = 'ContainerRegistry' and pricing_tier = 'Standard' then 'ContainerRegistry azure defender enabled.'
        else name || 'ContainerRegistry azure defender disabled.'
      end as reason,
      -- Additional Dimensions
      sub.display_name as subscription
    from
      azure_security_center_subscription_pricing as pricing,
      azure_subscription as sub
    where
      sub.subscription_id = pricing.subscription_id
      and name = 'ContainerRegistry';
  EOQ
}

query "container_registry_encrypted_with_cmk" {
  sql = <<-EOQ
    select
      -- Required Columns
      distinct a.name as resource,
      case
        when encryption ->> 'status' = 'enabled' then 'ok'
        else 'alarm'
      end as status,
      case
        when encryption ->> 'status' = 'enabled' then a.name || ' encrypted with CMK.'
        else a.name || ' not encrypted with CMK.'
      end as reason,
      -- Additional Dimensions
      a.resource_group,
      sub.display_name as subscription
    from
      azure_container_registry as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "container_registry_restrict_public_access" {
  sql = <<-EOQ
    select
      -- Required Columns
      distinct a.name as resource,
      case
        when network_rule_set ->> 'defaultAction' = 'Deny' then 'ok'
        else 'alarm'
      end as status,
      case
        when network_rule_set ->> 'defaultAction' = 'Deny' then a.name || ' publicly not accessible.'
        else a.name || ' publicly accessible.'
      end as reason,
      -- Additional Dimensions
      a.resource_group,
      sub.display_name as subscription
    from
      azure_container_registry as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "container_registry_use_virtual_service_endpoint" {
  sql = <<-EOQ
    with container_registry_subnet as (
      select
        distinct a.name,
        rule ->> 'id' as id
      from
        azure_container_registry as a,
        jsonb_array_elements(network_rule_set -> 'virtualNetworkRules') as rule,
        azure_subnet as subnet
    )
    select
      -- Required Columns
      distinct a.name as resource,
      case
        when network_rule_set ->> 'defaultAction' <> 'Deny' then 'alarm'
        when s.name is null then 'alarm'
        else 'ok'
      end as status,
      case
        when network_rule_set ->> 'defaultAction' <> 'Deny' then a.name || ' not configured with virtual service endpoint.'
        when s.name is null then a.name || ' not configured with virtual service endpoint.'
        else a.name || ' configured with virtual service endpoint.'
      end as reason,
      -- Additional Dimensions
      a.resource_group,
      sub.display_name as subscription
    from
      azure_container_registry as a
      left join container_registry_subnet as s on a.name = s.name,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "container_registry_uses_private_link" {
  sql = <<-EOQ
    with container_registry_private_connection as (
      select
        distinct a.id
      from
        azure_container_registry as a,
        jsonb_array_elements(private_endpoint_connections) as connection
      where
        connection -> 'properties' -> 'privateLinkServiceConnectionState' ->> 'status' = 'Approved'
    )
    select
      -- Required Columns
      a.id as resource,
      case
        when c.id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when c.id is null then a.name || ' not uses private link.'
        else a.name || ' uses private link.'
      end as reason,
      -- Additional Dimensions
      resource_group,
      sub.display_name as subscription
    from
      azure_container_registry as a
      left join container_registry_private_connection as c on c.id = a.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}