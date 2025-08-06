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
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
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
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_databricks_workspace as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

control "databricks_workspace_user_sync_configured" {
  title       = "Databricks workspaces should have user sync configured"
  description = "Databricks workspaces should have user sync configured to synchronize users and groups from Microsoft Entra ID to Azure Databricks."
  query       = query.databricks_workspace_user_sync_configured

  tags = local.regulatory_compliance_databricks_common_tags
}

query "databricks_workspace_user_sync_configured" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when provisioning_state = 'Failed' then 'alarm'
        else 'ok'
      end as status,
      case
        when provisioning_state = 'Failed' then a.name || ' has a failed provisioning state.'
        else a.name || ' has a successful provisioning state.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_databricks_workspace as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}
