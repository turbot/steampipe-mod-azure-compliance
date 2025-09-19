locals {
  regulatory_compliance_servicefabric_common_tags = {
    service = "Azure/ServiceFabric"
  }
}

control "servicefabric_cluster_active_directory_authentication_enabled" {
  title       = "Service Fabric clusters should only use Azure Active Directory for client authentication"
  description = "Audit usage of client authentication only via Azure Active Directory in Service Fabric."
  query       = query.servicefabric_cluster_active_directory_authentication_enabled

  tags = merge(local.regulatory_compliance_servicefabric_common_tags, {
    fedramp_high          = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "servicefabric_cluster_protection_level_as_encrypt_and_sign" {
  title       = "Service Fabric clusters should have the ClusterProtectionLevel property set to EncryptAndSign"
  description = "Service Fabric provides three levels of protection (None, Sign and EncryptAndSign) for node-to-node communication using a primary cluster certificate. Set the protection level to ensure that all node-to-node messages are encrypted and digitally signed."
  query       = query.servicefabric_cluster_protection_level_as_encrypt_and_sign

  tags = merge(local.regulatory_compliance_servicefabric_common_tags, {
    fedramp_high          = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    pci_dss_v321          = "true"
  })
}

query "servicefabric_cluster_active_directory_authentication_enabled" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when azure_active_directory is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when azure_active_directory is not null then a.name || ' using Azure Active Directory for client authentication.'
        else a.name || ' not using Azure Active Directory for client authentication.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_service_fabric_cluster a,
      azure_subscription sub;
  EOQ
}

query "servicefabric_cluster_protection_level_as_encrypt_and_sign" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when fabric_settings @> '[{"parameters":[{"value": "EncryptAndSign"}]}]'::jsonb then 'ok'
        else 'alarm'
      end as status,
      case
        when fabric_settings @> '[{"parameters":[{"value": "EncryptAndSign"}]}]'::jsonb then a.name || ' ClusterProtectionLevel property set to EncryptAndSign.'
        else a.name || ' ClusterProtectionLevel property not set to EncryptAndSign.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_service_fabric_cluster a
      left join azure_subscription as sub on sub.subscription_id = a.subscription_id;
  EOQ
}
