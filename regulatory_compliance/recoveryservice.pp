locals {
  regulatory_compliance_recoveryservice_common_tags = {
    service = "Azure/RecoveryServices"
  }
}

control "recovery_service_vault_encrypted_with_cmk" {
  title       = "Azure Recovery Services vaults should use customer-managed keys for encrypting backup data"
  description = "Use customer-managed keys to manage the encryption at rest of your backup data. By default, customer data is encrypted with service-managed keys, but customer-managed keys are commonly required to meet regulatory compliance standards. Customer-managed keys enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management. Learn more at https://aka.ms/AB-CmkEncryption."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_recoveryservice_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "recovery_service_vault_uses_managed_identity" {
  title       = "Recovery Services vaults should use managed identity"
  description = "Recovery Services vaults should use a managed identity for enhanced authentication security."
  query       = query.recovery_service_vault_uses_managed_identity

  tags = local.regulatory_compliance_recoveryservice_common_tags
}

control "recovery_service_vault_uses_private_link" {
  title       = "Recovery Services vaults should use private link"
  description = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to Azure Recovery Services vaults, data leakage risks are reduced. Learn more about private links for Azure Site Recovery at: https://aka.ms/HybridScenarios-PrivateLink and https://aka.ms/AzureToAzure-PrivateLink."
  query       = query.recovery_service_vault_uses_private_link

  tags = merge(local.regulatory_compliance_recoveryservice_common_tags, {
    rbi_itf_nbfc_v2017 = "true"
  })
}

control "recovery_service_vault_uses_private_link_for_backup" {
  title       = "Azure Recovery Services vaults should use private link for backup"
  description = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to Azure Recovery Services vaults, data leakage risks are reduced. Learn more about private links at: https://aka.ms/AB-PrivateEndpoints."
  query       = query.recovery_service_vault_uses_private_link_for_backup

  tags = merge(local.regulatory_compliance_recoveryservice_common_tags, {
    rbi_itf_nbfc_v2017 = "true"
  })
}

query "recovery_service_vault_uses_managed_identity" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when identity is null or identity ->> 'type' = 'None' then 'alarm'
        else 'ok'
      end as status,
      case
        when identity is null or identity ->> 'type' = 'None' then name || ' not uses managed identity.'
        else name || ' uses managed identity.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_recovery_services_vault as s,
      azure_subscription as sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}

query "recovery_service_vault_uses_private_link" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when private_endpoint_state_for_site_recovery = 'Enabled' then 'ok'
        else 'alarm'
      end as status,
      case
        when private_endpoint_state_for_site_recovery = 'Enabled' then 'Private link for site recovery is enabled.'
        else 'Private link for site recovery is disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_recovery_services_vault as s,
      azure_subscription as sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}

query "recovery_service_vault_uses_private_link_for_backup" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when private_endpoint_state_for_backup = 'Enabled' then 'ok'
        else 'alarm'
      end as status,
      case
        when private_endpoint_state_for_backup = 'Enabled' then 'Private link for backup is enabled.'
        else 'Private link for backup is disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_recovery_services_vault as s,
      azure_subscription as sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}