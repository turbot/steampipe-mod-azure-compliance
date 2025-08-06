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
    fedramp_high          = "true"
    nist_sp_800_171_rev_2 = "true"
    hipaa_hitrust_v92     = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "logic_app_integration_service_environment_encrypted_with_cmk" {
  title       = "Logic Apps Integration Service Environment should be encrypted with customer-managed keys"
  description = "Deploy into Integration Service Environment to manage encryption at rest of Logic Apps data using customer-managed keys. By default, customer data is encrypted with service-managed keys, but customer-managed keys are commonly required to meet regulatory compliance standards. Customer-managed keys enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_logic_common_tags, {
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
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
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
