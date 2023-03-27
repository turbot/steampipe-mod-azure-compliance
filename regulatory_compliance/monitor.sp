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
  title       = "Audit diagnostic setting"
  description = "Audit diagnostic setting for selected resource types."
  query       = query.manual_control_hipaa

  tags = merge(local.regulatory_compliance_monitor_common_tags, {
    hipaa_hitrust_v92 = "true"
    pci_dss_v321      = "true"
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
        alert._ctx,
        alert.subscription_id
      from
        azure_log_alert as alert,
        jsonb_array_elements_text(scopes) as sc
      where
        alert.location = 'Global'
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
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_subscription sub
      left join alert_rule a on sub.subscription_id = a.subscription_id
    group by
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