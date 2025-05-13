benchmark "nist_csf_v2_id" {
  title       = "Identify (ID)"
  description = "The organization's current cybersecurity risks are understood."
  children = [
    benchmark.nist_csf_v2_id_am,
    benchmark.nist_csf_v2_id_ra,
    benchmark.nist_csf_v2_id_im
  ]

  tags = local.nist_csf_v2_common_tags
}

# Asset Management (ID.AM)
benchmark "nist_csf_v2_id_am" {
  title       = "Asset Management (ID.AM)"
  description = "Assets (e.g., data, hardware, software, systems, facilities, services, people) that enable the organization to achieve business purposes are identified and managed consistent with their relative importance to organizational objectives and the organization's risk strategy."
  children = [
    benchmark.nist_csf_v2_id_am_01,
    benchmark.nist_csf_v2_id_am_02,
    benchmark.nist_csf_v2_id_am_03,
    benchmark.nist_csf_v2_id_am_05,
    benchmark.nist_csf_v2_id_am_07,
    benchmark.nist_csf_v2_id_am_08
  ]

  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_id_am_01" {
  title       = "ID.AM-01"
  description = "Inventories of hardware managed by the organization are maintained."
  children = [
    control.compute_vm_guest_configuration_installed,
    control.compute_vm_system_updates_installed,
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_id_am_02" {
  title       = "ID.AM-02"
  description = "Inventories of software, services, and systems managed by the organization are maintained."
  children = [
    control.compute_vm_guest_configuration_installed,
    control.compute_vm_system_updates_installed,
    control.compute_vm_vulnerability_assessment_solution_enabled,
    control.compute_vm_guest_configuration_with_system_assigned_managed_identity,
    control.compute_vm_log_analytics_agent_installed,
    control.compute_vm_scale_set_log_analytics_agent_installed
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_id_am_03" {
  title       = "ID.AM-03"
  description = "Representations of the organization's authorized network communication and internal and external network data flows are maintained."
  children = [
    control.application_gateway_waf_enabled,
    control.keyvault_logging_enabled,
    control.network_security_group_diagnostic_setting_deployed,
    control.network_security_group_subnet_associated,
    control.network_watcher_enabled,
    control.network_sg_flowlog_enabled,
    control.network_watcher_flow_log_enabled,
    control.network_watcher_flow_log_traffic_analytics_enabled
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_id_am_05" {
  title       = "ID.AM-05"
  description = "Assets are prioritized based on classification, criticality, resources, and impact on the mission."
  children = [
    control.keyvault_purge_protection_enabled,
    control.keyvault_soft_delete_enabled,
    control.sql_database_long_term_geo_redundant_backup_enabled,
    control.storage_account_infrastructure_encryption_enabled,
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_id_am_07" {
  title       = "ID.AM-07"
  description = "Inventories of data and corresponding metadata for designated data types are maintained."
  children = [
    control.monitor_log_profile_enabled_for_all_categories,
    control.monitor_log_profile_enabled_for_all_regions,
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_id_am_08" {
  title       = "ID.AM-08"
  description = "Systems, hardware, software, services, and data are managed throughout their life cycles."
  children = [
    control.compute_vm_jit_access_protected,
    control.compute_vm_scale_set_automatic_upgrade_enabled,
    control.compute_vm_system_updates_installed,
    control.compute_vm_vulnerability_assessment_solution_enabled,
    control.sql_database_vulnerability_findings_resolved,
  ]
  tags = local.nist_csf_v2_common_tags
}

# Risk Assessment (ID.RA)
benchmark "nist_csf_v2_id_ra" {
  title       = "Risk Assessment (ID.RA)"
  description = "The cybersecurity risk to the organization, assets, and individuals is understood by the organization."
  children = [
    benchmark.nist_csf_v2_id_ra_01,
    benchmark.nist_csf_v2_id_ra_03,
    benchmark.nist_csf_v2_id_ra_04,
    benchmark.nist_csf_v2_id_ra_05,
    benchmark.nist_csf_v2_id_ra_08,
    benchmark.nist_csf_v2_id_ra_09
  ]

  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_id_ra_01" {
  title       = "ID.RA-01"
  description = "Vulnerabilities in assets are identified, validated, and recorded."
  children = [
    control.compute_vm_vulnerability_assessment_solution_enabled,
    control.sql_server_azure_defender_enabled,
    control.securitycenter_azure_defender_on_for_sqldb,
    control.securitycenter_azure_defender_on_for_sqlservervm
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_id_ra_03" {
  title       = "ID.RA-03"
  description = "Internal and external threats to the organization are identified and recorded."
  children = [
    control.network_watcher_enabled,
    control.securitycenter_azure_defender_on_for_resource_manager,
    control.securitycenter_azure_defender_on_for_opensource_relational_db
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_id_ra_04" {
  title       = "ID.RA-04"
  description = "Potential impacts and likelihoods of threats exploiting vulnerabilities are identified and recorded."
  children = [
    control.compute_vm_vulnerability_assessment_solution_enabled,
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_id_ra_05" {
  title       = "ID.RA-05"
  description = "Threats, vulnerabilities, likelihoods, and impacts are used to understand inherent risk and inform risk response prioritization."
  children = [
    control.compute_vm_vulnerability_assessment_solution_enabled,
    control.network_watcher_enabled,
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_id_ra_08" {
  title       = "ID.RA-08"
  description = "Processes for receiving, analyzing, and responding to vulnerability disclosures are established."
  children = [
    control.compute_vm_vulnerability_assessment_solution_enabled,
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_id_ra_09" {
  title       = "ID.RA-09"
  description = "The authenticity and integrity of hardware and software are assessed prior to acquisition and use."
  children = [
    control.compute_vm_guest_configuration_installed,
    control.compute_vm_vulnerability_assessment_solution_enabled,
  ]
  tags = local.nist_csf_v2_common_tags
}
# Improvement (ID.IM)
benchmark "nist_csf_v2_id_im" {
  title       = "Improvement (ID.IM)"
  description = "Improvements to organizational cybersecurity risk management processes, procedures and activities are identified across all CSF Functions."
  children = [
    benchmark.nist_csf_v2_id_im_02
  ]

  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_id_im_02" {
  title       = "ID.IM-02"
  description = "Improvements are identified from security tests and exercises, including those done in coordination with suppliers and relevant third parties."
  children = [
    control.compute_vm_vulnerability_assessment_solution_enabled,
  ]
  tags = local.nist_csf_v2_common_tags
}
