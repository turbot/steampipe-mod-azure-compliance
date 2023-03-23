locals {
  regulatory_compliance_batch_common_tags = {
    service = "Azure/Batch"
  }
}

control "batch_account_logging_enabled" {
  title       = "Resource logs in Batch accounts should be enabled"
  description = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes; when a security incident occurs or when your network is compromised."
  query       = query.batch_account_logging_enabled

  tags = merge(local.regulatory_compliance_batch_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "batch_account_encrypted_with_cmk" {
  title       = "Azure Batch account should use customer-managed keys to encrypt data"
  description = "Use customer-managed keys to manage the encryption at rest of your Batch account's data. By default, customer data is encrypted with service-managed keys, but customer-managed keys are commonly required to meet regulatory compliance standards. Customer-managed keys enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management."
  query       = query.batch_account_encrypted_with_cmk

  tags = merge(local.regulatory_compliance_batch_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

query "batch_account_logging_enabled" {
  sql = <<-EOQ
    with logging_details as (
      select
        distinct name as account_name
      from
        azure_batch_account,
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
      -- Required Columns
      v.id as resource,
      case
        when v.diagnostic_settings is null then 'alarm'
        when l.account_name is null then 'alarm'
        else 'ok'
      end as status,
      case
        when v.diagnostic_settings is null then v.name || ' logging not enabled.'
        when l.account_name is null then v.name || ' logging not enabled.'
        else v.name || ' logging enabled.'
      end as reason,
      -- Additional Dimensions
      v.resource_group,
      sub.display_name as subscription
    from
      azure_batch_account as v
      left join logging_details as l on v.name = l.account_name,
      azure_subscription as sub
    where
      sub.subscription_id = v.subscription_id;
  EOQ
}

query "batch_account_encrypted_with_cmk" {
  sql = <<-EOQ
    select
      -- Required Columns
      batch.id as resource,
      case
        when encryption ->> 'keySource' = 'Microsoft.KeyVault' then 'ok'
        else 'alarm'
      end as status,
      case
        when  encryption ->> 'keySource' = 'Microsoft.KeyVault' then batch.name || ' encrypted with CMK.'
        else batch.name || ' not encrypted with CMK.'
      end as reason,
      -- Additional Dimensions
      resource_group,
      sub.display_name as subscription
    from
      azure_batch_account as batch,
      azure_subscription as sub
    where
      sub.subscription_id = batch.subscription_id;
  EOQ
}
