## v2.0.0 [2025-08-04]

_Breaking changes_

- Renamed the following controls to align with their focus on classic logging for the respective service types: ([#322](https://github.com/turbot/steampipe-mod-azure-compliance/pull/322))
  - `storage_account_blobs_logging_enabled` to `storage_account_blob_service_classic_logging_enabled`
  - `storage_account_queues_logging_enabled ` to `storage_account_queue_service_classic_logging_enabled`
  - `storage_account_tables_logging_enabled ` to `storage_account_table_service_classic_logging_enabled`

_Dependencies_

- Azure plugin `v1.5.1` or higher is now required.

_Enhancements_

- Added new automated queries for the following CIS controls: ([#323](https://github.com/turbot/steampipe-mod-azure-compliance/pull/323))
  - `cis_v150_3_3`
  - `cis_v200_3_3`
  - `cis_v200_5_1_7`
  - `cis_v210_5_1_6`
  - `cis_v300_4_3`
  - `cis_v300_6_1_6`
  - `cis_v400_10_3_1_1`
  - `cis_v400_7_1_1_6`
- Added `appservice_web_app_diagnostic_log_category_http_log_enabled` and `storage_account_key_rotation_reminder_enabled` controls to the `All Controls` benchmark. ([#323](https://github.com/turbot/steampipe-mod-azure-compliance/pull/323))

_Bug fixes_

- Fixed `keyvault_logging_enabled` query to correctly verify logging for Azure Key Vaults. ([#320](https://github.com/turbot/steampipe-mod-azure-compliance/pull/320))

## v1.5.0 [2025-07-31]

_Enhancements_

- Added new automated queries for the following CIS controls: ([#317](https://github.com/turbot/steampipe-mod-azure-compliance/pull/317))
  - `cis_v150_1_2_1`
  - `cis_v200_1_2_1`
  - `cis_v200_5_1_7`
  - `cis_v210_1_2_1`
  - `cis_v210_5_1_6`
  - `cis_v210_7_9`
  - `cis_v300_2_2_1`
  - `cis_v300_4_16`
  - `cis_v300_6_1_6`
  - `cis_v300_8_11`
- Added controls `compute_vm_trust_launch_enabled` and `iam_conditional_access_trusted_location_configured` to the `All Controls` benchmark. ([#317](https://github.com/turbot/steampipe-mod-azure-compliance/pull/317))
- Added variable support for App Service controls to improve configurability: ([#317](https://github.com/turbot/steampipe-mod-azure-compliance/pull/317))
  - `appservice_web_app_latest_python_version` - Configurable Python version validation for web app
  - `appservice_web_app_latest_java_version` - Configurable Java version validation for web app
  - `appservice_function_app_latest_python_version` - Configurable Python version validation for function app
  - `appservice_function_app_latest_java_version` - Configurable Java version validation for function app

_Bug fixes_

- Fixed the `iam_global_administrator_max_5` query to correctly check for a minimum of 2 and a maximum of 5 administrators. ([#318](https://github.com/turbot/steampipe-mod-azure-compliance/pull/318))
- Fixed `cis_v300_3_1_4_2` control by removing the invalid query reference and marking it as manual. ([#317](https://github.com/turbot/steampipe-mod-azure-compliance/pull/317))
- Fixed `appservice_function_app_latest_java_version` query to correctly check results for both Linux and Windows operating system web app. ([#317](https://github.com/turbot/steampipe-mod-azure-compliance/pull/317))
- Fixed `appservice_web_app_latest_java_version` query to correctly check results for both Linux and Windows operating system function app. ([#317](https://github.com/turbot/steampipe-mod-azure-compliance/pull/317))

## v1.4.0 [2025-07-03]

_Enhancements_

- Added control `storage_account_blob_public_access_disabled` to the `All Controls` benchmark to enforce that public access to blob containers is disabled. ([#309](https://github.com/turbot/steampipe-mod-azure-compliance/issues/309))

_Bug fixes_

- Renamed the query `storage_account_blob_containers_public_access_private` to `storage_account_blob_containers_public_access_disabled` for clarity and better alignment with the actual condition being checked. ([#309](https://github.com/turbot/steampipe-mod-azure-compliance/issues/309))
- Fixed the `securitycenter_container_image_scan_enabled` query to include the common dimensions (`resource_group`, `subscription`). ([#308](https://github.com/turbot/steampipe-mod-azure-compliance/issues/308))
- Fixed the `storage_account_blob_versioning_enabled` query by adding the missing common dimensions (`resource_group`, `subscription`). ([#307](https://github.com/turbot/steampipe-mod-azure-compliance/issues/307))

## v1.3.1 [2025-05-13]

_Bug fixes_

- Fixed the ordering of sub-benchmark `cis_v400_10` in the `cis_v400` benchmark. ([#305](https://github.com/turbot/steampipe-mod-azure-compliance/pull/305))
- Fixed an issue where sub-benchmark `nist_csf_v2_id_ra_04` was missing from the `nist_csf_v2` benchmark. ([#305](https://github.com/turbot/steampipe-mod-azure-compliance/pull/305))

## v1.3.0 [2025-05-12]

_Dependencies_

- Azure plugin `v1.4.0` or higher is now required.

_What's new?_

- Added CIS v4.0.0 benchmark (`powerpipe benchmark run azure_compliance.benchmark.cis_v400`). ([#300](https://github.com/turbot/steampipe-mod-azure-compliance/pull/300))
- Added NIST CSF v2.0 benchmark (`powerpipe benchmark run azure_compliance.benchmark.nist_csf_v2`). ([#302](https://github.com/turbot/steampipe-mod-azure-compliance/pull/302))

## v1.2.1 [2024-04-14]

_Bug fixes_

- Fixed the naming of `Event Hubs` and `Recovery Services` service tags to match the naming conventions used in the Azure plugin. ([#298](https://github.com/turbot/steampipe-mod-azure-compliance/pull/298))

## v1.2.0 [2024-11-14]

_Dependencies_

- Azure plugin `v1.1.0` or higher is now required. ([#290](https://github.com/turbot/steampipe-mod-azure-compliance/pull/290))

_Enhancements_

- Added the following controls to the `All Controls` benchmark: ([#290](https://github.com/turbot/steampipe-mod-azure-compliance/pull/290))
  - `mysql_flexible_server_audit_logging_enabled`
  - `mysql_flexible_server_audit_logging_events_connection_set`
  - `mysql_flexible_server_min_tls_1_2`
  - `mysql_flexible_server_ssl_enabled`
  - `postgres_flexible_server_allow_access_to_azure_services_disabled`
  - `postgres_flexible_server_connection_throttling_on`
  - `postgres_flexible_server_log_checkpoints_on`
  - `postgres_flexible_server_log_retention_days_3`
  - `postgres_sql_flexible_server_ssl_enabled`

_Bug fixes_

- Fixed the `cis_v300_5_2_5` control to correctly use `postgres_flexible_server_allow_access_to_azure_services_disabled` query instead of `postgres_db_server_allow_access_to_azure_services_disabled` query. ([#290](https://github.com/turbot/steampipe-mod-azure-compliance/pull/290))

## v1.1.0 [2024-10-30]

_What's new?_

- Added CIS v3.0.0 benchmark (`powerpipe benchmark run azure_compliance.benchmark.cis_v300`). ([#282](https://github.com/turbot/steampipe-mod-azure-compliance/pull/282))

## v1.0.1 [2024-10-24]

_Bug fixes_

- Renamed `steampipe.spvars.example` files to `powerpipe.ppvars.example` and updated documentation. ([#287](https://github.com/turbot/steampipe-mod-azure-compliance/pull/287))

## v1.0.0 [2024-10-22]

This mod now requires [Powerpipe](https://powerpipe.io). [Steampipe](https://steampipe.io) users should check the [migration guide](https://powerpipe.io/blog/migrating-from-steampipe).

## v0.47 [2024-08-02]

_Enhancements_

- Added the following controls to the `All Controls` benchmark: ([#274](https://github.com/turbot/steampipe-mod-azure-compliance/pull/274))
  - `application_gateway_waf_uses_specified_mode`
  - `application_insights_block_log_ingestion_and_querying_from_public`
  - `log_analytics_workspace_block_log_ingestion_and_querying_from_public`
  - `log_analytics_workspace_block_non_azure_ingestion`

_Bug fixes_

- Fixed the `storage_account_block_public_access` query to check if the `public_network_access` column is set to `disabled` as per the CIS documentation. ([#277](https://github.com/turbot/steampipe-mod-azure-compliance/pull/277))

## v0.46 [2024-06-14]

_What's new?_

- Added FedRAMP High benchmark (`powerpipe benchmark run azure_compliance.benchmark.fedramp_high`). ([#270](https://github.com/turbot/steampipe-mod-azure-compliance/pull/270))

## v0.45 [2024-05-31]

_What's new?_

- Added Reserve Bank of India - IT Framework for NBFC Regulatory Compliance
benchmark (`powerpipe benchmark run azure_compliance.benchmark.rbi_itf_nbfc_v2017`). ([#267](https://github.com/turbot/steampipe-mod-azure-compliance/pull/267))

## v0.44 [2024-05-16]

_What's new?_

- Added NIST SP 800-171 Revision 2 benchmark (`powerpipe benchmark run azure_compliance.benchmark.nist_sp_800_171_rev_2`). ([#264](https://github.com/turbot/steampipe-mod-azure-compliance/pull/264))

## v0.43 [2024-04-05]

_Enhancements_

- Added the following controls to the `All Controls` benchmark: ([#253](https://github.com/turbot/steampipe-mod-azure-compliance/pull/253))
  - `cosmosdb_account_uses_aad_and_rbac`
  - `iam_user_not_allowed_to_create_tenants`
  - `securitycenter_image_scan_enabled`

_Bug fixes_

- Updated the `postgres_db_server_allow_access_to_azure_services_disabled` query to check if the `endIpAddress` column is set to `0.0.0.0` instead of `255.255.255.255` as per the CIS documentation. ([#253](https://github.com/turbot/steampipe-mod-azure-compliance/pull/253))

## v0.42 [2024-03-15]

_What's new?_

- Added CIS v2.1.0 benchmark (`powerpipe benchmark run azure_compliance.benchmark.cis_v210`). ([#250](https://github.com/turbot/steampipe-mod-azure-compliance/pull/250))

## v0.41 [2024-04-06]

_Powerpipe_

[Powerpipe](https://powerpipe.io) is now the preferred way to run this mod!  [Migrating from Steampipe →](https://powerpipe.io/blog/migrating-from-steampipe)

All v0.x versions of this mod will work in both Steampipe and Powerpipe, but v1.0.0 onwards will be in Powerpipe format only.

_Enhancements_

- Focus documentation on Powerpipe commands.
- Show how to combine Powerpipe mods with Steampipe plugins.

## v0.40 [2024-01-30]

_Enhancements_

- Added 41 new controls to the `All Controls` benchmark across the following services: ([#234](https://github.com/turbot/steampipe-mod-azure-compliance/pull/234) [#233](https://github.com/turbot/steampipe-mod-azure-compliance/pull/233))
  - `Active Directory`
  - `App Service`
  - `Batch`
  - `Compute`
  - `Container Instance`
  - `Key Vault`
  - `Kubernetes Service`
  - `Network`
  - `Recovery Service`
  - `Service Bus`
  - `Storage`

_Dependencies_

- Azure plugin `v0.53.0` or higher is now required. ([#242](https://github.com/turbot/steampipe-mod-azure-compliance/pull/242))

_Bug fixes_

- Fixed the description of `CIS_v150_2_1_9` control. ([#238](https://github.com/turbot/steampipe-mod-azure-compliance/pull/238)) (Thanks [@sfunkernw](https://github.com/sfunkernw) for the contribution!)

## v0.39 [2024-01-09]

_Bug fixes_

- Fixed the `kubernetes_cluster_upgraded_with_non_vulnerable_version` query to correctly check if a Kubernetes cluster is using an outdated software version. ([#235](https://github.com/turbot/steampipe-mod-azure-compliance/pull/235))

## v0.38 [2023-11-27]

_Bug fixes_

- Fixed `ad_guest_user_reviewed_monthly`, `iam_deprecated_account_with_owner_roles`, `iam_external_user_with_read_permission`, `iam_external_user_with_write_permission`, `iam_user_not_allowed_to_create_security_group` and `iam_user_not_allowed_to_register_application` queries to remove duplicate benchmark results. ([#228](https://github.com/turbot/steampipe-mod-azure-compliance/pull/228))

## v0.37 [2023-11-03]

_Breaking changes_

- Updated the plugin dependency section of the mod to use `min_version` instead of `version`. ([#222](https://github.com/turbot/steampipe-mod-azure-compliance/pull/222))

_Bug fixes_

- Fixed the `compute_vm_tcp_udp_access_restricted_internet` query to ensure internet-facing virtual machines are protected with network security groups. ([#224](https://github.com/turbot/steampipe-mod-azure-compliance/pull/224))

## v0.36 [2023-10-20]

_Bug fixes_

- Fix README to include correct reference to the `All Controls` benchmark. ([#218](https://github.com/turbot/steampipe-mod-azure-compliance/pull/218)) (Thanks [@vil02](https://github.com/vil02) for the contribution!)

## v0.35 [2023-08-31]

_Breaking changes_

- The `Other Compliance Checks` benchmark (`steampipe check benchmark.other_checks`) has been removed and replaced by the new `All Controls` benchmark (`steampipe check benchmark.all_controls`). This new benchmark includes 353 service-specific controls. ([#212](https://github.com/turbot/steampipe-mod-azure-compliance/pull/212))

## v0.34 [2023-08-10]

_Enhancements_

- The `Other Compliance Checks` benchmark has been restructured to include sub-benchmarks for the various Azure services.
  - The following controls have been added across the benchmarks: ([#209](https://github.com/turbot/steampipe-mod-azure-compliance/pull/209))
    - `compute_vm_data_and_os_disk_uses_managed_disk`
    - `appservice_plan_minimum_sku`
    - `appservice_web_app_always_on`
    - `appservice_web_app_health_check_enabled`
    - `compute_vm_scale_set_automatic_upgrade_enabled`
    - `compute_vm_scale_set_ssh_key_authentication_linux`
    - `container_instance_container_group_in_virtual_network`
    - `eventgrid_topic_identity_provider_enabled`
    - `eventgrid_topic_local_auth_enabled`
    - `kubernetes_cluster_key_vault_secret_rotation_enabled`
    - `kubernetes_cluster_logging_enabled`
    - `kubernetes_cluster_max_pod_50`
    - `kubernetes_cluster_network_policy_enabled`
    - `kusto_cluster_sku_with_sla`
    - `mariadb_server_ssl_enabled`
    - `monitor_log_profile_retention_365_days`
    - `postgres_db_server_latest_tls_version`
    - `redis_cache_min_tls_1_2`
    - `search_service_replica_count_3`
    - `search_service_uses_managed_identity`
    - `securitycenter_pricing_standard`
    - `signalr_service_no_free_tier_sku`
    - `sql_server_threat_detection_all_enabled`
    - `synapse_workspace_data_exfiltration_protection_enabled`

## v0.33 [2023-08-03]

_Enhancements_

- Added the following controls to `Other Compliance Checks` benchmark: ([#206](https://github.com/turbot/steampipe-mod-azure-compliance/pull/206))
  - `apimanagement_service_client_certificate_enabled`
  - `app_configuration_encryption_enabled`
  - `app_configuration_restrict_public_access`
  - `app_configuration_sku_standard`
  - `appservice_web_app_failed_request_tracing_enabled`
  - `appservice_web_app_http_logs_enabled`
  - `appservice_web_app_latest_dotnet_framework_version`
  - `appservice_web_app_slot_use_https`
  - `appservice_web_app_worker_more_than_one`
  - `container_registry_admin_user_disabled`
  - `container_registry_geo_replication_enabled`
  - `container_registry_public_network_access_disabled`
  - `container_registry_quarantine_policy_enabled`
  - `container_registry_retention_policy_enabled`
  - `container_registry_trust_policy_enabled`
  - `cosmosdb_account_key_based_metadata_write_access_disabled`
  - `data_factory_public_network_access_disabled`
  - `data_factory_uses_git_repository`
  - `eventgrid_domain_identity_provider_enabled`
  - `eventgrid_domain_restrict_public_access`
  - `kubernetes_cluster_addon_azure_policy_enabled`
  - `kubernetes_cluster_node_restrict_public_access`
  - `kubernetes_cluster_restrict_public_access`
  - `kubernetes_cluster_sku_standard`
  - `kubernetes_cluster_upgrade_channel`

## v0.32 [2023-07-28]

_Bug fixes_

- Fixed the `monitor_log_alert_*` queries to correctly evaluate the activity log alerts of different Azure resource types. ([#203](https://github.com/turbot/steampipe-mod-azure-compliance/pull/203)) (Thanks [@KingBrewer](https://github.com/KingBrewer) for the contribution!)

## v0.31 [2023-07-26]

_Breaking changes_

- The following duplicate controls that were used in the `nist_sp_800_53_rev_5` and `other_checks` benchmarks have been removed: ([#197](https://github.com/turbot/steampipe-mod-azure-compliance/pull/197))
  - `appservice_azure_defender_enabled`
  - `compute_vm_azure_defender_enabled`
  - `container_registry_azure_defender_enabled`
  - `dns_azure_defender_enabled`
  - `keyvault_azure_defender_enabled`
  - `kubernetes_azure_defender_enabled`
  - `resource_manager_azure_defender_enabled`
  - `sql_database_server_azure_defender_enabled`
  - `sql_server_vm_azure_defender_enabled`
  - `storage_azure_defender_enabled`

_Dependencies_

- Azure plugin `v0.46.0` or higher is now required. ([#195](https://github.com/turbot/steampipe-mod-azure-compliance/pull/195))

_Enhancements_

- Added the following control to `nist_sp_800_53_rev_5` benchmark: ([#194](https://github.com/turbot/steampipe-mod-azure-compliance/pull/194))
  - `container_instance_container_group_encrypted_using_cmk`

## v0.30 [2023-07-20]

_Breaking changes_

- The `NIST SP 800-53 Rev 5` benchmark has been updated to better align with the matching [NIST SP 800-53 Rev. 5 Regulatory Compliance](https://learn.microsoft.com/en-us/azure/governance/policy/samples/nist-sp-800-53-r5). The following updates have been made to the benchmark: ([#189](https://github.com/turbot/steampipe-mod-azure-compliance/pull/189))
  - The following controls have been added across the benchmarks:
    - `appservice_api_app_client_certificates_on`
    - `appservice_web_app_client_certificates_on`
    - `sql_database_transparent_data_encryption_enabled`
    - `sql_server_tde_protector_cmk_encrypted`
  - The following controls are no longer included in the benchmarks:
    - `appservice_api_app_use_https`
    - `appservice_api_app_uses_managed_identity`
    - `appservice_function_app_latest_java_version`
    - `appservice_function_app_latest_python_version`
    - `appservice_web_app_client_certificates_on`
    - `appservice_web_app_ftps_enabled`
    - `appservice_web_app_latest_java_version`
    - `appservice_web_app_latest_php_version`
    - `appservice_web_app_latest_python_version`
    - `appservice_web_app_latest_tls_version`
    - `appservice_web_app_remote_debugging_disabled`
    - `azure_redis_cache_in_virtual_network`
    - `compute_vm_log_analytics_agent_health_issues_resolved`
    - `compute_vm_scale_set_logging_enabled`
    - `container_registry_azure_defender_enabled`
    - `keyvault_vault_public_network_access_disabled`
    - `kubernetes_azure_defender_enabled`

_What's new?_

- Added `Other Compliance Checks` benchmark (steampipe check benchmark.other). ([#189](https://github.com/turbot/steampipe-mod-azure-compliance/pull/189))

_Bug fixes_

- Fixed the `cis_v130_5_1_3`, `cis_v140_5_1_3`, `cis_v150_5_1_3`, and `cis_v200_5_1_3` controls to correctly use `monitor_logs_storage_container_insights_activity_logs_encrypted_with_byok` query instead of `monitor_logs_storage_container_encryptes_with_byok` query. ([#187](https://github.com/turbot/steampipe-mod-azure-compliance/pull/187)) (Thanks [@KingBrewer](https://github.com/KingBrewer) for the contribution!)
- Fixed the `cis_v130_5_1_2`, `cis_v140_5_1_2`, `cis_v150_5_1_2`, and `cis_v200_5_1_2` controls to correctly use `monitor_logs_storage_container_insights_operational_logs_not_public_accessible` query instead of `monitor_logs_storage_container_not_public_accessible` query. ([#185](https://github.com/turbot/steampipe-mod-azure-compliance/pull/185)) (Thanks [@KingBrewer](https://github.com/KingBrewer) for the contribution!)

## v0.29 [2023-07-07]

_Enhancements_

- Updated the titles and descriptions of several `PCI DSS v3.2.1` sub-benchmarks to better align with the matching [PCI DSS 3.2.1 built-in Regulatory Compliance](https://learn.microsoft.com/en-us/azure/governance/policy/samples/pci-dss-3-2-1). ([#176](https://github.com/turbot/steampipe-mod-azure-compliance/pull/176))

## v0.28 [2023-06-29]

_Breaking changes_

- The `HIPAA HITRUST v9.2` benchmark has been updated to better align with the matching [HIPAA HITRUST 9.2 Regulatory Compliance](https://learn.microsoft.com/en-us/azure/governance/policy/samples/hipaa-hitrust-9-2). The following updates have been made to the benchmark: ([#175](https://github.com/turbot/steampipe-mod-azure-compliance/pull/175))
  - The following controls have been added across the benchmarks:
    - `appservice_api_app_client_certificates_on`
    - `appservice_web_app_client_certificates_on`
    - `sql_database_transparent_data_encryption_enabled`
  - The following controls are no longer included in the benchmarks:
    - `appservice_web_app_cors_no_star`
    - `appservice_web_app_incoming_client_cert_on`
    - `appservice_web_app_latest_tls_version`
    - `compute_os_and_data_disk_encrypted_with_cmk`
    - `compute_unattached_disk_encrypted_with_cmk`
    - `iam_no_custom_subscription_owner_roles_created`
    - `sql_server_transparent_data_encryption_enabled`

_Bug fixes_

- Fixed the `cis_v130_4_1_2`, `cis_v140_4_1_2`, `cis_v150_4_1_5`, `cis_v200_4_1_5` controls to correctly use `sql_database_transparent_data_encryption_enabled` query instead of `sql_server_transparent_data_encryption_enabled` query. ([#178](https://github.com/turbot/steampipe-mod-azure-compliance/pull/178))

## v0.27 [2023-06-21]

_Enhancements_

- Added query `storage_account_table_service_logging_enabled` for `cis_v200_3_14` control. ([#170](https://github.com/turbot/steampipe-mod-azure-compliance/pull/170)) (Thanks [@KingBrewer](https://github.com/KingBrewer) for the contribution!)

_Bug fixes_

- Fixed `postgres_db_server_allow_access_to_azure_services_disabled` and `sql_database_allow_internet_access` queries to correctly check for `startIpAddress` and `endIpAddress` parameters of firewall rules as per CIS documentation. ([#170](https://github.com/turbot/steampipe-mod-azure-compliance/pull/170)) ([#172](https://github.com/turbot/steampipe-mod-azure-compliance/pull/172)) (Thanks [@KingBrewer](https://github.com/KingBrewer) for the contribution!)

## v0.26 [2023-05-30]

_Dependencies_

- Azure plugin `v0.43.0` or higher is now required. ([#167](https://github.com/turbot/steampipe-mod-azure-compliance/pull/167))

_Enhancements_

- Added query `postgres_db_server_allow_access_to_azure_services_disabled` for `cis_v200_4_3_7` control. ([#164](https://github.com/turbot/steampipe-mod-azure-compliance/pull/164))
- Added query `storage_account_table_service_logging_enabled` for `cis_v150_3_14` control. ([#165](https://github.com/turbot/steampipe-mod-azure-compliance/pull/165))

_Bug fixes_

- Fixed dashboard localhost URLs in README and index doc. ([#157](https://github.com/turbot/steampipe-mod-azure-compliance/pull/157))

## v0.25 [2023-05-26]

_Bug fixes_

- Fixed `storage_account_use_virtual_service_endpoint` and `storage_account_uses_private_link` queries to use `storage_account_id` and `id` columns respectively as resources instead of the `name` columns to maintain consistency in indicating vulnerable resources. ([#161](https://github.com/turbot/steampipe-mod-azure-compliance/pull/161))
- Fixed dashboard localhost URLs in README and index doc. ([#157](https://github.com/turbot/steampipe-mod-azure-compliance/pull/157))

## v0.24 [2023-04-05]

_What's new?_

- Added `tags` as dimensions to group and filter findings. (see [var.tag_dimensions](https://hub.steampipe.io/mods/turbot/azure_compliance/variables)) ([#154](https://github.com/turbot/steampipe-mod-azure-compliance/pull/154))
- Added `connection_name`, `region` and `subscription_id` in the common dimensions to group and filter findings. (see [var.common_dimensions](https://hub.steampipe.io/mods/turbot/azure_compliance/variables)) ([#154](https://github.com/turbot/steampipe-mod-azure-compliance/pull/154))

## v0.23 [2023-03-20]

_Bug fixes_

- Fixed the ordering of sub-benchmarks and controls in `cis_v200_5` benchmark. ([#151](https://github.com/turbot/steampipe-mod-azure-compliance/pull/151))

## v0.22 [2023-03-20]

_Dependencies_

- Azure plugin `v0.38.0` or higher is now required. ([#147](https://github.com/turbot/steampipe-mod-azure-compliance/pull/147))

_What's new?_

- Added CIS v2.0.0 benchmark (`steampipe check azure_compliance.benchmark.cis_v200`). ([#147](https://github.com/turbot/steampipe-mod-azure-compliance/pull/147))

## v0.21 [2023-02-28]

_Dependencies_

- Azure plugin `v0.37.0` or higher is now required. ([#143](https://github.com/turbot/steampipe-mod-azure-compliance/pull/143))

_What's new?_

- Added PCI DSS 3.2.1 benchmark (`steampipe check azure_compliance.benchmark.pci_dss_v321`). ([#143](https://github.com/turbot/steampipe-mod-azure-compliance/pull/143))

## v0.20 [2022-12-07]

_Bug fixes_

- Fixed `network_security_group_rdp_access_restricted`, `network_security_group_remote_access_restricted` and `network_security_group_ssh_access_restricted` queries to no longer skip network security group rules where the protocol is set to `ANY`, and correctly evaluate the associated controls. ([#138](https://github.com/turbot/steampipe-mod-azure-compliance/pull/138))

## v0.19 [2022-11-10]

_Bug fixes_

- Fixed typo in `cis_v150_3` benchmark title. ([#135](https://github.com/turbot/steampipe-mod-azure-compliance/pull/135)) (Thanks to [@sfunkernw](https://github.com/sfunkernw) for the quick fix!)

## v0.18 [2022-10-12]

_Bug fixes_

- Fixed the formatting in several `CIS v1.5.0 benchmark` documents which would cause the control page to not render correctly on the hub. ([#129](https://github.com/turbot/steampipe-mod-azure-compliance/pull/130))([#130](https://github.com/turbot/steampipe-mod-azure-compliance/pull/130))

## v0.17 [2022-09-08]

_What's new?_

- Added CIS v1.5.0 benchmark (`steampipe check azure_compliance.benchmark.cis_v150`). ([#127](https://github.com/turbot/steampipe-mod-azure-compliance/pull/127))

_Bug fixes_

- Fixed `iam_deprecated_account` query incorrectly returning `nil` for any rows in alarm state. ([#125](https://github.com/turbot/steampipe-mod-azure-compliance/pull/125))

## v0.16 [2022-08-10]

_Bug fixes_

- Fixed the `storage_account_blob_containers_public_access_private` query to correctly check if the Azure storage containers and Azure storage accounts are public or not. ([#120](https://github.com/turbot/steampipe-mod-azure-compliance/pull/120))
- Fixed the `network_security_group_rdp_access_restricted`, `network_security_group_remote_access_restricted` and `network_security_group_ssh_access_restricted` queries which would cause the corresponding CIS controls to incorrectly be in `ok` state instead of `alarm`, even though RDP and SSH access was enabled on network security groups. ([#122](https://github.com/turbot/steampipe-mod-azure-compliance/pull/122))

## v0.15 [2022-07-28]

_Bug fixes_

- Added the missing `/>` tag in the dashboard images section of `docs/index.md` file which would cause a failure in loading the mod overview page on [hub.steampipe.io](https://hub.steampipe.io/mods). ([#117](https://github.com/turbot/steampipe-mod-azure-compliance/pull/117))

## v0.14 [2022-07-27]

_What's new?_

- Added CIS v1.4.0 benchmark (`steampipe check azure_compliance.benchmark.cis_v140`). ([#112](https://github.com/turbot/steampipe-mod-azure-compliance/pull/112))

_Bug fixes_

- Fixed the `sql_server_azure_ad_authentication_enabled` query to correctly be in `alarm` state for SQL servers where the Azure AD authentication is disabled.

## v0.13 [2022-05-12]

_Bug fixes_

- Fixed `sql_server_auditing_storage_account_destination_retention_90_days` and `sql_server_auditing_retention_period_90` queries to correctly evaluate the SQL servers when the audit retention period is set to `0`. ([#105](https://github.com/turbot/steampipe-mod-azure-compliance/pull/105))

## v0.12 [2022-05-09]

_Enhancements_

- Updated docs/index.md and README with new dashboard screenshots and latest format. ([#102](https://github.com/turbot/steampipe-mod-azure-compliance/pull/102))

## v0.11 [2022-05-02]

_Enhancements_

- Added `category`, `service`, and `type` tags to benchmarks and controls. ([#98](https://github.com/turbot/steampipe-mod-azure-compliance/pull/98))

## v0.10 [2022-01-27]

_Enhancements_

- Updated the `hdinsight_cluster_encrypted_at_rest_with_cmk`, `hdinsight_cluster_encryption_at_host_enabled` and `hdinsight_cluster_encryption_in_transit_enabled` queries to skip those Azure HDInsight clusters where the `provisioning_state` is not `Succeeded` ([#93](https://github.com/turbot/steampipe-mod-azure-compliance/pull/93))

_Bug fixes_

- Fixed the `nist_sp_800_53_rev_5_sc_5` benchmark to correctly reference `network_ddos_enabled` control instead of `network_security_group_udp_service_restricted` control ([#88](https://github.com/turbot/steampipe-mod-azure-compliance/pull/88))
- Fixed the `application_gateway_waf_enabled` control to correctly use `nist_sp_800_53_rev_5 = true` tag instead of `hipaa_hitrust_v92 = true` tag ([#88](https://github.com/turbot/steampipe-mod-azure-compliance/pull/88))

## v0.9 [2021-12-16]

_Enhancements_

- Updated `ad_guest_user_reviewed_monthly`, `iam_deprecated_account`, `iam_deprecated_account_with_owner_roles`, `iam_external_user_with_owner_role`, `iam_external_user_with_read_permission` and `iam_external_user_with_write_permission` queries to use azuread plugin tables instead of deprecated azure tables ([#83](https://github.com/turbot/steampipe-mod-azure-compliance/pull/83))

- Updated the `README` and the `docs/index.md` files to include additional prerequisites for running the compliance checks ([#84](https://github.com/turbot/steampipe-mod-azure-compliance/pull/84))

## v0.8 [2021-11-17]

_Bug fixes_

- Fixed the `mssql_managed_instance_vulnerability_assessment_enabled` query to correctly check if the periodic vulnerability scanning is enabled for a managed SQL instance

## v0.7 [2021-11-10]

_Enhancements_

- `docs/index.md` file now includes the console output image

## v0.6 [2021-10-12]

_What's new?_

- Added: NIST SP 800-53 Revision 5 benchmark (`steampipe check azure_compliance.benchmark.nist_sp_800_53_rev_5`)

## v0.5 [2021-09-02]

_Enhancements_

- Titles of all the HIPAA HITRUST 9.2 compliance benchmarks have been updated for better readability

## v0.4 [2021-08-26]

_What's new?_

- Added: HIPAA HITRUST 9.2 benchmark (`steampipe check azure_compliance.benchmark.hipaa_hitrust_v92`)

## v0.3 [2021-05-28]

_Bug fixes_

- Minor fixes in the docs

## v0.2 [2021-05-27]

_What's new?_

- Added: Documentation for CIS v1.3.0 benchmarks 1 - 9
- New CIS v1.3.0 controls added
  - 1.22
  - 2.13 - 2.15
  - 5.1.1
  - 5.2.1 - 5.2.9
  - 5.3
  - 8.1 - 8.5
  - 9.1 - 9.11
