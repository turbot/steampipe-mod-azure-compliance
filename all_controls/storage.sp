locals {
  all_controls_storage_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/Storage"
  })
}

benchmark "all_controls_storage" {
  title       = "Storage"
  description = "This section contains recommendations for configuring Storage resources."
  children = [
    control.storage_account_blob_containers_public_access_private,
    control.storage_account_blob_service_logging_enabled,
    control.storage_account_block_public_access,
    control.storage_account_containing_vhd_os_disk_not_cmk_encrypted,
    control.storage_account_default_network_access_rule_denied,
    control.storage_account_encryption_at_rest_using_cmk,
    control.storage_account_encryption_scopes_encrypted_at_rest_with_cmk,
    control.storage_account_geo_redundant_enabled,
    control.storage_account_infrastructure_encryption_enabled,
    control.storage_account_logging_for_blobs_disabled,
    control.storage_account_logging_for_queues_disabled,
    control.storage_account_logging_for_tables_disabled,
    control.storage_account_min_tls_1_2,
    control.storage_account_queue_services_logging_enabled,
    control.storage_account_restrict_network_access,
    control.storage_account_secure_transfer_required_enabled,
    control.storage_account_soft_delete_enabled,
    control.storage_account_table_service_logging_enabled,
    control.storage_account_trusted_microsoft_services_enabled,
    control.storage_account_use_virtual_service_endpoint,
    control.storage_account_uses_azure_resource_manager,
    control.storage_account_uses_private_link
  ]

  tags = merge(local.all_controls_storage_common_tags, {
    type = "Benchmark"
  })
}
