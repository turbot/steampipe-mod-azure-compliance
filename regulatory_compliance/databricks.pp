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

control "databricks_workspace_diagnostic_log_delivery_configured" {
  title         = "Ensure that diagnostic log delivery is configured for Azure Databricks"
  description   = "Azure Databricks Diagnostic Logging provides insights into system operations, user activities, and security events within a Databricks workspace."
  query         = query.databricks_workspace_diagnostic_log_delivery_configured

  tags = local.regulatory_compliance_databricks_common_tags
}

control "databricks_workspace_no_public_ip_enabled" {
  title         = "Ensure 'No Public IP' is set to 'Enabled'"
  description   = "Enable secure cluster connectivity (also known as no public IP) on Azure Databricks workspaces to ensure that clusters do not have public IP addresses and communicate with the control plane over a secure connection."
  query         = query.databricks_workspace_no_public_ip_enabled

  tags = local.regulatory_compliance_databricks_common_tags
}

control "databricks_workspace_public_network_access_disabled" {
  title         = "Ensure 'Allow Public Network Access' is set to 'Disabled'"
  description   = "Disable public network access to prevent exposure to the internet and reduce the risk of unauthorized access. Use private endpoints to securely manage access within trusted networks."
  query         = query.databricks_workspace_public_network_access_disabled

  tags = local.regulatory_compliance_databricks_common_tags
}

control "databricks_workspace_uses_private_endpoint" {
  title         = "Ensure private endpoints are used to access Azure Databricks workspaces"
  description   = "Use private endpoints for Azure Databricks workspaces to allow clients and services to securely access data located over a network via an encrypted Private Link. To do this, the private endpoint uses an IP address from the VNet for each service. Network traffic between disparate services securely traverses encrypted over the VNet. This VNet can also link addressing space, extending your network and accessing resources on it. Similarly, it can be a tunnel through public networks to connect remote infrastructures together. This creates further security through segmenting network traffic and preventing outside sources from accessing it."
  query         = query.databricks_workspace_uses_private_endpoint

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
      azure_databricks_workspace as a
      left join azure_subscription as sub on sub.subscription_id = a.subscription_id;
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
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_databricks_workspace as a
      left join databricks_subnets_without_nsg as nsg on nsg.id = a.id
      left join azure_subscription as sub on sub.subscription_id = a.subscription_id;
  EOQ
}

query "databricks_workspace_diagnostic_log_delivery_configured" {
  sql = <<-EOQ
    with diagnostic_settings_analysis as (
      select
        distinct id,
        (select count(*) from jsonb_array_elements(diagnostic_settings) as ds where ds -> 'properties' -> 'logs' @> '[{"category": "clusters", "enabled": true}]') as clusters_logs_enabled,
        (select count(*) from jsonb_array_elements(diagnostic_settings) as ds where ds -> 'properties' -> 'logs' @> '[{"category": "accounts", "enabled": true}]') as accounts_logs_enabled,
        (select count(*) from jsonb_array_elements(diagnostic_settings) as ds where ds -> 'properties' -> 'logs' @> '[{"category": "jobs", "enabled": true}]') as jobs_logs_enabled,
        (select count(*) from jsonb_array_elements(diagnostic_settings) as ds where ds -> 'properties' -> 'logs' @> '[{"category": "notebook", "enabled": true}]') as notebook_logs_enabled,
        (select count(*) from jsonb_array_elements(diagnostic_settings) as ds where ds -> 'properties' -> 'logs' @> '[{"category": "workspace", "enabled": true}]') as workspace_logs_enabled,
        (select count(*) from jsonb_array_elements(diagnostic_settings) as ds where ds -> 'properties' -> 'logs' @> '[{"category": "sqlPermissions", "enabled": true}]') as sqlpermissions_logs_enabled
      from
        azure_databricks_workspace
      where
        diagnostic_settings is not null and jsonb_array_length(diagnostic_settings) > 0
    )
    select
      w.id as resource,
      case
        when w.sku ->> 'name' in ('standard', 'trial') then 'skip'
        when w.diagnostic_settings is null or jsonb_array_length(w.diagnostic_settings) = 0  then 'alarm'
        when dsa.clusters_logs_enabled = 0 then 'alarm'
        when dsa.accounts_logs_enabled = 0 then 'alarm'
        when dsa.jobs_logs_enabled = 0 then 'alarm'
        when dsa.notebook_logs_enabled = 0 then 'alarm'
        when dsa.workspace_logs_enabled = 0 then 'alarm'
        when dsa.sqlpermissions_logs_enabled = 0 then 'alarm'
        else 'ok'
      end as status,
      case
        when w.sku ->> 'name' in ('standard', 'trial') then w.name || ' is on the ' || (w.sku -> 'name') || ' pricing tier.'
        when w.diagnostic_settings is null or jsonb_array_length(w.diagnostic_settings) = 0 then w.name || ' has no diagnostic settings configured.'
        when dsa.clusters_logs_enabled = 0 then w.name || ' diagnostic logging is missing required category: clusters.'
        when dsa.accounts_logs_enabled = 0 then w.name || ' diagnostic logging is missing required category: accounts.'
        when dsa.jobs_logs_enabled = 0 then w.name || ' diagnostic logging is missing required category: jobs.'
        when dsa.notebook_logs_enabled = 0 then w.name || ' diagnostic logging is missing required category: notebook.'
        when dsa.workspace_logs_enabled = 0 then w.name || ' diagnostic logging is missing required category: workspace.'
        when dsa.sqlpermissions_logs_enabled = 0 then w.name || ' diagnostic logging is missing required category: sqlPermissions.'
        else w.name || ' diagnostic logging is properly configured with required categories and destinations.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "w.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "w.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_databricks_workspace as w
      left join diagnostic_settings_analysis as dsa on dsa.id = w.id
      left join azure_subscription as sub on sub.subscription_id = w.subscription_id;
  EOQ
}

query "databricks_workspace_no_public_ip_enabled" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when (parameters -> 'enableNoPublicIp' -> 'value')::bool then 'ok'
        else 'alarm'
      end as status,
      case
        when (parameters -> 'enableNoPublicIp' -> 'value')::bool then a.name || ' no public IP enabled.'
        else a.name || ' no public IP disabled.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_databricks_workspace as a
      left join azure_subscription as sub on sub.subscription_id = a.subscription_id;
  EOQ
}

query "databricks_workspace_public_network_access_disabled" {
  sql = <<-EOQ
    select
      w.id as resource,
      case
        when public_network_access = 'Disabled' then 'ok'
        else 'alarm'
      end as status,
      case
        when public_network_access = 'Enabled' then name || ' public network access disabled.'
        else name || ' public network access enabled.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "w.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "w.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_databricks_workspace as w
      left join azure_subscription sub on sub.subscription_id = w.subscription_id;
  EOQ
}

query "databricks_workspace_uses_private_endpoint" {
  sql = <<-EOQ
    with databricks_workspace_connection as (
      select
        distinct a.id
      from
        azure_databricks_workspace as a,
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
        when c.id is null then a.title || ' not uses private endpoint.'
        else a.title || ' uses private endpoint.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_databricks_workspace as a
      left join databricks_workspace_connection as c on c.id = a.id
      left join azure_subscription sub on a.subscription_id = sub.subscription_id;
  EOQ
}