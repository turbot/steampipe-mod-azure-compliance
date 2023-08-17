locals {
  regulatory_compliance_synapse_common_tags = {
    service = "Azure/SynapseAnalytics"
  }
}

control "synapse_workspace_private_link_used" {
  title       = "Azure Synapse workspaces should use private link"
  description = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to Azure Synapse workspace, data leakage risks are reduced."
  query       = query.synapse_workspace_private_link_used

  tags = merge(local.regulatory_compliance_synapse_common_tags, {
    fundamental_security = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "synapse_workspace_vulnerability_assessment_enabled" {
  title       = "Vulnerability assessment should be enabled on your Synapse workspaces"
  description = "Discover, track, and remediate potential vulnerabilities by configuring recurring SQL vulnerability assessment scans on your Synapse workspaces."
  query       = query.synapse_workspace_vulnerability_assessment_enabled

  tags = merge(local.regulatory_compliance_synapse_common_tags, {
    fundamental_security = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "synapse_workspace_encryption_at_rest_using_cmk" {
  title       = "Azure Synapse workspaces should use customer-managed keys to encrypt data at rest"
  description = "Use customer-managed keys to control the encryption at rest of the data stored in Azure Synapse workspaces. Customer-managed keys deliver double encryption by adding a second layer of encryption on top of the default encryption with service-managed keys."
  query       = query.synapse_workspace_encryption_at_rest_using_cmk

  tags = merge(local.regulatory_compliance_synapse_common_tags, {
    fundamental_security = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "synapse_workspace_data_exfiltration_protection_enabled" {
  title       = "Synapse workspaces should have data exfiltration protection enabled"
  description = "This control checks whether Synapse workspace has data exfiltration protection enabled."
  query       = query.synapse_workspace_data_exfiltration_protection_enabled

  tags = merge(local.regulatory_compliance_synapse_common_tags, {
    fundamental_security = "true"
    other_checks         = "true"
  })
}

query "synapse_workspace_private_link_used" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when private_endpoint_connections @> '[{"privateLinkServiceConnectionStateStatus": "Approved"}]' then 'ok'
        else 'alarm'
      end as status,
      case
        when private_endpoint_connections @> '[{"privateLinkServiceConnectionStateStatus": "Approved"}]' then a.name || ' uses private link.'
        else a.name || ' not uses private link.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_synapse_workspace as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "synapse_workspace_vulnerability_assessment_enabled" {
  sql = <<-EOQ
    with synapse_workspace as(
      select
        id,
        name,
        subscription_id,
        resource_group
      from
        azure_synapse_workspace,
        jsonb_array_elements(workspace_managed_sql_server_vulnerability_assessments) as w
      where
        w -> 'properties' -> 'recurringScans' ->> 'isEnabled' = 'true'
    )
    select
      a.id as resource,
      case
        when s.id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when s.id is not null then a.name || ' vulnerability assessment enabled.'
        else a.name || ' vulnerability assessment disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
    azure_synapse_workspace as a
    left join synapse_workspace as s on s.id = a.id,
    azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "synapse_workspace_encryption_at_rest_using_cmk" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when encryption -> 'CmkKey' ->> 'name' is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when encryption -> 'CmkKey' ->> 'name' is not null then s.title || ' encrypted with CMK.'
        else s.title || ' not encrypted with CMK.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_synapse_workspace as s,
      azure_subscription as sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}

query "synapse_workspace_data_exfiltration_protection_enabled" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when managed_virtual_network_settings ->> 'preventDataExfiltration' = 'true' then 'ok'
        else 'alarm'
      end as status,
      case
        when managed_virtual_network_settings ->> 'preventDataExfiltration' = 'true' then s.title || ' data exfiltration protection enabled.'
        else s.title || ' data exfiltration protection disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_synapse_workspace as s,
      azure_subscription as sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}
