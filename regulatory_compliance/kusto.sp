locals {
  regulatory_compliance_kusto_common_tags = {
    service = "Azure/DataExplorer"
  }
}

control "kusto_cluster_encrypted_at_rest_with_cmk" {
  title       = "Azure Data Explorer encryption at rest should use a customer-managed key"
  description = "Enabling encryption at rest using a customer-managed key on your Azure Data Explorer cluster provides additional control over the key being used by the encryption at rest. This feature is oftentimes applicable to customers with special compliance requirements and requires a Key Vault to managing the keys."
  query       = query.kusto_cluster_encrypted_at_rest_with_cmk

  tags = merge(local.regulatory_compliance_kusto_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "kusto_cluster_disk_encryption_enabled" {
  title       = "Disk encryption should be enabled on Azure Data Explorer"
  description = "Enabling disk encryption helps protect and safeguard your data to meet your organizational security and compliance commitments."
  query       = query.kusto_cluster_disk_encryption_enabled

  tags = merge(local.regulatory_compliance_kusto_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "kusto_cluster_double_encryption_enabled" {
  title       = "Double encryption should be enabled on Azure Data Explorer"
  description = "Enabling double encryption helps protect and safeguard your data to meet your organizational security and compliance commitments. When double encryption has been enabled, data in the storage account is encrypted twice, once at the service level and once at the infrastructure level, using two different encryption algorithms and two different keys."
  query       = query.kusto_cluster_double_encryption_enabled

  tags = merge(local.regulatory_compliance_kusto_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

query "kusto_cluster_encrypted_at_rest_with_cmk" {
  sql = <<-EOQ
    select
      kv.id as resource,
      case
        when
          key_vault_properties -> 'keyName' is not null
          and key_vault_properties -> 'keyVaultUri' is not null
          and key_vault_properties -> 'keyVersion' is not null
        then 'ok'
        else 'alarm'
      end as status,
      case
        when
          key_vault_properties -> 'keyName' is not null
          and key_vault_properties -> 'keyVaultUri' is not null
          and key_vault_properties -> 'keyVersion' is not null
        then name || ' encrypted at rest with CMK.'
        else name || ' not encrypted at rest with CMK.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "kv.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_kusto_cluster as kv,
      azure_subscription as sub
    where
      sub.subscription_id = kv.subscription_id;
  EOQ
}

query "kusto_cluster_disk_encryption_enabled" {
  sql = <<-EOQ
    select
      kv.id as resource,
      case
        when enable_disk_encryption then 'ok'
        else 'alarm'
      end as status,
      case
        when enable_disk_encryption then name || ' disk encryption enabled.'
        else name || ' disk encryption disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "kv.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_kusto_cluster as kv,
      azure_subscription as sub
    where
      sub.subscription_id = kv.subscription_id;
  EOQ
}

query "kusto_cluster_double_encryption_enabled" {
  sql = <<-EOQ
    select
      kv.id as resource,
      case
        when enable_double_encryption then 'ok'
        else 'alarm'
      end as status,
      case
        when enable_double_encryption then name || ' double encryption enabled.'
        else name || ' double encryption disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "kv.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_kusto_cluster as kv,
      azure_subscription as sub
    where
      sub.subscription_id = kv.subscription_id;
  EOQ
}