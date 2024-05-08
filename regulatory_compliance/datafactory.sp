locals {
  regulatory_compliance_datafactory_common_tags = {
    service = "Azure/DataFactory"
  }
}

control "data_factory_uses_private_link" {
  title       = "Azure Data Factory should use private link"
  description = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to Azure Data Factory, data leakage risks are reduced."
  query       = query.data_factory_uses_private_link

  tags = merge(local.regulatory_compliance_datafactory_common_tags, {
    nist_sp_800_171_r2   = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "data_factory_encrypted_with_cmk" {
  title       = "Azure data factories should be encrypted with a customer-managed key"
  description = "Use customer-managed keys to manage the encryption at rest of your Azure Data Factory. By default, customer data is encrypted with service-managed keys, but customer-managed keys are commonly required to meet regulatory compliance standards. Customer-managed keys enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management."
  query       = query.data_factory_encrypted_with_cmk

  tags = merge(local.regulatory_compliance_datafactory_common_tags, {
    nist_sp_800_171_r2   = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "data_factory_public_network_access_disabled" {
  title       = "Data factories should disable public network access"
  description = "Disabling public network access improves security by ensuring that your Data Factory is not exposed on the public internet."
  query       = query.data_factory_public_network_access_disabled

  tags = local.regulatory_compliance_datafactory_common_tags
}

control "data_factory_uses_git_repository" {
  title       = "Data factories should use GitHub repository"
  description = "Ensure that Data Factory utilizes a Git repository as its source control mechanism. This control is non-compliant if Data Factory Git repository is not configured."
  query       = query.data_factory_uses_git_repository

  tags = local.regulatory_compliance_datafactory_common_tags
}

query "data_factory_uses_private_link" {
  sql = <<-EOQ
    with data_factory_connection as (
      select
        distinct a.id
      from
        azure_data_factory as a,
        jsonb_array_elements(private_endpoint_connections) as connection
      where
        connection ->> 'PrivateLinkServiceConnectionStateStatus' = 'Approved'
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
      azure_data_factory as a
      left join data_factory_connection as c on c.id = a.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "data_factory_encrypted_with_cmk" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when encryption ->> 'vaultBaseUrl' is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when encryption ->> 'vaultBaseUrl' is not null then a.name || ' encrypted with CMK.'
        else a.name || ' not encrypted with CMK.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_data_factory as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "data_factory_public_network_access_disabled" {
  sql = <<-EOQ
    select
      a.id as resource,
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
      azure_data_factory as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "data_factory_uses_git_repository" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when repo_configuration ->> 'repositoryName' is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when repo_configuration ->> 'repositoryName' is not null then a.name || ' uses git repository.'
        else a.name || ' not uses git repository.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_data_factory as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}
