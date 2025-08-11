locals {
  cis_v400_2_common_tags = merge(local.cis_v400_common_tags, {
    cis_section_id = "2"
  })
}

locals {
  cis_v400_2_1_common_tags = merge(local.cis_v400_2_common_tags, {
    cis_section_id = "2.1"
  })
  cis_v400_2_1_1_common_tags = merge(local.cis_v400_2_common_tags, {
    cis_section_id = "2.1.1"
  })
  cis_v400_2_1_1_1_common_tags = merge(local.cis_v400_2_common_tags, {
    cis_section_id = "2.1.1.1"
  })
  cis_v400_2_1_1_2_common_tags = merge(local.cis_v400_2_common_tags, {
    cis_section_id = "2.1.1.2"
  })
  cis_v400_2_2_common_tags = merge(local.cis_v400_2_common_tags, {
    cis_section_id = "2.2"
  })
  cis_v400_2_2_1_common_tags = merge(local.cis_v400_2_common_tags, {
    cis_section_id = "2.2.1"
  })
  cis_v400_2_2_2_common_tags = merge(local.cis_v400_2_common_tags, {
    cis_section_id = "2.2.2"
  })
}

benchmark "cis_v400_2" {
  title         = "2 Common Reference Recommendations"
  documentation = file("./cis_v400/docs/cis_v400_2.md")
  children = [
    benchmark.cis_v400_2_1,
    benchmark.cis_v400_2_2
  ]

  tags = merge(local.cis_v400_2_common_tags, {
    type    = "Benchmark"
  })
}

benchmark "cis_v400_2_1" {
  title         = "2.1 Secrets and Keys"
  documentation = file("./cis_v400/docs/cis_v400_2_1.md")
  children = [
    benchmark.cis_v400_2_1_1
  ]

  tags = merge(local.cis_v400_2_1_common_tags, {
    type    = "Benchmark"
  })
}

benchmark "cis_v400_2_1_1" {
  title         = "2.1.1 Encryption Key Management"
  documentation = file("./cis_v400/docs/cis_v400_2_1_1.md")
  children = [
    benchmark.cis_v400_2_1_1_1,
    benchmark.cis_v400_2_1_1_2
  ]

  tags = merge(local.cis_v400_2_1_1_common_tags, {
    type    = "Benchmark"
  })
}

benchmark "cis_v400_2_1_1_1" {
  title         = "2.1.1.1 Microsoft Managed Keys"
  documentation = file("./cis_v400/docs/cis_v400_2_1_1_1.md")
  children = [
    control.cis_v400_2_1_1_1_1
  ]

  tags = merge(local.cis_v400_2_1_1_1_common_tags, {
    type    = "Benchmark"
  })
}

control "cis_v400_2_1_1_1_1" {
  title         = "2.1.1.1.1 Ensure Critical Data is Encrypted with Microsoft Managed Keys (MMK)"
  description   = "Microsoft Managed Keys (MMK) (also known as Platform-managed keys (PMK)) provides a very low overhead method of encrypting data at rest and implementing encryption key management."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_2_1_1_1_1.md")

  tags = merge(local.cis_v400_2_1_1_1_common_tags, {
    cis_item_id = "2.1.1.1.1"
    cis_level   = "1"
    cis_type    = "manual"
  })
}

benchmark "cis_v400_2_1_1_2" {
  title         = "2.1.1.2 Customer Managed Keys"
  documentation = file("./cis_v400/docs/cis_v400_2_1_1_2.md")
  children = [
    benchmark.cis_v400_2_1_1_2_1
  ]

  tags = merge(local.cis_v400_2_1_1_2_common_tags, {
    type    = "Benchmark"
  })
}

benchmark "cis_v400_2_1_1_2_1" {
  title         = "2.1.1.2.1 Ensure Critical Data is Encrypted with Customer Managed Keys (CMK)"
  description   = "Customer Managed Keys introduce additional depth to security by providing a means to manage access control for encryption keys."
  children = [
    control.batch_account_encrypted_with_cmk,
    control.cognitive_account_encrypted_with_cmk,
    control.compute_os_and_data_disk_encrypted_with_cmk,
    control.container_instance_container_group_encrypted_using_cmk,
    control.container_registry_encrypted_with_cmk,
    control.cosmosdb_account_encryption_at_rest_using_cmk,
    control.databricks_workspace_cmk_configured,
    control.eventhub_namespace_cmk_encryption_enabled,
    control.hdinsight_cluster_encrypted_at_rest_with_cmk,
    control.healthcare_fhir_azure_api_encrypted_at_rest_with_cmk,
    control.hpc_cache_encrypted_with_cmk,
    control.kusto_cluster_encrypted_at_rest_with_cmk,
    control.machine_learning_workspace_encrypted_with_cmk,
    control.mysql_server_encrypted_at_rest_using_cmk,
    control.servicebus_premium_namespace_cmk_encrypted,
    control.sql_server_tde_protector_cmk_encrypted,
    control.storage_account_encryption_at_rest_using_cmk,
    control.synapse_workspace_encryption_at_rest_using_cmk
  ]

   tags = merge(local.cis_v400_2_1_1_2_common_tags, {
    cis_item_id = "2.1.1.2.1"
    cis_level   = "2"
    cis_type    = "manual"
  })
}

benchmark "cis_v400_2_2" {
  title         = "2.2 Networking"
  documentation = file("./cis_v400/docs/cis_v400_2_2.md")
  children = [
    benchmark.cis_v400_2_2_1,
    benchmark.cis_v400_2_2_2
  ]

  tags = merge(local.cis_v400_2_2_common_tags, {
    type    = "Benchmark"
  })
}

benchmark "cis_v400_2_2_1" {
  title         = "2.2.1 Virtual Networks (VNets)"
  documentation = file("./cis_v400/docs/cis_v400_2_2_1.md")
  children = [
    benchmark.cis_v400_2_2_1_1,
    benchmark.cis_v400_2_2_1_2
  ]

  tags = merge(local.cis_v400_2_2_1_common_tags, {
    type    = "Benchmark"
  })
}

benchmark "cis_v400_2_2_1_1" {
  title         = "2.2.1.1 Ensure public network access is Disabled"
  description   = "Disable public network access to prevent exposure to the internet and reduce the risk of unauthorized access."
  documentation = file("./cis_v400/docs/cis_v400_2_2_1_1.md")
  children = [
    control.cognitive_account_public_network_access_disabled,
    control.container_registry_public_network_access_disabled,
    control.data_factory_public_network_access_disabled,
    control.keyvault_vault_public_network_access_disabled,
    control.mariadb_server_public_network_access_disabled,
    control.mysql_server_public_network_access_disabled,
    control.postgresql_server_public_network_access_disabled,
    control.search_service_public_network_access_disabled,
    control.sql_db_public_network_access_disabled,
    control.storage_account_public_network_access_disabled
  ]

  tags = merge(local.cis_v400_2_2_1_common_tags, {
    cis_item_id = "2.2.1.1"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

benchmark "cis_v400_2_2_1_2" {
  title         = "2.2.1.2 Ensure Network Access Rules are set to Deny-by-default"
  description   = "Restricting default network access provides a foundational level of security to networked resources."
  documentation = file("./cis_v400/docs/cis_v400_2_2_1_2.md")
  children = [
    control.cognitive_account_restrict_public_access,
    control.compute_disk_public_access_disabled,
    control.container_registry_restrict_public_access,
    control.servicebus_namespace_no_overly_permissive_network_access,
    control.storage_account_default_network_access_rule_denied
  ]

  tags = merge(local.cis_v400_2_2_1_common_tags, {
    cis_item_id = "2.2.1.2"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

benchmark "cis_v400_2_2_2" {
  title         = "2.2.2 Private Endpoints"
  documentation = file("./cis_v400/docs/cis_v400_2_2_2.md")
  children = [
    benchmark.cis_v400_2_2_2_1
  ]

  tags = merge(local.cis_v400_2_2_2_common_tags, {
    type    = "Benchmark"
  })
}

benchmark "cis_v400_2_2_2_1" {
  title         = "2.2.2.1 Ensure Private Endpoints are used to access {service}"
  description   = "Use private endpoints to allow clients and services to securely access data located over a network via an encrypted Private Link."
  documentation = file("./cis_v400/docs/cis_v400_2_2_2_1.md")
  children = [
    control.app_configuration_private_link_used,
    control.cognitive_account_private_link_used,
    control.compute_disk_access_uses_private_link,
    control.container_registry_uses_private_link,
    control.cosmosdb_account_uses_private_link,
    control.data_factory_uses_private_link,
    control.eventgrid_domain_private_link_used,
    control.eventgrid_topic_private_link_used,
    control.eventhub_namespace_private_link_used,
    control.healthcare_fhir_uses_private_link,
    control.iot_hub_private_link_used,
    control.keyvault_vault_private_link_used,
    control.mariadb_server_private_link_used,
    control.mysql_server_private_link_used,
    control.postgres_server_private_link_used,
    control.recovery_service_vault_uses_private_link,
    control.redis_cache_uses_private_link,
    control.search_service_uses_private_link,
    control.servicebus_name_space_private_link_used,
    control.signalr_service_private_link_used,
    control.sql_server_uses_private_link,
    control.storage_account_uses_private_link,
    control.storage_sync_private_link_used,
    control.synapse_workspace_private_link_used
  ]

 tags = merge(local.cis_v400_2_2_2_common_tags, {
    cis_item_id = "2.2.2.1"
    cis_level   = "2"
    cis_type    = "automated"
  })
}
