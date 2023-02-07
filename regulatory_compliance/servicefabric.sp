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
    nist_sp_800_53_rev_5 = "true"
  })
}

control "servicefabric_cluster_protection_level_as_encrypt_and_sign" {
  title       = "Service Fabric clusters should have the ClusterProtectionLevel property set to EncryptAndSign"
  description = "Service Fabric provides three levels of protection (None, Sign and EncryptAndSign) for node-to-node communication using a primary cluster certificate. Set the protection level to ensure that all node-to-node messages are encrypted and digitally signed."
  query       = query.servicefabric_cluster_protection_level_as_encrypt_and_sign

  tags = merge(local.regulatory_compliance_servicefabric_common_tags, {
    nist_sp_800_53_rev_5 = "true"
    pci_dss_v321         = "true"
  })
}
