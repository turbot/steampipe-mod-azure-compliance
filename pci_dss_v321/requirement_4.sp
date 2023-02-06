benchmark "pci_dss_v321_requirement_4" {
  title       = "Requirement 4: Encrypt transmission of cardholder data across open, public networks"
  description = "Cyber criminals may be able to intercept transmissions of cardholder data over open, public networks so it is important to prevent their ability to view this data. Encryption is one technology that can be used to render transmitted data unreadable by any unauthorized person."
  children = [
    benchmark.pci_dss_v321_requirement_4_1
  ]

  tags = local.pci_dss_v321_common_tags
}

benchmark "pci_dss_v321_requirement_4_1" {
  title = "Use strong cryptography and security protocols to safeguard sensitive cardholder data during transmission over open, public networks (eg. Internet, wireless technologies, cellular technologies,General Packet Radio Service [GPRS], satellite communications). Ensure wireless networks transmitting cardholder data or connected to the cardholder data environment use industry best practices to implement strong encryption for authentication and transmission"
  children = [
    control.appservice_api_app_use_https,
    // second control
    control.appservice_function_app_only_https_accessible,
    control.azure_redis_cache_ssl_enabled,
    control.storage_account_secure_transfer_required_enabled,
    control.servicefabric_cluster_protection_level_as_encrypt_and_sign,
    control.sql_database_transparent_data_encryption_enabled,
    control.compute_vm_temp_disks_cache_and_data_flows_encrypted
  ]

  tags = merge(local.pci_dss_v321_common_tags, {
    service = "Azure/Monitor"
  })
}
