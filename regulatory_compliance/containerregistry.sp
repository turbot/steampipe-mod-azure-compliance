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
  title       = "Container registry images should have vulnerability findings resolved"
  description = "Container image vulnerability assessment scans your registry for security vulnerabilities and exposes detailed findings for each image. Resolving the vulnerabilities can greatly improve your containers' security posture and protect them from attacks."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_containerregistry_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "container_registry_admin_user_disabled" {
  title       = "Container registries admin user should be disabled"
  description = "Ensure container registry admin user is disabled. This control is non-compliant if admin user is enabled."
  query       = query.container_registry_admin_user_disabled

  tags = merge(local.regulatory_compliance_containerregistry_common_tags, {
    other_checks = "true"
  })
}

control "container_registry_quarantine_policy_enabled" {
  title       = "Container registries quarantine policy should be enabled"
  description = "Ensure container registry quarantine policy is enabled. This control is non-compliant if quarantine policy is disabled."
  query       = query.container_registry_quarantine_policy_enabled

  tags = merge(local.regulatory_compliance_containerregistry_common_tags, {
    other_checks = "true"
  })
}

control "container_registry_retention_policy_enabled" {
  title       = "Container registries retention policy should be enabled"
  description = "Ensure container registry retention policy is enabled. This control is non-compliant if retention policy is disabled."
  query       = query.container_registry_retention_policy_enabled

  tags = merge(local.regulatory_compliance_containerregistry_common_tags, {
    other_checks = "true"
  })
}

control "container_registry_geo_replication_enabled" {
  title       = "Container registries should be geo-replicated"
  description = "Ensure that container registries are geo-replicated to align with multi-region container deployments."
  query       = query.container_registry_geo_replication_enabled

  tags = merge(local.regulatory_compliance_containerregistry_common_tags, {
    other_checks = "true"
  })
}

control "container_registry_public_network_access_disabled" {
  title       = "Container registries public network access should be disabled"
  description = "Ensure that container registries public network access is disabled."
  query       = query.container_registry_public_network_access_disabled

  tags = merge(local.regulatory_compliance_containerregistry_common_tags, {
    other_checks = "true"
  })
}

control "container_registry_trust_policy_enabled" {
  title       = "Container registries trust policy should be enabled"
  description = "Ensure container registry trust policy is enabled. This control is non-compliant if trust policy is disabled."
  query       = query.container_registry_trust_policy_enabled

  tags = merge(local.regulatory_compliance_containerregistry_common_tags, {
    other_checks = "true"
  })
}

query "container_registry_encrypted_with_cmk" {
  sql = <<-EOQ
    select
      distinct a.name as resource,
      case
        when encryption ->> 'status' = 'enabled' then 'ok'
        else 'alarm'
      end as status,
      case
        when encryption ->> 'status' = 'enabled' then a.name || ' encrypted with CMK.'
        else a.name || ' not encrypted with CMK.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
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
      distinct a.name as resource,
      case
        when network_rule_set ->> 'defaultAction' = 'Deny' then 'ok'
        else 'alarm'
      end as status,
      case
        when network_rule_set ->> 'defaultAction' = 'Deny' then a.name || ' publicly not accessible.'
        else a.name || ' publicly accessible.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
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
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
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
      a.id as resource,
      case
        when c.id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when c.id is null then a.name || ' not uses private link.'
        else a.name || ' uses private link.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_container_registry as a
      left join container_registry_private_connection as c on c.id = a.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "container_registry_admin_user_disabled" {
  sql = <<-EOQ
    select
      distinct a.name as resource,
      case
        when admin_user_enabled then 'alarm'
        else 'ok'
      end as status,
      case
        when admin_user_enabled then a.name || ' admin user enabled.'
        else a.name || ' admin user disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_container_registry as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "container_registry_quarantine_policy_enabled" {
  sql = <<-EOQ
    select
      distinct a.name as resource,
      case
        when policies -> 'quarantinePolicy' ->>  'status' = 'enabled' then 'ok'
        else 'alarm'
      end as status,
      case
        when policies -> 'quarantinePolicy' ->>  'status' = 'enabled'  then a.name || ' quarantine policy enabled.'
        else a.name || ' quarantine policy  disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_container_registry as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "container_registry_retention_policy_enabled" {
  sql = <<-EOQ
    select
      distinct a.name as resource,
      case
        when policies -> 'retentionPolicy' ->>  'status' = 'enabled' then 'ok'
        else 'alarm'
      end as status,
      case
        when policies -> 'retentionPolicy' ->>  'status' = 'enabled'  then a.name || ' retention policy enabled.'
        else a.name || ' retention policy  disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_container_registry as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "container_registry_geo_replication_enabled" {
  sql = <<-EOQ
    with geo_replication_count as (
      select
        name as name,
        subscription_id,
        (v ->> 'currentValue')::int as geo_replication_count
      from
        azure_container_registry,
        jsonb_array_elements(usages -> 'value') as v
      where
        v ->> 'name' = 'Geo-replications'
        and v ->> 'unit' = 'Count'
    )
    select
      distinct a.name as resource,
      case
        when sku_name <> 'Premium' then 'skip'
        when c.geo_replication_count > 1 then 'ok'
        else 'alarm'
      end as status,
      case
        when sku_name <> 'Premium' then  a.name || ' is of ' || sku_tier || ' tier.'
        when c.geo_replication_count > 1 then a.name || ' ' || c.geo_replication_count || ' geo replication configured.'
        else a.name || ' geo replication not configured.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_container_registry as a
      left join geo_replication_count as c on a.name = c.name and a.subscription_id = c.subscription_id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "container_registry_public_network_access_disabled" {
  sql = <<-EOQ
    select
      distinct a.name as resource,
      case
        when public_network_access = 'Enabled' then 'alarm'
        else 'ok'
      end as status,
      case
        when public_network_access = 'Enabled' then a.name || ' public network access enabled.'
        else a.name || ' public network access disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_container_registry as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "container_registry_trust_policy_enabled" {
  sql = <<-EOQ
    select
      distinct a.name as resource,
      case
        when policies -> 'trustPolicy' ->> 'status' = 'enabled' then 'ok'
        else 'alarm'
      end as status,
      case
        when policies -> 'trustPolicy' ->> 'status' = 'enabled' then a.name || ' trust policy enabled.'
        else a.name || ' trust policy disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_container_registry as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}