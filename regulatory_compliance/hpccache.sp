locals {
  regulatory_compliance_hpccache_common_tags = {
    service = "Azure/HPCCache"
  }
}

control "hpc_cache_encrypted_with_cmk" {
  title       = "HPC Cache accounts should use customer-managed key for encryption"
  description = "Manage encryption at rest of Azure HPC Cache with customer-managed keys. By default, customer data is encrypted with service-managed keys, but customer-managed keys are commonly required to meet regulatory compliance standards. Customer-managed keys enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management."
  query       = query.hpc_cache_encrypted_with_cmk

  tags = merge(local.regulatory_compliance_hpccache_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

query "hpc_cache_encrypted_with_cmk" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when
          a.encryption_settings -> 'keyEncryptionKey' -> 'keyUrl' is not null
          and a.encryption_settings -> 'keyEncryptionKey' -> 'sourceVault' ->> 'id' is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when
          a.encryption_settings -> 'keyEncryptionKey' -> 'keyUrl' is not null
          and a.encryption_settings -> 'keyEncryptionKey' -> 'sourceVault' ->> 'id' is not null then a.name || ' encrypted with CMK.'
        else a.name || ' not encrypted with CMK.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_hpc_cache as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}
