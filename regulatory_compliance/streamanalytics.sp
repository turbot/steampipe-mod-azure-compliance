locals {
  regulatory_compliance_streamanalytics_common_tags = {
    service = "Azure/StreamAnalytics"
  }
}

control "stream_analytics_job_logging_enabled" {
  title       = "Resource logs in Azure Stream Analytics should be enabled"
  description = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes; when a security incident occurs or when your network is compromised."
  query       = query.stream_analytics_job_logging_enabled

  tags = merge(local.regulatory_compliance_streamanalytics_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "stream_analytics_job_encrypted_with_cmk" {
  title       = "Azure Stream Analytics jobs should use customer-managed keys to encrypt data"
  description = "Use customer-managed keys when you want to securely store any metadata and private data assets of your Stream Analytics jobs in your storage account. This gives you total control over how your Stream Analytics data is encrypted."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_streamanalytics_common_tags, {
    nist_sp_800_171_r2   = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

query "stream_analytics_job_logging_enabled" {
  sql = <<-EOQ
    with logging_details as (
      select
        distinct name as job_name
      from
        azure_stream_analytics_job,
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
      v.job_id as resource,
      case
        when v.diagnostic_settings is null then 'alarm'
        when l.job_name is null then 'alarm'
        else 'ok'
      end as status,
      case
        when v.diagnostic_settings is null then v.name || ' logging not enabled.'
        when l.job_name is null then v.name || ' logging not enabled.'
        else v.name || ' logging enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "v.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_stream_analytics_job as v
      left join logging_details as l on v.name = l.job_name,
      azure_subscription as sub
    where
      sub.subscription_id = v.subscription_id;
  EOQ
}
