locals {
  regulatory_compliance_cognitiveservice_common_tags = {
    service = "Azure/CognitiveServices"
  }
}

control "cognitive_service_local_auth_disabled" {
  title       = "Cognitive Services accounts should have local authentication methods disabled"
  description = "Disabling local authentication methods improves security by ensuring that Cognitive Services accounts require Azure Active Directory identities exclusively for authentication."
  query       = query.cognitive_service_local_auth_disabled

  tags = merge(local.regulatory_compliance_cognitiveservice_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "cognitive_account_private_link_used" {
  title       = "Cognitive Services should use private link"
  description = "Azure Private Link lets you connect your virtual networks to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to Cognitive Services, you'll reduce the potential for data leakage."
  query       = query.cognitive_account_private_link_used

  tags = merge(local.regulatory_compliance_cognitiveservice_common_tags, {
    fedramp_high          = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "cognitive_account_public_network_access_disabled" {
  title       = "Cognitive Services accounts should disable public network access"
  description = "Disabling public network access improves security by ensuring that Cognitive Services account isn't exposed on the public internet. Creating private endpoints can limit exposure of Cognitive Services account."
  query       = query.cognitive_account_public_network_access_disabled

  tags = merge(local.regulatory_compliance_cognitiveservice_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "cognitive_account_restrict_public_access" {
  title       = "Cognitive Services accounts should restrict network access"
  description = "Network access to Cognitive Services accounts should be restricted. Configure network rules so only applications from allowed networks can access the Cognitive Services account. To allow connections from specific internet or on-premises clients, access can be granted to traffic from specific Azure virtual networks or to public internet IP address ranges."
  query       = query.cognitive_account_restrict_public_access

  tags = merge(local.regulatory_compliance_cognitiveservice_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "cognitive_account_encrypted_with_cmk" {
  title       = "Cognitive Services accounts should enable data encryption with a customer-managed key"
  description = "Customer-managed keys are commonly required to meet regulatory compliance standards. Customer-managed keys enable the data stored in Cognitive Services to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management."
  query       = query.cognitive_account_encrypted_with_cmk

  tags = merge(local.regulatory_compliance_cognitiveservice_common_tags, {
    fedramp_high          = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

query "cognitive_service_local_auth_disabled" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when disable_local_auth then 'ok'
        else 'alarm'
      end as status,
      case
        when disable_local_auth then a.name || ' account local authentication enabled.'
        else a.name || ' account local authentication disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_cognitive_account a,
      azure_subscription sub
    where
      sub.subscription_id = a.subscription_id
    ${replace(local.resource_group_filter_qualifier_sql, "__QUALIFIER__", "a.")};
  EOQ
}

query "cognitive_account_private_link_used" {
  sql = <<-EOQ
    with cognitive_account as (
      select
        distinct a.id
      from
        azure_cognitive_account as a,
        jsonb_array_elements(capabilities ) as c
      where
        c ->> 'name' = 'VirtualNetworks'
    ),
    cognitive_account_connections as (
      select
        distinct a.id
      from
        cognitive_account as a
        left join azure_cognitive_account as b on a.id = b.id,
        jsonb_array_elements(private_endpoint_connections ) as c
      where
        c -> 'PrivateLinkServiceConnectionState' ->> 'status' = 'Approved'
    )
    select
      b.id as resource,
      case
        when jsonb_array_length(b.private_endpoint_connections) = 0 then 'info'
        when c.id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when jsonb_array_length(b.private_endpoint_connections) = 0 then b.name || ' no private link exists.'
        when c.id is not null then b.name || ' uses private link.'
        else b.name || ' not uses private link.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "b.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_cognitive_account as b
      left join cognitive_account_connections as c on b.id = c.id,
      azure_subscription as sub
    where
      sub.subscription_id = b.subscription_id;
  EOQ
}

query "cognitive_account_public_network_access_disabled" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when public_network_access = 'Enabled' then 'alarm'
        else 'ok'
      end as status,
      case
        when public_network_access = 'Enabled' then name || ' public network access enabled.'
        else name || ' public network access disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_cognitive_account as s,
      azure_subscription as sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}

query "cognitive_account_restrict_public_access" {
  sql = <<-EOQ
    with account_with_public_access_restricted as (
      select
        a.id
      from
        azure_cognitive_account as a,
        jsonb_array_elements(capabilities) as c
      where
        c ->> 'name' = 'VirtualNetworks' and network_acls ->> 'defaultAction' <> 'Deny'
    )
    select
      distinct a.name as resource,
      case
        when b.id is not null then 'alarm'
        else 'ok'
      end as status,
      case
        when b.id is not null then a.name || ' publicly accessible.'
        else a.name || ' publicly not accessible.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_cognitive_account as a
      left join account_with_public_access_restricted as b on a.id = b.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "cognitive_account_encrypted_with_cmk" {
  sql = <<-EOQ
    with cognitive_account_cmk as (
      select
        distinct a.id
      from
        azure_cognitive_account as a,
        jsonb_array_elements(capabilities ) as c
      where
        c ->> 'name' = 'CustomerManagedKey'
    )
    select
      s.id as resource,
      case
        when c.id is null then 'ok'
        when c.id is not null and encryption ->> 'keySource' = 'Microsoft.KeyVault' then 'ok'
        else 'alarm'
      end as status,
      case
        when c.id is null then name || ' encryption not supported.'
        when c.id is not null and encryption ->> 'keySource' = 'Microsoft.KeyVault' then name || ' encrypted with CMK.'
        else name || ' not encrypted with CMK.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_cognitive_account as s
      left join cognitive_account_cmk as c on c.id = s.id,
      azure_subscription as sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}
