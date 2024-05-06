locals {
  regulatory_compliance_keyvault_common_tags = {
    service = "Azure/KeyVault"
  }
}

control "keyvault_purge_protection_enabled" {
  title       = "Key vaults should have deletion protection enabled"
  description = "Malicious deletion of a key vault can lead to permanent data loss. A malicious insider in your organization can potentially delete and purge key vaults. Purge protection protects you from insider attacks by enforcing a mandatory retention period for soft deleted key vaults. No one inside your organization or Microsoft will be able to purge your key vaults during the soft delete retention period."
  query       = query.keyvault_purge_protection_enabled

  tags = merge(local.regulatory_compliance_keyvault_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "keyvault_logging_enabled" {
  title       = "Resource logs in Key Vault should be enabled"
  description = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes when a security incident occurs or when your network is compromised."
  query       = query.keyvault_logging_enabled

  tags = merge(local.regulatory_compliance_keyvault_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "keyvault_vault_use_virtual_service_endpoint" {
  title       = "Key Vault should use a virtual network service endpoint"
  description = "This policy audits any Key Vault not configured to use a virtual network service endpoint."
  query       = query.keyvault_vault_use_virtual_service_endpoint

  tags = merge(local.regulatory_compliance_keyvault_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "keyvault_managed_hms_purge_protection_enabled" {
  title       = "Azure Key Vault Managed HSM should have purge protection enabled"
  description = "Malicious deletion of an Azure Key Vault Managed HSM can lead to permanent data loss. A malicious insider in your organization can potentially delete and purge Azure Key Vault Managed HSM. Purge protection protects you from insider attacks by enforcing a mandatory retention period for soft deleted Azure Key Vault Managed HSM. No one inside your organization or Microsoft will be able to purge your Azure Key Vault Managed HSM during the soft delete retention period."
  query       = query.keyvault_managed_hms_purge_protection_enabled

  tags = merge(local.regulatory_compliance_keyvault_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "keyvault_managed_hms_logging_enabled" {
  title       = "Resource logs in Azure Key Vault Managed HSM should be enabled"
  description = "To recreate activity trails for investigation purposes when a security incident occurs or when your network is compromised, you may want to audit by enabling resource logs on Managed HSMs."
  query       = query.keyvault_managed_hms_logging_enabled

  tags = merge(local.regulatory_compliance_keyvault_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "keyvault_vault_private_link_used" {
  title       = "Azure Key Vaults should use private link"
  description = "Azure Private Link lets you connect your virtual networks to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to key vault, you can reduce data leakage risks."
  query       = query.keyvault_vault_private_link_used

  tags = merge(local.regulatory_compliance_keyvault_common_tags, {
    nist_sp_800_171_r2   = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "keyvault_vault_public_network_access_disabled" {
  title       = "Azure Key Vault should disable public network access"
  description = "Disable public network access for your key vault so that it's not accessible over the public internet. This can reduce data leakage risks."
  query       = query.keyvault_vault_public_network_access_disabled

  tags = local.regulatory_compliance_keyvault_common_tags
}

control "keyvault_key_expiration_set" {
  title       = "Key Vault keys should have an expiration date"
  description = "Cryptographic keys should have a defined expiration date and not be permanent. Keys that are valid forever provide a potential attacker with more time to compromise the key. It is a recommended security practice to set expiration dates on cryptographic keys."
  query       = query.keyvault_key_expiration_set

  tags = merge(local.regulatory_compliance_keyvault_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "keyvault_secret_expiration_set" {
  title       = "Key Vault secrets should have an expiration date"
  description = "Secrets should have a defined expiration date and not be permanent. Secrets that are valid forever provide a potential attacker with more time to compromise them. It is a recommended security practice to set expiration dates on secrets."
  query       = query.keyvault_secret_expiration_set

  tags = merge(local.regulatory_compliance_keyvault_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "keyvault_soft_delete_enabled" {
  title       = "Key vaults should have soft delete enabled"
  description = "Deleting a key vault without soft delete enabled permanently deletes all secrets, keys, and certificates stored in the key vault. Accidental deletion of a key vault can lead to permanent data loss. Soft delete allows you to recover an accidentally deleted key vault for a configurable retention period."
  query       = query.keyvault_soft_delete_enabled

  tags = merge(local.regulatory_compliance_keyvault_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "keyvault_firewall_enabled" {
  title       = "Azure Key Vault should have firewall enabled"
  description = "Enable the key vault firewall so that the key vault is not accessible by default to any public IPs. Optionally, you can configure specific IP ranges to limit access to those networks."
  query       = query.keyvault_firewall_enabled

  tags = merge(local.regulatory_compliance_keyvault_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "keyvault_certificate_validity_12_months" {
  title       = "Certificates should have the specified maximum validity period"
  description = "Manage your organizational compliance requirements by specifying the maximum amount of time that a certificate can be valid within your key vault."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_keyvault_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "keyvault_rbac_enabled" {
  title       = "Enable Role Based Access Control for Azure Key Vault"
  description = "Role assignments disappear when a Key Vault has been deleted (soft- delete) and recovered. Afterwards it will be required to recreate all role assignments. This is a limitation of the soft-delete feature across all Azure services."
  query       = query.keyvault_rbac_enabled

  tags = local.regulatory_compliance_keyvault_common_tags
}

control "keyvault_with_non_rbac_key_expiration_set" {
  title       = "Ensure that the Expiration Date is set for all Keys in Non-RBAC Key Vaults"
  description = "Ensure that all Keys in Non Role Based Access Control (RBAC) Azure Key Vaults have an expiration time set."
  query       = query.keyvault_with_non_rbac_key_expiration_set

  tags = local.regulatory_compliance_keyvault_common_tags
}

control "keyvault_vault_recoverable" {
  title       = "Ensure the key vault is recoverable"
  description = "The key vault contains object keys, secrets and certificates. Accidental unavailability of a key vault can cause immediate data loss or loss of security functions (authentication, validation, verification, non-repudiation, etc.) supported by the key vault objects. It is recommended the key vault be made recoverable by enabling the \"Do Not Purge\" and \"Soft Delete\" functions."
  query       = query.keyvault_vault_recoverable

  tags = local.regulatory_compliance_keyvault_common_tags
}

control "keyvault_with_non_rbac_secret_expiration_set" {
  title       = "Ensure that the Expiration Date is set for all Secrets in Non-RBAC Key Vaults"
  description = "Ensure that all Secrets in Non Role Based Access Control (RBAC) Azure Key Vaults have an expiration time set."
  query       = query.keyvault_with_non_rbac_secret_expiration_set

  tags = local.regulatory_compliance_keyvault_common_tags
}

control "keyvault_with_rbac_key_expiration_set" {
  title       = "Ensure that the Expiration Date is set for all Keys in RBAC Key Vaults"
  description = "Ensure that all Keys in Role Based Access Control (RBAC) Azure Key Vaults have an expiration date set."
  query       = query.keyvault_with_rbac_key_expiration_set

  tags = local.regulatory_compliance_keyvault_common_tags
}

control "keyvault_with_rbac_secret_expiration_set" {
  title       = "Ensure that the Expiration Date is set for all Secrets in RBAC Key Vaults"
  description = "Ensure that all Secrets in Role Based Access Control (RBAC) Azure Key Vaults have an expiration date set."
  query       = query.keyvault_with_rbac_secret_expiration_set

  tags = local.regulatory_compliance_keyvault_common_tags
}

query "keyvault_purge_protection_enabled" {
  sql = <<-EOQ
    select
      kv.id as resource,
      case
        when purge_protection_enabled then 'ok'
        else 'alarm'
      end as status,
      case
        when purge_protection_enabled then name || ' purge protection enabled.'
        else name || ' purge protection disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "kv.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_key_vault as kv,
      azure_subscription as sub
    where
      sub.subscription_id = kv.subscription_id;
  EOQ
}

query "keyvault_logging_enabled" {
  sql = <<-EOQ
    with logging_details as (
      select
        name as key_vault_name
      from
        azure_key_vault,
        jsonb_array_elements(diagnostic_settings) setting,
        jsonb_array_elements(setting -> 'properties' -> 'logs') log
      where
        diagnostic_settings is not null
        and setting -> 'properties' ->> 'storageAccountId' <> ''
        and (log ->> 'enabled') :: boolean
        and log ->> 'category' = 'AuditEvent'
        and (log -> 'retentionPolicy') :: JSONB ? 'days'
    )
    select
      v.id as resource,
      case
        when v.diagnostic_settings is null then 'alarm'
        when l.key_vault_name not like concat('%', v.name, '%') then 'alarm'
        else 'ok'
      end as status,
      case
        when v.diagnostic_settings is null then v.name || ' logging not enabled.'
        when l.key_vault_name not like concat('%', v.name, '%') then v.name || ' logging not enabled.'
        else v.name || ' logging enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "v.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_key_vault v,
      logging_details l,
      azure_subscription sub
    where
      sub.subscription_id = v.subscription_id;
  EOQ
}

query "keyvault_vault_use_virtual_service_endpoint" {
  sql = <<-EOQ
    with keyvault_vault_subnet as (
      select
        distinct a.name,
        rule ->> 'id' as id
      from
        azure_key_vault as a,
        jsonb_array_elements(network_acls -> 'virtualNetworkRules') as rule
      where
        rule ->> 'id' is not null
    )
    select
      distinct a.name as resource,
      case
        when network_acls ->> 'defaultAction' <> 'Deny' then 'alarm'
        when s.name is null then 'alarm'
        else 'ok'
      end as status,
      case
        when network_acls ->> 'defaultAction' <> 'Deny' then a.name || ' not configured with virtual service endpoint.'
        when s.name is null then a.name || ' not configured with virtual service endpoint.'
        else a.name || ' configured with virtual service endpoint.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_key_vault as a
      left join keyvault_vault_subnet as s on a.name = s.name,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "keyvault_managed_hms_purge_protection_enabled" {
  sql = <<-EOQ
    select
      kv.id as resource,
      case
        when enable_purge_protection then 'ok'
        else 'alarm'
      end as status,
      case
        when enable_purge_protection then name || ' purge protection enabled.'
        else name || ' purge protection disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "kv.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_key_vault_managed_hardware_security_module as kv,
      azure_subscription as sub
    where
      sub.subscription_id = kv.subscription_id;
  EOQ
}

query "keyvault_managed_hms_logging_enabled" {
  sql = <<-EOQ
    with logging_details as (
      select
        name as key_vault_name
      from
        azure_key_vault_managed_hardware_security_module,
        jsonb_array_elements(diagnostic_settings) setting,
        jsonb_array_elements(setting -> 'properties' -> 'logs') log
      where
        diagnostic_settings is not null
        and setting -> 'properties' ->> 'storageAccountId' <> ''
        and (log ->> 'enabled') :: boolean
        and log ->> 'category' = 'AuditEvent'
        and (log -> 'retentionPolicy') :: JSONB ? 'days'
    )
    select
      v.id as resource,
      case
        when v.diagnostic_settings is null then 'alarm'
        when l.key_vault_name not like concat('%', v.name, '%') then 'alarm'
        else 'ok'
      end as status,
      case
        when v.diagnostic_settings is null then v.name || ' logging not enabled.'
        when l.key_vault_name not like concat('%', v.name, '%')
          then v.name || ' logging not enabled.'
        else v.name || ' logging enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "v.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_key_vault_managed_hardware_security_module as v,
      logging_details as l,
      azure_subscription as sub
    where
      sub.subscription_id = v.subscription_id;
  EOQ
}

query "keyvault_vault_private_link_used" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
      -- Having private_endpoint_connections will not permit vault to use the same.
      -- In case'defaultAction' = 'Allow', All Network including internet is allowed, which will not satisfy the private endpoint connection.
      -- Default All network will have not network_acls associated.
        when network_acls is null or network_acls ->> 'defaultAction' = 'Allow' then 'alarm'
        when private_endpoint_connections is null then 'info'
        when private_endpoint_connections @> '[{"PrivateLinkServiceConnectionStateStatus": "Approved"}]' then 'ok'
        else 'alarm'
      end as status,
      case
        when network_acls is null or network_acls ->> 'defaultAction' = 'Allow' then a.name || ' using public networks.'
        when private_endpoint_connections is null then a.name || ' no private link exists.'
        when private_endpoint_connections @> '[{"PrivateLinkServiceConnectionStateStatus": "Approved"}]'
        then a.name || ' using private link.'
        else a.name || ' private link not enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_key_vault a,
      azure_subscription sub;
  EOQ
}

query "keyvault_vault_public_network_access_disabled" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
      -- In case'defaultAction' = 'Allow', All Network including internet is allowed
      -- Default All network will have not network_acls associated
        when network_acls is null or network_acls ->> 'defaultAction' != 'Deny' then 'alarm'
        else 'ok'
      end as status,
      case
        when network_acls is null or network_acls ->> 'defaultAction' != 'Deny' then a.name || ' public network access enabled.'
        else a.name || ' public network access disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_key_vault a,
      azure_subscription sub;
  EOQ
}

query "keyvault_key_expiration_set" {
  sql = <<-EOQ
    select
      kvk.id as resource,
      case
        when enabled and expires_at is null then 'alarm'
        else 'ok'
      end as status,
      vault_name || ' key ' || name ||
      case
        when enabled and expires_at is null then ' expiration date not set.'
        when not enabled then ' disabled.'
        else ' expiration date set to ' || to_char(expires_at, 'DD-Mon-YYYY') || '.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "kvk.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_key_vault_key kvk,
      azure_subscription sub
    where
      sub.subscription_id = kvk.subscription_id;
  EOQ
}

query "keyvault_secret_expiration_set" {
  sql = <<-EOQ
    select
      kvs.id as resource,
      case
        when enabled and expires_at is null then 'alarm'
        else 'ok'
      end as status,
      vault_name || ' secret ' || name ||
      case
        when enabled and expires_at is null then ' expiration date not set.'
        when not enabled then ' disabled.'
        else ' expiration date set to ' || to_char(expires_at, 'DD-Mon-YYYY') || '.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "kvs.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_key_vault_secret as kvs,
      azure_subscription as sub
    where
      sub.subscription_id = kvs.subscription_id;
  EOQ
}

query "keyvault_soft_delete_enabled" {
  sql = <<-EOQ
    select
      kv.id as resource,
      case
        when soft_delete_enabled then 'ok'
        else 'alarm'
      end as status,
      case
        when soft_delete_enabled then name || ' soft delete enabled.'
        else name || ' soft delete disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "kv.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_key_vault as kv,
      azure_subscription as sub
    where
      sub.subscription_id = kv.subscription_id;
  EOQ
}

query "keyvault_rbac_enabled" {
  sql = <<-EOQ
    select
      kv.id as resource,
      case
        when enable_rbac_authorization then 'ok'
        else 'alarm'
      end as status,
      case
        when enable_rbac_authorization then name || ' has RBAC enabled.'
        else name || ' have RBAC disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "kv.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_key_vault as kv,
      azure_subscription as sub
    where
      sub.subscription_id = kv.subscription_id;
  EOQ
}

query "keyvault_with_non_rbac_key_expiration_set" {
  sql = <<-EOQ
    with non_rbac_vault as (
      select
        name
      from
        azure_key_vault
      where not enable_rbac_authorization
    )
    select
      kvk.id as resource,
      case
        when v.name is null then 'skip'
        when enabled and expires_at is null then 'alarm'
        else 'ok'
      end as status,
      vault_name || ' key ' || kvk.name ||
      case
        when v.name is null then ' RBAC enabled vault.'
        when enabled and expires_at is null then ' expiration date not set.'
        when not enabled then ' disabled.'
        else ' expiration date set to ' || to_char(expires_at, 'DD-Mon-YYYY') || '.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "kvk.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_key_vault_key kvk
      left join non_rbac_vault as v on v.name = kvk.vault_name,
      azure_subscription sub
    where
      sub.subscription_id = kvk.subscription_id;
  EOQ
}

query "keyvault_vault_recoverable" {
  sql = <<-EOQ
    select
      kv.id as resource,
      case
        when soft_delete_enabled and purge_protection_enabled then 'ok'
        else 'alarm'
      end as status,
      case
        when not soft_delete_enabled and not purge_protection_enabled then name || ' "soft delete" and "do not purge" not enabled.'
        when not soft_delete_enabled then name || ' "soft delete" not enabled.'
        when not purge_protection_enabled then name || ' "do not purge" not enabled.'
        else name || ' "soft delete" and "do not purge" enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "kv.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_key_vault kv,
      azure_subscription sub
    where
      sub.subscription_id = kv.subscription_id;
  EOQ
}

query "keyvault_with_non_rbac_secret_expiration_set" {
  sql = <<-EOQ
    with non_rbac_vault as (
      select
        name
      from
        azure_key_vault
      where not enable_rbac_authorization
    )
    select
      kvs.id as resource,
      case
        when v.name is null then 'skip'
        when enabled and expires_at is null then 'alarm'
        else 'ok'
      end as status,
      vault_name || ' key ' || kvs.name ||
      case
        when v.name is null then ' RBAC enabled vault.'
        when enabled and expires_at is null then ' expiration date not set.'
        when not enabled then ' disabled.'
        else ' expiration date set to ' || to_char(expires_at, 'DD-Mon-YYYY') || '.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "kvs.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_key_vault_secret kvs
      left join non_rbac_vault as v on v.name = kvs.vault_name,
      azure_subscription sub
    where
      sub.subscription_id = kvs.subscription_id;
  EOQ
}

query "keyvault_with_rbac_key_expiration_set" {
  sql = <<-EOQ
    with rbac_vault as (
      select
        name
      from
        azure_key_vault
      where enable_rbac_authorization
    )
    select
      kvk.id as resource,
      case
        when v.name is null then 'skip'
        when enabled and expires_at is null then 'alarm'
        else 'ok'
      end as status,
      vault_name || ' key ' || kvk.name ||
      case
        when v.name is null then ' not RBAC enabled vault.'
        when enabled and expires_at is null then ' expiration date not set.'
        when not enabled then ' disabled.'
        else ' expiration date set to ' || to_char(expires_at, 'DD-Mon-YYYY') || '.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "kvk.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_key_vault_key kvk
      left join rbac_vault as v on v.name = kvk.vault_name,
      azure_subscription sub
    where
      sub.subscription_id = kvk.subscription_id;
  EOQ
}

query "keyvault_with_rbac_secret_expiration_set" {
  sql = <<-EOQ
    with rbac_vault as (
      select
        name
      from
        azure_key_vault
      where enable_rbac_authorization
    )
    select
      kvs.id as resource,
      case
        when v.name is null then 'skip'
        when enabled and expires_at is null then 'alarm'
        else 'ok'
      end as status,
      vault_name || ' key ' || kvs.name ||
      case
        when v.name is null then ' not RBAC enabled vault.'
        when enabled and expires_at is null then ' expiration date not set.'
        when not enabled then ' disabled.'
        else ' expiration date set to ' || to_char(expires_at, 'DD-Mon-YYYY') || '.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "kvs.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_key_vault_secret kvs
      left join rbac_vault as v on v.name = kvs.vault_name,
      azure_subscription sub
    where
      sub.subscription_id = kvs.subscription_id;
  EOQ
}

query "keyvault_firewall_enabled" {
  sql = <<-EOQ
    select
      kv.id as resource,
      case
        when jsonb_array_length(network_acls -> 'ipRules') > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when jsonb_array_length(network_acls -> 'ipRules') > 0 then name || ' firewall enabled.'
        else name || ' firewall disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "kv.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_key_vault kv,
      azure_subscription sub
    where
      sub.subscription_id = kv.subscription_id;
  EOQ
}
