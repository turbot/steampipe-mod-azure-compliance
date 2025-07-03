locals {
  regulatory_compliance_datalakestore_common_tags = {
    service = "Azure/DataLakeStorage"
  }
}

control "datalake_store_account_encryption_enabled" {
  title       = "Require encryption on Data Lake Store accounts"
  description = "This policy ensures encryption is enabled on all Data Lake Store accounts."
  query       = query.datalake_store_account_encryption_enabled

  tags = merge(local.regulatory_compliance_datalakestore_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "datalake_store_account_logging_enabled" {
  title       = "Resource logs in Azure Data Lake Store should be enabled"
  description = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes; when a security incident occurs or when your network is compromised."
  query       = query.datalake_store_account_logging_enabled

  tags = merge(local.regulatory_compliance_datalakestore_common_tags, {
    fedramp_high          = "true"
    hipaa_hitrust_v92     = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

query "datalake_store_account_encryption_enabled" {
  sql = <<-EOQ
    select
      b.account_id as resource,
      case
        when encryption_state = 'Enabled' then 'ok'
        else 'alarm'
      end as status,
      case
        when encryption_state = 'Enabled' then b.name || ' encryption enabled.'
        else b.name || ' encryption disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "b.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_data_lake_store as b,
      azure_subscription as sub
    where
      sub.subscription_id = b.subscription_id
      ${replace(local.resource_group_filter_qualifier_sql, "__QUALIFIER__", "b.")};
  EOQ
}

query "datalake_store_account_logging_enabled" {
  sql = <<-EOQ
    with logging_details as (
      select
        distinct account_id as account_id
      from
        azure_data_lake_store,
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
      a.account_id as resource,
      case
        when a.diagnostic_settings is null then 'alarm'
        when l.account_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when a.diagnostic_settings is null then a.name || ' logging disabled.'
        when l.account_id is not null then a.name || ' logging enabled.'
        else a.name || ' logging disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_data_lake_store as a
      left join logging_details as l on a.account_id = l.account_id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id
      ${replace(local.resource_group_filter_qualifier_sql, "__QUALIFIER__", "a.")};
  EOQ
}
