locals {
  regulatory_compliance_databricks_common_tags = {
    service = "Azure/Databricks"
  }
}

control "databricks_workspace_deployed_in_custom_vnet" {
  title       = "Databricks workspaces should be deployed in a customer-managed virtual network"
  description = "Databricks workspaces should be deployed in a customer-managed virtual network to ensure that the workspace is not accessible from the public internet."
  query       = query.databricks_workspace_deployed_in_custom_vnet

  tags = local.regulatory_compliance_databricks_common_tags
}

control "databricks_workspace_subnet_with_nsg_configured" {
  title         = "Ensure that network security groups are configured for Databricks subnets"
  description   = "Network Security Groups (NSGs) should be implemented to control inbound and outbound traffic to Azure Databricks subnets, ensuring only authorized communication."
  query         = query.databricks_workspace_subnet_with_nsg_configured

  tags = local.regulatory_compliance_databricks_common_tags
}

query "databricks_workspace_deployed_in_custom_vnet" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when parameters -> 'customVirtualNetworkId' is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when parameters -> 'customVirtualNetworkId' is not null then a.name || ' is deployed in a customer-managed virtual network.'
        else a.name || ' is not deployed in a customer-managed virtual network.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_databricks_workspace as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

control "databricks_workspace_cmk_configured" {
  title       = "Databricks workspaces should have a customer-managed key configured"
  description = "Databricks workspaces should have a customer-managed key configured to encrypt data at rest."
  query       = query.databricks_workspace_cmk_configured

  tags = local.regulatory_compliance_databricks_common_tags
}

query "databricks_workspace_cmk_configured" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when parameters -> 'customerManagedKeyId' is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when parameters -> 'customerManagedKeyId' is not null then a.name || ' has a customer-managed key configured.'
        else a.name || ' does not have a customer-managed key configured.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_databricks_workspace as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "databricks_workspace_subnet_with_nsg_configured" {
  sql = <<-EOQ
    with databricks_subnets as (
      select
        id,
        'private' as subnet_type,
        concat(parameters -> 'customVirtualNetworkId' ->> 'value', '/subnets/', parameters -> 'customPrivateSubnetName' ->> 'value') as subnet_id
      from
        azure_databricks_workspace
      where
        parameters -> 'customVirtualNetworkId' IS NOT NULL
        and parameters -> 'customPrivateSubnetName' ->> 'value' IS NOT NULL
      UNION ALL
      select
        id,
        'public' as subnet_type,
        concat(parameters -> 'customVirtualNetworkId' ->> 'value', '/subnets/', parameters -> 'customPublicSubnetName' ->> 'value') as subnet_id
      from
        azure_databricks_workspace
      where
        parameters -> 'customVirtualNetworkId' IS NOT NULL
        and parameters -> 'customPublicSubnetName' ->> 'value' IS NOT NULL
    ), databricks_subnets_without_nsg as (
      select
        distinct ds.id,
        network_security_group_id
      from
        azure_subnet as s
        right join databricks_subnets as ds on lower(s.id) = lower(ds.subnet_id)
      where
        s.network_security_group_id is null
    )
    select
      a.id as resource,
      case
        when parameters -> 'customVirtualNetworkId' is null then 'skip'
        when nsg.id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when parameters -> 'customVirtualNetworkId' is null then a.name || ' is not deployed in a customer-managed virtual network.'
        when nsg.id is null then a.name || ' subnets are configured with network security group.'
        else a.name || ' subnets are not configured with network security group.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_databricks_workspace as a
      left join databricks_subnets_without_nsg as nsg on nsg.id = a.id
      left join azure_subscription as sub on sub.subscription_id = a.subscription_id;
  EOQ
}
