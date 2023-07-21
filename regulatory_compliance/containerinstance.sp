locals {
  regulatory_compliance_containerinstance_common_tags = {
    service = "Azure/ContainerInstance"
  }
}

control "container_instance_container_group_encrypted_using_cmk" {
  title       = "Azure Container Instance container group should use customer-managed key for encryption"
  description = "Secure your containers with greater flexibility using customer-managed keys. When you specify a customer-managed key, that key is used to protect and control access to the key that encrypts your data. Using customer-managed keys provides additional capabilities to control rotation of the key encryption key or cryptographically erase data."
  query       = query.container_instance_container_group_encrypted_using_cmk

  tags = merge(local.regulatory_compliance_containerinstance_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

query "container_instance_container_group_encrypted_using_cmk" {
  sql = <<-EOQ
    select
      cg.id as resource,
      case
        when encryption_properties ->> 'keyName' is not null and encryption_properties ->> 'vaultBaseUrl' is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when encryption_properties ->> 'keyName' is not null and encryption_properties ->> 'vaultBaseUrl' is not null then cg.title || ' encrypted with CMK.'
        else cg.title || ' not encrypted with CMK.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "cg.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_container_group as cg,
      azure_subscription as sub
    where
      sub.subscription_id = cg.subscription_id;
  EOQ
} 
