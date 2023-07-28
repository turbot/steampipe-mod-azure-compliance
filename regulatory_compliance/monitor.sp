locals {
  regulatory_compliance_monitor_common_tags = {
    service = "Azure/Monitor"
  }
}

control "monitor_log_profile_enabled_for_all_categories" {
  title       = "Azure Monitor log profile should collect logs for categories 'write,' 'delete,' and 'action'"
  description = "This policy ensures that a log profile collects logs for categories 'write,' 'delete,' and 'action'."
  query       = query.monitor_log_profile_enabled_for_all_categories

  tags = merge(local.regulatory_compliance_monitor_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "monitor_log_alert_for_administrative_operations" {
  title       = "An activity log alert should exist for specific Administrative operations"
  description = "This policy audits specific Administrative operations with no activity log alerts configured."
  query       = query.monitor_log_alert_for_administrative_operations

  tags = merge(local.regulatory_compliance_monitor_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "monitor_log_profile_enabled_for_all_regions" {
  title       = "Azure Monitor should collect activity logs from all regions"
  description = "This policy audits the Azure Monitor log profile which does not export activities from all Azure supported regions including global."
  query       = query.monitor_log_profile_enabled_for_all_regions

  tags = merge(local.regulatory_compliance_monitor_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "audit_diagnostic_setting" {
  title       = "Audit diagnostic setting for selected resource types"
  description = "Audit diagnostic setting for selected resource types. Be sure to select only resource types which support diagnostics settings."
  query       = query.manual_control_hipaa

  tags = merge(local.regulatory_compliance_monitor_common_tags, {
    hipaa_hitrust_v92 = "true"
    pci_dss_v321      = "true"
  })
}

control "monitor_log_cluster_infrastructure_encryption_enabled" {
  title       = "Azure Monitor Logs clusters should be created with infrastructure-encryption enabled (double encryption)"
  description = "To ensure secure data encryption is enabled at the service level and the infrastructure level with two different encryption algorithms and two different keys, use an Azure Monitor dedicated cluster. This option is enabled by default when supported at the region, see https://docs.microsoft.com/azure/azure-monitor/platform/customer-managed-keys#customer-managed-key-overview."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_monitor_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "monitor_log_analytics_workspace_integrated_with_encrypted_storage_account" {
  title       = "Saved-queries in Azure Monitor should be saved in customer storage account for logs encryption"
  description = "Link storage account to Log Analytics workspace to protect saved-queries with storage account encryption. Customer-managed keys are commonly required to meet regulatory compliance and for more control over the access to your saved-queries in Azure Monitor. For more details on the above, see https://docs.microsoft.com/azure/azure-monitor/platform/customer-managed-keys?tabs=portal#customer-managed-key-for-saved-queries."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_monitor_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "monitor_log_cluster_encrypted_with_cmk" {
  title       = "Azure Monitor Logs clusters should be encrypted with customer-managed key"
  description = "Create Azure Monitor logs cluster with customer-managed keys encryption. By default, the log data is encrypted with service-managed keys, but customer-managed keys are commonly required to meet regulatory compliance. Customer-managed key in Azure Monitor gives you more control over the access to you data, see https://docs.microsoft.com/azure/azure-monitor/platform/customer-managed-keys."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_monitor_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

query "monitor_log_profile_enabled_for_all_categories" {
  sql = <<-EOQ
    select
      p.id as resource,
      case
        when p.categories @> '["Write", "Action", "Delete"]' then 'ok'
        else 'alarm'
      end as status,
      case
        when p.categories @> '["Write", "Action", "Delete"]' then p.name || ' collects logs for categories write, delete and action'
        else p.name || ' does not collects logs for all categories.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "p.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_log_profile as p
      left join azure_subscription sub on sub.subscription_id = p.subscription_id;
  EOQ
}

query "monitor_log_alert_for_administrative_operations" {
  sql = <<-EOQ
    with alert_rule as (
      select
        alert.id as alert_id,
        alert.name as alert_name,
        alert.enabled,
        alert.location,
        alert.subscription_id
      from
        azure_log_alert as alert,
        jsonb_array_elements_text(scopes) as sc
      where
        alert.location = 'global'
        and alert.enabled
        and sc = '/subscriptions/' || alert.subscription_id
        and alert.condition -> 'allOf' @> '[{"equals":"Administrative","field":"category"}]'
        and (
          alert.condition -> 'allOf' @> '[{"field": "operationName", "equals": "Microsoft.Sql/servers/firewallRules/write"}]'
          or alert.condition -> 'allOf' @> '[{"field": "operationName", "equals": "Microsoft.Sql/servers/firewallRules/delete"}]'
          or alert.condition -> 'allOf' @> '[{"field": "operationName", "equals": "Microsoft.Network/networkSecurityGroups/write"}]'
          or alert.condition -> 'allOf' @> '[{"field": "operationName", "equals": "Microsoft.Network/networkSecurityGroups/delete"}]'
          or alert.condition -> 'allOf' @> '[{"field": "operationName", "equals": "Microsoft.ClassicNetwork/networkSecurityGroups/write"}]'
          or alert.condition -> 'allOf' @> '[{"field": "operationName", "equals": "Microsoft.ClassicNetwork/networkSecurityGroups/delete"}]'
          or alert.condition -> 'allOf' @> '[{"field": "operationName", "equals": "Microsoft.Network/networkSecurityGroups/securityRules/write"}]'
          or alert.condition -> 'allOf' @> '[{"field": "operationName", "equals": "Microsoft.Network/networkSecurityGroups/securityRules/delete"}]'
          or alert.condition -> 'allOf' @> '[{"field": "operationName", "equals": "Microsoft.ClassicNetwork/networkSecurityGroups/securityRules/write"}]'
          or alert.condition -> 'allOf' @> '[{"field": "operationName", "equals": "Microsoft.ClassicNetwork/networkSecurityGroups/securityRules/delete"}]'
          )
      limit 1
    )
    select
      sub.subscription_id as resource,
      case
        when count(a.subscription_id) > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when count(a.subscription_id) > 0 then 'Activity log alert exists for administrative operations.'
        else 'Activity log alert does not exists for administrative operations.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_subscription sub
      left join alert_rule a on sub.subscription_id = a.subscription_id
    group by
      sub._ctx,
      sub.subscription_id,
      sub.display_name;
  EOQ
}

query "monitor_log_profile_enabled_for_all_regions" {
  sql = <<-EOQ
    select
      p.id as resource,
      case
        when p.log_event_location @> '["global", "australiacentral", "australiacentral2", "australiaeast", "australiasoutheast", "brazilsouth", "brazilsoutheast", "canadacentral", "canadaeast", "centralindia", "centralus", "eastasia", "eastus", "eastus2", "francecentral", "francesouth","germanynorth", "germanywestcentral", "japaneast", "japanwest", "jioindiawest", "koreacentral", "koreasouth", "northcentralus", "northeurope",
        "norwayeast", "norwaywest", "southafricanorth", "southafricawest", "southcentralus", "southeastasia", "southindia", "switzerlandnorth", "switzerlandwest", "uaecentral", "uaenorth", "uksouth", "ukwest", "westcentralus", "westeurope", "westindia", "westus", "westus2", "westus3"]' then 'ok'
        else 'alarm'
      end as status,
      case
        when p.log_event_location @> '["global", "australiacentral", "australiacentral2", "australiaeast", "australiasoutheast", "brazilsouth", "brazilsoutheast", "canadacentral", "canadaeast", "centralindia", "centralus", "eastasia", "eastus", "eastus2", "francecentral", "francesouth","germanynorth", "germanywestcentral", "japaneast", "japanwest", "jioindiawest", "koreacentral", "koreasouth", "northcentralus", "northeurope",
        "norwayeast", "norwaywest", "southafricanorth", "southafricawest", "southcentralus", "southeastasia", "southindia", "switzerlandnorth", "switzerlandwest", "uaecentral", "uaenorth", "uksouth", "ukwest", "westcentralus", "westeurope", "westindia", "westus", "westus2", "westus3"]' then p.name || ' collect activity logs from all regions.'
        else p.name || ' not collect activity logs from all regions.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "p.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_log_profile as p
      left join azure_subscription sub on sub.subscription_id = p.subscription_id;
  EOQ
}

query "monitor_application_insights_configured" {
  sql = <<-EOQ
    with application_insights as (
      select
        subscription_id,
        count(*) as no_application_insight
      from
        azure_application_insight
      group by
        subscription_id
    )
    select
      sub.id as resource,
      case
        when i.subscription_id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when i.subscription_id is null then sub.display_name || ' does not have application insights configured.'
        else sub.display_name || ' has ' || no_application_insight || ' application insights configured.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_subscription as sub
      left join application_insights as i on i.subscription_id = sub.subscription_id;
  EOQ
}

query "monitor_diagnostic_settings_captures_proper_categories" {
  sql = <<-EOQ
    with enabled_settings as (
      select
        name,
        id,
        _ctx,
        resource_group,
        subscription_id,
        count(*) filter (where l ->> 'enabled' = 'true'
          and l ->> 'category' in ('Administrative', 'Security', 'Alert', 'Policy')
        ) as valid_category_count,
        string_agg(l ->> 'category', ', ') filter (where l ->> 'enabled' = 'true'
          and l ->> 'category' in ('Administrative', 'Security', 'Alert', 'Policy')
        ) as valid_categories
      from
        azure_diagnostic_setting,
        jsonb_array_elements(logs) as l
      group by
        name,
        id,
        _ctx,
        resource_group,
        subscription_id
    )
    select
      sett.id as resource,
      case
        when valid_category_count = 4 then 'ok'
        else 'alarm'
      end as status,
      case
        when valid_category_count = 4
          then name || ' logs enabled for required categories administrative, security, alert and policy.'
        when valid_category_count > 0
          then sett.name || ' logs enabled for ' || valid_categories || ' categories.'
          else sett.name || ' logs not enabled for categories administrative, security, alert and policy.'
      end as reason
      ${replace(local.common_dimensions_global_qualifier_sql, "__QUALIFIER__", "sett.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      enabled_settings sett,
      azure_subscription sub
    where
      sub.subscription_id = sett.subscription_id;
  EOQ
}

query "monitor_log_alert_create_policy_assignment" {
  sql = <<-EOQ
    with alert_rule as (
      select
        alert.id as alert_id,
        alert.name as alert_name,
        alert.enabled,
        alert.location,
        alert.subscription_id
      from
        azure_log_alert as alert,
        jsonb_array_elements_text(scopes) as sc
      where
        alert.location = 'global'
        and alert.enabled
        and sc = '/subscriptions/' || alert.subscription_id
        and alert.condition -> 'allOf' @> '[{"equals":"Administrative","field":"category"}]'
        and alert.condition -> 'allOf' @> '[{"field": "operationName", "equals": "Microsoft.Authorization/policyAssignments/write"}]'
      limit 1
    )
    select
      a.subscription_id as resource,
      case
        when count(a.subscription_id) > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when count(a.subscription_id) > 0 then 'Activity log alert exists for create policy assignment event.'
        else 'Activity log alert does not exists for create policy assignment event.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_subscription sub
      left join alert_rule a on sub.subscription_id = a.subscription_id
    group by
      a.subscription_id,
      sub.subscription_id,
      sub._ctx,
      sub.display_name;
  EOQ
}

query "monitor_log_alert_create_update_nsg_rule" {
  sql = <<-EOQ
    with alert_rule as (
      select
        alert.id as alert_id,
        alert.name as alert_name,
        alert.enabled,
        alert.location,
        alert.subscription_id
      from
        azure_log_alert as alert,
        jsonb_array_elements_text(scopes) as sc
      where
        alert.location = 'global'
        and alert.enabled
        and sc = '/subscriptions/' || alert.subscription_id
        and (
          (
            alert.condition -> 'allOf' @> '[{"equals":"Administrative","field":"category"}]'
            and alert.condition -> 'allOf' @> '[{"field": "operationName", "equals": "Microsoft.Network/networksecuritygroups/securityrules/write"}]'
          )
          or
          (
            alert.condition -> 'allOf' @> '[{"equals":"Administrative","field":"category"}]'
            and alert.condition -> 'allOf' @> '[{"field": "resourceType", "equals": "microsoft.network/networksecuritygroups/securityrules"}]'
            and jsonb_array_length(alert.condition -> 'allOf') = 2
          )
        )
      limit 1
    )
    select
      sub.subscription_id as resource,
      case
        when count(a.subscription_id) > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when count(a.subscription_id) > 0 then 'Activity log alert exists for create or update Network Security Group Rule event.'
        else 'Activity log alert does not exists for create or update Network Security Group Rule event.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_subscription sub
      left join alert_rule a on sub.subscription_id = a.subscription_id
    group by
      sub._ctx,
      sub.subscription_id,
      sub.display_name;
  EOQ
}

query "monitor_log_alert_create_update_nsg" {
  sql = <<-EOQ
    with alert_rule as (
      select
        alert.id as alert_id,
        alert.name as alert_name,
        alert.enabled,
        alert.location,
        alert.subscription_id
      from
        azure_log_alert as alert,
        jsonb_array_elements_text(scopes) as sc
      where
        alert.location = 'global'
        and alert.enabled
        and sc = '/subscriptions/' || alert.subscription_id
        and (
          (
            alert.condition -> 'allOf' @> '[{"equals":"Administrative","field":"category"}]'
            and alert.condition -> 'allOf' @> '[{"field": "operationName", "equals": "Microsoft.Network/networkSecurityGroups/write"}]'
          )
          or
          (
            alert.condition -> 'allOf' @> '[{"equals":"Administrative","field":"category"}]'
            and alert.condition -> 'allOf' @> '[{"field": "resourceType", "equals": "microsoft.network/networksecuritygroups"}]'
            and jsonb_array_length(alert.condition -> 'allOf') = 2
          )
        )
      limit 1
    )
    select
      sub.subscription_id as resource,
      case
        when count(a.subscription_id) > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when count(a.subscription_id) > 0 then 'Activity log alert exists for create or update Network Security Group event.'
        else 'Activity log alert does not exists for create or update Network Security Group event.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_subscription sub
      left join alert_rule a on sub.subscription_id = a.subscription_id
    group by
      sub._ctx,
      sub.subscription_id,
      sub.display_name;
  EOQ
}

query "monitor_log_alert_create_update_public_ip_address" {
  sql = <<-EOQ
    with alert_rule as
    (
      select
        alert.id as alert_id,
        alert.name as alert_name,
        alert.enabled,
        alert.location,
        alert.subscription_id
      from
        azure_log_alert as alert,
        jsonb_array_elements_text(scopes) as sc
      where
        alert.location = 'global'
        and alert.enabled
        and sc = '/subscriptions/' || alert.subscription_id
        and
        (
          ( alert.condition -> 'allOf' @> '[{"equals":"Administrative","field":"category"}]'
            and alert.condition -> 'allOf' @> '[{"field": "operationName", "equals": "Microsoft.Network/publicIPAddresses/write"}]'
          )
          or
          (
            alert.condition -> 'allOf' @> '[{"equals":"Administrative","field":"category"}]'
            and alert.condition -> 'allOf' @> '[{"field": "resourceType", "equals": "microsoft.network/publicipaddresses"}]'
            and jsonb_array_length(alert.condition -> 'allOf') = 2
          )
        )
        limit 1
    )
    select
      sub.subscription_id as resource,
      case
        when count(a.subscription_id) > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when count(a.subscription_id) > 0 then 'Activity Log Alert exists for Create or Update Public IP Address rule.'
        else 'Activity Log Alert does not exists for Create or Update Public IP Address rule.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_subscription sub
      left join alert_rule a on sub.subscription_id = a.subscription_id
    group by
      sub._ctx,
      sub.subscription_id,
      sub.display_name;
  EOQ
}

query "monitor_log_alert_create_update_security_solution" {
  sql = <<-EOQ
    with alert_rule as (
      select
        alert.id as alert_id,
        alert.name as alert_name,
        alert.enabled,
        alert.location,
        alert.subscription_id
      from
        azure_log_alert as alert,
        jsonb_array_elements_text(scopes) as sc
      where
        alert.location = 'global'
        and alert.enabled
        and sc = '/subscriptions/' || alert.subscription_id
        and (
          (
            alert.condition -> 'allOf' @> '[{"equals":"Security","field":"category"}]'
            and alert.condition -> 'allOf' @> '[{"field": "operationName", "equals": "Microsoft.Security/securitySolutions/write"}]'
          )
          or
          (
            alert.condition -> 'allOf' @> '[{"equals":"Security","field":"category"}]'
            and alert.condition -> 'allOf' @> '[{"field": "resourceType", "equals": "microsoft.security/securitysolutions"}]'
            and jsonb_array_length(alert.condition -> 'allOf') = 2
          )
        )
      limit 1
    )
    select
      sub.subscription_id as resource,
      case
        when count(a.subscription_id) > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when count(a.subscription_id) > 0 then 'Activity log alert exists for create or update Security Solution event.'
        else 'Activity log alert does not exists for create or update Security Solution event.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_subscription sub
      left join alert_rule a on sub.subscription_id = a.subscription_id
    group by
      sub._ctx,
      sub.subscription_id,
      sub.display_name;
  EOQ
}

query "monitor_log_alert_create_update_sql_servers_firewall_rule" {
  sql = <<-EOQ
    with alert_rule as
    (
      select
        alert.id as alert_id,
        alert.name as alert_name,
        alert.enabled,
        alert.location,
        alert.subscription_id
      from
        azure_log_alert as alert,
        jsonb_array_elements_text(scopes) as sc
      where
        alert.location = 'global'
        and alert.enabled
        and sc = '/subscriptions/' || alert.subscription_id
        and
        (
          ( alert.condition -> 'allOf' @> '[{"equals":"Administrative","field":"category"}]'
          and alert.condition -> 'allOf' @> '[{"field": "operationName", "equals": "Microsoft.Sql/servers/firewallRules/write"}]'
          )
          or
          (
            alert.condition -> 'allOf' @> '[{"equals":"Administrative","field":"category"}]'
            and alert.condition -> 'allOf' @> '[{"field": "resourceType", "equals": "microsoft.sql/servers/firewallrules"}]'
            and jsonb_array_length(alert.condition -> 'allOf') = 2
          )
        )
        limit 1
    )
    select
      sub.subscription_id as resource,
      case
        when count(a.subscription_id) > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when count(a.subscription_id) > 0 then 'Activity Log Alert exists for Create or Update SQL Server Firewall Rule.'
        else 'Activity Log Alert does not exists for Create or Update SQL Server Firewall Rule.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_subscription sub
      left join alert_rule a on sub.subscription_id = a.subscription_id
    group by
      sub._ctx,
      sub.subscription_id,
      sub.display_name;
  EOQ
}

query "monitor_log_alert_delete_nsg_rule" {
  sql = <<-EOQ
    with alert_rule as (
      select
        alert.id as alert_id,
        alert.name as alert_name,
        alert.enabled,
        alert.location,
        alert.subscription_id
      from
        azure_log_alert as alert,
        jsonb_array_elements_text(scopes) as sc
      where
        alert.location = 'global'
        and alert.enabled
        and sc = '/subscriptions/' || alert.subscription_id
        and (
          (
            alert.condition -> 'allOf' @> '[{"equals":"Administrative","field":"category"}]'
            and alert.condition -> 'allOf' @> '[{"field": "operationName", "equals": "Microsoft.Network/networksecuritygroups/securityrules/delete"}]'
          )
          or
          (
            alert.condition -> 'allOf' @> '[{"equals":"Administrative","field":"category"}]'
            and alert.condition -> 'allOf' @> '[{"field": "resourceType", "equals": "microsoft.network/networksecuritygroups/securityrules"}]'
            and jsonb_array_length(alert.condition -> 'allOf') = 2
          )
        )
      limit 1
    )
    select
      sub.subscription_id as resource,
      case
        when count(a.subscription_id) > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when count(a.subscription_id) > 0 then 'Activity log alert exists for delete Network Security Group Rule event.'
        else 'Activity log alert does not exists for delete Network Security Group Rule event.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_subscription sub
      left join alert_rule a on sub.subscription_id = a.subscription_id
    group by
      sub._ctx,
      sub.subscription_id,
      sub.display_name;
  EOQ
}

query "monitor_log_alert_delete_nsg" {
  sql = <<-EOQ
    with alert_rule as (
      select
        alert.id as alert_id,
        alert.name as alert_name,
        alert.enabled,
        alert.location,
        alert.subscription_id,
        jsonb_array_length(alert.condition -> 'allOf')
      from
        azure_log_alert as alert,
        jsonb_array_elements_text(scopes) as sc
      where
        alert.location = 'global'
        and alert.enabled
        and sc = '/subscriptions/' || alert.subscription_id
        and (
          (
            alert.condition -> 'allOf' @> '[{"equals":"Administrative","field":"category"}]'
            and alert.condition -> 'allOf' @> '[{"field": "operationName", "equals": "Microsoft.Network/networkSecurityGroups/delete"}]'
          )
          or
          (
            alert.condition -> 'allOf' @> '[{"equals":"Administrative","field":"category"}]'
            and alert.condition -> 'allOf' @> '[{"field": "resourceType", "equals": "microsoft.network/networksecuritygroups"}]'
            and jsonb_array_length(alert.condition -> 'allOf') = 2
          )
        )
      limit 1
    )
      select
        sub.subscription_id as resource,
        case
          when count(a.subscription_id) > 0 then 'ok'
          else 'alarm'
        end as status,
        case
          when count(a.subscription_id) > 0 then 'Activity log alert exists for delete Network Security Group event.'
          else 'Activity log alert does not exists for delete Network Security Group event.'
        end as reason
        ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub.")}
        ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
      from
        azure_subscription sub
        left join alert_rule a on sub.subscription_id = a.subscription_id
      group by
        sub._ctx,
        sub.subscription_id,
        sub.display_name;
  EOQ
}

query "monitor_log_alert_delete_policy_assignment" {
  sql = <<-EOQ
    with alert_rule as (
      select
        alert.id as alert_id,
        alert.name as alert_name,
        alert.enabled,
        alert.location,
        alert.subscription_id
      from
        azure_log_alert as alert,
        jsonb_array_elements_text(scopes) as sc
      where
        alert.location = 'global'
        and alert.enabled
        and sc = '/subscriptions/' || alert.subscription_id
        and alert.condition -> 'allOf' @> '[{"equals":"Administrative","field":"category"}]'
        and alert.condition -> 'allOf' @> '[{"field": "operationName", "equals": "Microsoft.Authorization/policyAssignments/delete"}]'
      limit 1
    )
    select
      sub.subscription_id as resource,
      case
        when count(a.subscription_id) > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when count(a.subscription_id) > 0 then 'Activity log alert exists for delete policy assignment event.'
        else 'Activity log alert does not exists for delete policy assignment event.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_subscription sub
      left join alert_rule a on sub.subscription_id = a.subscription_id
    group by
      sub._ctx,
      sub.subscription_id,
      sub.display_name;
  EOQ
}

query "monitor_log_alert_delete_public_ip_address" {
  sql = <<-EOQ
    with alert_rule as(
      select
        alert.id as alert_id,
        alert.name as alert_name,
        alert.enabled,
        alert.location,
        alert.subscription_id
      from
        azure_log_alert as alert,
        jsonb_array_elements_text(scopes) as sc
      where
        alert.location = 'global'
        and alert.enabled
        and sc = '/subscriptions/' || alert.subscription_id
        and
        (
          ( alert.condition -> 'allOf' @> '[{"equals":"Administrative","field":"category"}]'
          and alert.condition -> 'allOf' @> '[{"field": "operationName", "equals": "Microsoft.Network/publicIPAddresses/delete"}]'
          )
          or
          (
            alert.condition -> 'allOf' @> '[{"equals":"Administrative","field":"category"}]'
            and alert.condition -> 'allOf' @> '[{"field": "resourceType", "equals": "microsoft.network/publicipaddresses"}]'
            and jsonb_array_length(alert.condition -> 'allOf') = 2
          )
        )
        limit 1
    )
    select
      sub.subscription_id as resource,
      case
        when count(a.subscription_id) > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when count(a.subscription_id) > 0 then 'Activity Log Alert exists for Delete Public IP Address rule.'
        else 'Activity Log Alert does not exists for Delete Public IP Address rule.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_subscription sub
      left join alert_rule a on sub.subscription_id = a.subscription_id
    group by
      sub._ctx,
      sub.subscription_id,
      sub.display_name;
  EOQ
}

query "monitor_log_alert_delete_security_solution" {
  sql = <<-EOQ
    with alert_rule as (
      select
        alert.id as alert_id,
        alert.name as alert_name,
        alert.enabled,
        alert.location,
        alert.subscription_id
      from
        azure_log_alert as alert,
        jsonb_array_elements_text(scopes) as sc
      where
        alert.location = 'global'
        and alert.enabled
        and sc = '/subscriptions/' || alert.subscription_id
        and (
          (
            alert.condition -> 'allOf' @> '[{"equals":"Security","field":"category"}]'
            and alert.condition -> 'allOf' @> '[{"field": "operationName", "equals": "Microsoft.Security/securitySolutions/delete"}]'
          )
          or
          (
            alert.condition -> 'allOf' @> '[{"equals":"Security","field":"category"}]'
            and alert.condition -> 'allOf' @> '[{"field": "resourceType", "equals": "microsoft.security/securitysolutions"}]'
            and jsonb_array_length(alert.condition -> 'allOf') = 2
          )
        )
      limit 1
    )
    select
      sub.subscription_id as resource,
      case
        when count(a.subscription_id) > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when count(a.subscription_id) > 0 then 'Activity log alert exists for delete Security Solution event.'
        else 'Activity log alert does not exists for delete Security Solution event.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_subscription sub
      left join alert_rule a on sub.subscription_id = a.subscription_id
    group by
      sub._ctx,
      sub.subscription_id,
      sub.display_name;
  EOQ
}

query "monitor_log_alert_delete_sql_servers_firewall_rule" {
  sql = <<-EOQ
    with alert_rule as(
      select
        alert.id as alert_id,
        alert.name as alert_name,
        alert.enabled,
        alert.location,
        alert.subscription_id
      from
        azure_log_alert as alert,
        jsonb_array_elements_text(scopes) as sc
      where
        alert.location = 'global'
        and alert.enabled
        and sc = '/subscriptions/' || alert.subscription_id
        and
        (
          ( alert.condition -> 'allOf' @> '[{"equals":"Administrative","field":"category"}]'
          and alert.condition -> 'allOf' @> '[{"field": "operationName", "equals": "Microsoft.Sql/servers/firewallRules/delete"}]' )
          or
          (
            alert.condition -> 'allOf' @> '[{"equals":"Administrative","field":"category"}]'
            and alert.condition -> 'allOf' @> '[{"field": "resourceType", "equals": "microsoft.sql/servers/firewallrules"}]'
            and jsonb_array_length(alert.condition -> 'allOf') = 2
          )
        )
        limit 1
    )
    select
      sub.subscription_id as resource,
      case
        when count(a.subscription_id) > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when count(a.subscription_id) > 0 then 'Activity Log Alert exists for Delete SQL Server Firewall Rule.'
        else 'Activity Log Alert does not exists for Delete SQL Server Firewall Rule.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_subscription sub
      left join alert_rule a on sub.subscription_id = a.subscription_id
    group by
      sub._ctx,
      sub.subscription_id,
      sub.display_name;
  EOQ
}

query "monitor_log_alert_sql_firewall_rule" {
  sql = <<-EOQ
    with alert_rule as (
      select
        alert.id as alert_id,
        alert.name as alert_name,
        alert.enabled,
        alert.location,
        alert.subscription_id
      from
        azure_log_alert as alert,
        jsonb_array_elements_text(scopes) as sc
      where
        alert.location = 'global'
        and alert.enabled
        and sc = '/subscriptions/' || alert.subscription_id
        and alert.condition -> 'allOf' @> '[{"equals":"Administrative","field":"category"}]'
        and alert.condition -> 'allOf' @> '[{"field": "resourceType", "equals": "microsoft.sql/servers"}]'
        and jsonb_array_length(alert.condition -> 'allOf') = 2
      limit 1
    )
    select
      sub.subscription_id as resource,
      case
        when count(a.subscription_id) > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when count(a.subscription_id) > 0 then 'Activity log alert exists for create, update and delete SQL Server Firewall Rule event.'
        else 'Activity log alert does not exists for create, update and delete SQL Server Firewall Rule event.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_subscription sub
      left join alert_rule a on sub.subscription_id = a.subscription_id
    group by
      sub._ctx,
      sub.subscription_id,
      sub.display_name;
  EOQ
}

query "monitor_logs_storage_container_insights_activity_logs_encrypted_with_byok" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when a.encryption_key_source = 'Microsoft.Keyvault' then 'ok'
        else 'alarm'
      end as status,
      case
        when a.encryption_key_source = 'Microsoft.Keyvault'
          then a.name || ' container insights-activity-logs encrypted with BYOK.'
        else a.name || ' container insights-activity-logs not encrypted with BYOK.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_storage_container c,
      azure_storage_account a,
      azure_subscription sub
    where
      c.name = 'insights-activity-logs'
      and c.account_name = a.name
      and sub.subscription_id = a.subscription_id;
  EOQ
}

query "monitor_logs_storage_container_insights_operational_logs_encrypted_with_byok" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when a.encryption_key_source = 'Microsoft.Keyvault' then 'ok'
        else 'alarm'
      end as status,
      case
        when a.encryption_key_source = 'Microsoft.Keyvault'
          then a.name || ' container insights-operational-logs encrypted with BYOK.'
        else a.name || ' container insights-operational-logs not encrypted with BYOK.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_storage_container c,
      azure_storage_account a,
      azure_subscription sub
    where
      c.name = 'insights-operational-logs'
      and c.account_name = a.name
      and sub.subscription_id = a.subscription_id;
  EOQ
}

query "monitor_logs_storage_container_insights_operational_logs_not_public_accessible" {
  sql = <<-EOQ
    select
      sc.id as resource,
      case
        when public_access != 'None' then 'alarm'
        else 'ok'
      end as status,
      case
        when public_access != 'None'
          then account_name || ' container insights-operational-logs storing activity logs publicly accessible.'
        else account_name || ' container insights-operational-logs storing activity logs not publicly accessible.'
      end as reason
      ${replace(local.common_dimensions_global_qualifier_sql, "__QUALIFIER__", "sc.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_storage_container sc,
      azure_subscription sub
    where
      name = 'insights-operational-logs'
      and sub.subscription_id = sc.subscription_id;
  EOQ
}

query "monitor_logs_storage_container_insights_activity_logs_not_public_accessible" {
  sql = <<-EOQ
    select
      sc.id as resource,
      case
        when public_access != 'None' then 'alarm'
        else 'ok'
      end as status,
      case
        when public_access != 'None'
          then account_name || ' container insights-activity-logs storing activity logs publicly accessible.'
        else account_name || ' container insights-activity-logs storing activity logs not publicly accessible.'
      end as reason
      ${replace(local.common_dimensions_global_qualifier_sql, "__QUALIFIER__", "sc.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_storage_container sc,
      azure_subscription sub
    where
      name = 'insights-activity-logs'
      and sub.subscription_id = sc.subscription_id;
  EOQ
}
