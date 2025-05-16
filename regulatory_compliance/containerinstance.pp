locals {
  regulatory_compliance_containerinstance_common_tags = {
    service = "Azure/ContainerInstance"
  }
}

control "container_instance_container_group_encrypted_using_cmk" {
  title       = "Container Instance container group should use customer-managed key for encryption"
  description = "Secure your containers with greater flexibility using customer-managed keys. When you specify a customer-managed key, that key is used to protect and control access to the key that encrypts your data. Using customer-managed keys provides additional capabilities to control rotation of the key encryption key or cryptographically erase data."
  query       = query.container_instance_container_group_encrypted_using_cmk

  tags = merge(local.regulatory_compliance_containerinstance_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "container_instance_container_group_in_virtual_network" {
  title       = "Container instance container groups should be in virtual network"
  description = "This control ensures that the container group is deployed into a virtual network."
  query       = query.container_instance_container_group_in_virtual_network

  tags = local.regulatory_compliance_containerinstance_common_tags
}

control "container_instance_container_group_identity_provider_enabled" {
  title       = "Container instance container groups identity provider should be enabled"
  description = "Ensure that managed identity provider is enabled for the container instance container group. This control is non-compliant if container instance container group identity provider is disabled."
  query       = query.container_instance_container_group_identity_provider_enabled

  tags = local.regulatory_compliance_containerinstance_common_tags
}

control "container_instance_container_group_secured_environment_variable" {
  title       = "Container instance container groups should use secured environment variable"
  description = "Ensure that container instance container group uses secured environment variables. This control is non-compliant if container instance container group does not uses secured environment variables."
  query       = query.container_instance_container_group_secured_environment_variable

  tags = local.regulatory_compliance_containerinstance_common_tags
}

query "container_instance_container_group_encrypted_using_cmk" {
  sql = <<-EOQ
    select
      cg.id as resource,
      case
        when encryption_properties ->> 'keyName' is not null and encryption_properties ->> 'vaultBaseUrl' is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when encryption_properties ->> 'keyName' is not null and encryption_properties ->> 'vaultBaseUrl' is not null then cg.title || ' encrypted with CMK.'
        else cg.title || ' not encrypted with CMK.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "cg.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_container_group as cg,
      azure_subscription as sub
    where
      sub.subscription_id = cg.subscription_id
      ${replace(local.resource_group_filter_qualifier_sql, "__QUALIFIER__", "cg.")};
  EOQ
}

query "container_instance_container_group_in_virtual_network" {
  sql = <<-EOQ
    select
      cg.id as resource,
      case
        when subnet_ids is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when subnet_ids is not null then cg.title || ' in virtual network.'
        else cg.title || ' not in virtual network.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "cg.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_container_group as cg,
      azure_subscription as sub
    where
      sub.subscription_id = cg.subscription_id
      ${replace(local.resource_group_filter_qualifier_sql, "__QUALIFIER__", "cg.")};
  EOQ
}

query "container_instance_container_group_identity_provider_enabled" {
  sql = <<-EOQ
    select
      cg.id as resource,
      case
        when identity is null then 'alarm'
        else 'ok'
      end as status,
      case
        when identity is null then cg.name || ' identity provider disabled.'
        else cg.name || ' identity provider enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "cg.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_container_group as cg,
      azure_subscription as sub
    where
      sub.subscription_id = cg.subscription_id
      ${replace(local.resource_group_filter_qualifier_sql, "__QUALIFIER__", "cg.")};
  EOQ
}

query "container_instance_container_group_secured_environment_variable" {
  sql = <<-EOQ
    with not_secured_environment_variable_container_group as (
      select
        id
      from
        azure_container_group,
        jsonb_array_elements(containers) as c,
        jsonb_array_elements(c -> 'properties' -> 'environmentVariables') as v
      where
       v  ->'value' is not null
    )
    select
      cg.id as resource,
      case
        when g.id is not null then 'alarm'
        else 'ok'
      end as status,
      case
        when g.id is not null then cg.name || ' have unsecured environment variable.'
        else cg.name || ' have secured environment variable.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "cg.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_container_group as cg
      left join not_secured_environment_variable_container_group as g on g.id = cg.id,
      azure_subscription as sub
    where
      sub.subscription_id = cg.subscription_id
      ${replace(local.resource_group_filter_qualifier_sql, "__QUALIFIER__", "cg.")};
  EOQ
}
