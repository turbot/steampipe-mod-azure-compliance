locals {
  regulatory_compliance_hdinsight_common_tags = {
    service = "Azure/HDInsight"
  }
}

control "hdinsight_cluster_encryption_at_host_enabled" {
  title       = "Azure HDInsight clusters should use encryption at host to encrypt data at rest"
  description = "Enabling encryption at host helps protect and safeguard your data to meet your organizational security and compliance commitments. When you enable encryption at host, data stored on the VM host is encrypted at rest and flows encrypted to the Storage service."
  query       = query.hdinsight_cluster_encryption_at_host_enabled

  tags = merge(local.regulatory_compliance_hdinsight_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "hdinsight_cluster_encrypted_at_rest_with_cmk" {
  title       = "Azure HDInsight clusters should use customer-managed keys to encrypt data at rest"
  description = "Use customer-managed keys to manage the encryption at rest of your Azure HDInsight clusters. By default, customer data is encrypted with service-managed keys, but customer-managed keys are commonly required to meet regulatory compliance standards. Customer-managed keys enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management."
  query       = query.hdinsight_cluster_encrypted_at_rest_with_cmk

  tags = merge(local.regulatory_compliance_hdinsight_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "hdinsight_cluster_encryption_in_transit_enabled" {
  title       = "Azure HDInsight clusters should use encryption in transit to encrypt communication between Azure HDInsight cluster nodes"
  description = "Data can be tampered with during transmission between Azure HDInsight cluster nodes. Enabling encryption in transit addresses problems of misuse and tampering during this transmission."
  query       = query.hdinsight_cluster_encryption_in_transit_enabled

  tags = merge(local.regulatory_compliance_hdinsight_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

query "hdinsight_cluster_encryption_at_host_enabled" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when provisioning_state <> 'Succeeded' then 'skip'
        when disk_encryption_properties -> 'encryptionAtHost' = 'true' then 'ok'
        else 'alarm'
      end as status,
      case
        when provisioning_state <> 'Succeeded' then a.name || ' is in ' || provisioning_state || ' state.'
        when disk_encryption_properties -> 'encryptionAtHost' = 'true' then a.name || ' uses encryption at host to encrypt data at rest.'
        else a.name || ' not uses encryption at host to encrypt data at rest.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_hdinsight_cluster as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "hdinsight_cluster_encrypted_at_rest_with_cmk" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when provisioning_state <> 'Succeeded' then 'skip'
        when disk_encryption_properties -> 'keyName' is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when provisioning_state <> 'Succeeded' then a.name || ' is in ' || provisioning_state || ' state.'
        when disk_encryption_properties -> 'keyName' is not null then a.name || ' encrypted with CMK.'
        else a.name || ' not encrypted with CMK.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_hdinsight_cluster as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "hdinsight_cluster_encryption_in_transit_enabled" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when provisioning_state <> 'Succeeded' then 'skip'
        when encryption_in_transit_properties -> 'isEncryptionInTransitEnabled' = 'true' then 'ok'
        else 'alarm'
      end as status,
      case
        when provisioning_state <> 'Succeeded' then a.name || ' is in ' || provisioning_state || ' state.'
        when encryption_in_transit_properties -> 'isEncryptionInTransitEnabled' = 'true' then a.name || ' encryption in transit enabled.'
        else a.name || ' encryption in transit disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_hdinsight_cluster as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}