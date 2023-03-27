locals {
  regulatory_compliance_logic_common_tags = {
    service = "Azure/Logic"
  }
}

control "logic_app_workflow_logging_enabled" {
  title       = "Resource logs in Logic Apps should be enabled"
  description = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes; when a security incident occurs or when your network is compromised."
  query       = query.logic_app_workflow_logging_enabled

  tags = merge(local.regulatory_compliance_logic_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

query "logic_app_workflow_logging_enabled" {
  sql = <<-EOQ
    with logging_details as (
      select
        distinct id as workflow_id
      from
        azure_logic_app_workflow,
        jsonb_array_elements(diagnostic_settings) setting,
        jsonb_array_elements(setting -> 'properties' -> 'logs') log
      where
        diagnostic_settings is not null
        and (
          (
            (log ->> 'enabled') :: boolean
            and (log -> 'retentionPolicy' ->> 'enabled') :: boolean
            and (log -> 'retentionPolicy') :: JSONB ? 'days'
          )
          or
          (
            (log ->> 'enabled') :: boolean
            and (
              log -> 'retentionPolicy' ->> 'enabled' <> 'true'
              or setting -> 'properties' ->> 'storageAccountId' = ''
            )
          )
        )
    )
    select
      a.id as resource,
      case
        when a.diagnostic_settings is null then 'alarm'
        when l.workflow_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when a.diagnostic_settings is null then a.name || ' logging disabled.'
        when l.workflow_id is not null then a.name || ' logging enabled.'
        else a.name || ' logging disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_logic_app_workflow as a
      left join logging_details as l on a.id = l.workflow_id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}