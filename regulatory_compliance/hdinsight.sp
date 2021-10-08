locals {
  regulatory_compliance_hdinsight_common_tags = {
    service = "hdinsight"
  }
}

control "hdinsight_cluster_encryption_at_host_enabled" {
  title       = "Azure HDInsight clusters should use encryption at host to encrypt data at rest"
  description = "Enabling encryption at host helps protect and safeguard your data to meet your organizational security and compliance commitments. When you enable encryption at host, data stored on the VM host is encrypted at rest and flows encrypted to the Storage service."
  sql         = query.hdinsight_cluster_encryption_at_host_enabled.sql

  tags = merge(local.regulatory_compliance_hdinsight_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "hdinsight_cluster_encrypted_at_rest_with_cmk" {
  title       = "Azure HDInsight clusters should use customer-managed keys to encrypt data at rest"
  description = "Use customer-managed keys to manage the encryption at rest of your Azure HDInsight clusters. By default, customer data is encrypted with service-managed keys, but customer-managed keys are commonly required to meet regulatory compliance standards. Customer-managed keys enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management."
  sql         = query.hdinsight_cluster_encrypted_at_rest_with_cmk.sql

  tags = merge(local.regulatory_compliance_hdinsight_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "hdinsight_cluster_encryption_in_transit_enabled" {
  title       = "Azure HDInsight clusters should use encryption in transit to encrypt communication between Azure HDInsight cluster nodes"
  description = "Data can be tampered with during transmission between Azure HDInsight cluster nodes. Enabling encryption in transit addresses problems of misuse and tampering during this transmission."
  sql         = query.hdinsight_cluster_encryption_in_transit_enabled.sql

  tags = merge(local.regulatory_compliance_hdinsight_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}