benchmark "nist_csf_v2_pr" {
  title       = "Protect (PR)"
  description = "Safeguards to manage the organization's cybersecurity risks are used."
  children = [
    benchmark.nist_csf_v2_pr_aa,
    benchmark.nist_csf_v2_pr_at,
    benchmark.nist_csf_v2_pr_ds,
    benchmark.nist_csf_v2_pr_ps,
    benchmark.nist_csf_v2_pr_ir
  ]
}

# Identity Management, Authentication, and Access Control (PR.AA)
benchmark "nist_csf_v2_pr_aa" {
  title       = "Identity Management, Authentication, and Access Control (PR.AA)"
  description = "Access to physical and logical assets is limited to authorized users, services, and hardware and managed commensurate with the assessed risk of unauthorized access."
  children = [
    benchmark.nist_csf_v2_pr_aa_01,
    benchmark.nist_csf_v2_pr_aa_02,
    benchmark.nist_csf_v2_pr_aa_03,
    benchmark.nist_csf_v2_pr_aa_04,
    benchmark.nist_csf_v2_pr_aa_05,
    benchmark.nist_csf_v2_pr_aa_06
  ]
}

benchmark "nist_csf_v2_pr_aa_01" {
  title       = "PR.AA-01"
  description = "Identities and credentials for authorized users, services, and hardware are managed by the organization."
  children = [
    control.iam_no_custom_subscription_owner_roles_created,
    control.iam_subscription_owner_max_3,
  ]
}

benchmark "nist_csf_v2_pr_aa_02" {
  title       = "PR.AA-02"
  description = "Identities are proofed and bound to credentials based on the context of interactions."
  children = [
    control.iam_no_custom_subscription_owner_roles_created,
    control.iam_subscription_owner_max_3,
  ]
}

benchmark "nist_csf_v2_pr_aa_03" {
  title       = "PR.AA-03"
  description = "Users, services, and hardware are authenticated."
  children = [
    control.iam_no_custom_subscription_owner_roles_created,
    control.iam_subscription_owner_max_3,
    control.storage_account_secure_transfer_required_enabled,
  ]
}

benchmark "nist_csf_v2_pr_aa_04" {
  title       = "PR.AA-04"
  description = "Identity assertions are protected, conveyed, and verified."
  children = [
    control.iam_no_custom_subscription_owner_roles_created,
    control.iam_subscription_owner_max_3,
    control.storage_account_secure_transfer_required_enabled
  ]
}

benchmark "nist_csf_v2_pr_aa_05" {
  title       = "PR.AA-05"
  description = "Access permissions, entitlements, and authorizations are defined in a policy, managed, enforced, and reviewed, and incorporate the principles of least privilege and separation of duties."
  children = [
    control.iam_no_custom_subscription_owner_roles_created,
    control.iam_subscription_owner_max_3,
  ]
}

benchmark "nist_csf_v2_pr_aa_06" {
  title       = "PR.AA-06"
  description = "Physical access to assets is managed, monitored, and enforced commensurate with risk."
  children = [
  ]
}

# Awareness and Training (PR.AT)
benchmark "nist_csf_v2_pr_at" {
  title       = "Awareness and Training (PR.AT)"
  description = "The organization's personnel are provided with cybersecurity awareness and training so that they can perform their cybersecurity-related tasks."
  children = [
    benchmark.nist_csf_v2_pr_at_01,
    benchmark.nist_csf_v2_pr_at_02
  ]
}

benchmark "nist_csf_v2_pr_at_01" {
  title       = "PR.AT-01"
  description = "Personnel are provided with awareness and training so that they possess the knowledge and skills to perform general tasks with cybersecurity risks in mind."
  children = [
  ]
}

benchmark "nist_csf_v2_pr_at_02" {
  title       = "PR.AT-02"
  description = "Individuals in specialized roles are provided with awareness and training so that they possess the knowledge and skills to perform relevant tasks with cybersecurity risks in mind."
  children = [
  ]
}

# Data Security (PR.DS)
benchmark "nist_csf_v2_pr_ds" {
  title       = "Data Security (PR.DS)"
  description = "Data are managed consistent with the organization's risk strategy to protect the confidentiality, integrity, and availability of information."
  children = [
    benchmark.nist_csf_v2_pr_ds_01,
    benchmark.nist_csf_v2_pr_ds_02,
    benchmark.nist_csf_v2_pr_ds_10,
    benchmark.nist_csf_v2_pr_ds_11
  ]
}

benchmark "nist_csf_v2_pr_ds_01" {
  title       = "PR.DS-01"
  description = "The confidentiality, integrity, and availability of data-at-rest are protected."
  children = [
    control.storage_account_encryption_at_rest_using_cmk
  ]
}

benchmark "nist_csf_v2_pr_ds_02" {
  title       = "PR.DS-02"
  description = "The confidentiality, integrity, and availability of data-in-transit are protected."
  children = [
    control.appservice_api_app_latest_tls_version,
    control.appservice_function_app_latest_tls_version,
    control.appservice_web_app_latest_tls_version,
    control.storage_account_secure_transfer_required_enabled
  ]
}

benchmark "nist_csf_v2_pr_ds_10" {
  title       = "PR.DS-10"
  description = "The confidentiality, integrity, and availability of data-in-use are protected."
  children = [
  ]
}

benchmark "nist_csf_v2_pr_ds_11" {
  title       = "PR.DS-11"
  description = "Backups of data are created, protected, maintained, and tested."
  children = [
    control.sql_database_long_term_geo_redundant_backup_enabled,
    control.storage_account_geo_redundant_enabled
  ]
}

# Platform Security (PR.PS)
benchmark "nist_csf_v2_pr_ps" {
  title       = "Platform Security (PR.PS)"
  description = "The hardware, software (e.g., firmware, operating systems, applications), and services of physical and virtual platforms are managed consistent with the organization's risk strategy to protect their confidentiality, integrity, and availability."
  children = [
    benchmark.nist_csf_v2_pr_ps_01,
    benchmark.nist_csf_v2_pr_ps_02,
    benchmark.nist_csf_v2_pr_ps_03,
    benchmark.nist_csf_v2_pr_ps_04,
    benchmark.nist_csf_v2_pr_ps_05,
    benchmark.nist_csf_v2_pr_ps_06
  ]
}

benchmark "nist_csf_v2_pr_ps_01" {
  title       = "PR.PS-01"
  description = "Configuration management practices are established and applied."
  children = [
    control.compute_vm_system_updates_installed,
    control.monitor_log_profile_enabled_for_all_regions
  ]
}

benchmark "nist_csf_v2_pr_ps_02" {
  title       = "PR.PS-02"
  description = "Software is maintained, replaced, and removed commensurate with risk."
  children = [
    control.compute_vm_system_updates_installed,
    control.compute_vm_vulnerability_assessment_solution_enabled,
    control.monitor_log_profile_enabled_for_all_regions
  ]
}

benchmark "nist_csf_v2_pr_ps_03" {
  title       = "PR.PS-03"
  description = "Hardware is maintained, replaced, and removed commensurate with risk."
  children = [
    control.compute_vm_system_updates_installed,
    control.monitor_log_profile_enabled_for_all_regions
  ]
}

benchmark "nist_csf_v2_pr_ps_04" {
  title       = "PR.PS-04"
  description = "Log records are generated and made available for continuous monitoring."
  children = [
    control.monitor_log_profile_enabled_for_all_regions
  ]
}

benchmark "nist_csf_v2_pr_ps_05" {
  title       = "PR.PS-05"
  description = "Installation and execution of unauthorized software are prevented."
  children = [
    control.compute_vm_system_updates_installed,
  ]
}

benchmark "nist_csf_v2_pr_ps_06" {
  title       = "PR.PS-06"
  description = "Secure software development practices are integrated, and their performance is monitored throughout the software development life cycle."
  children = [
    control.compute_vm_system_updates_installed,
    control.monitor_log_profile_enabled_for_all_regions
  ]
}

# Technology Infrastructure Resilience (PR.IR)
benchmark "nist_csf_v2_pr_ir" {
  title       = "Technology Infrastructure Resilience (PR.IR)"
  description = "Security architectures are managed with the organization's risk strategy to protect asset confidentiality, integrity, and availability, and organizational resilience."
  children = [
    benchmark.nist_csf_v2_pr_ir_01,
    benchmark.nist_csf_v2_pr_ir_02,
    benchmark.nist_csf_v2_pr_ir_03,
    benchmark.nist_csf_v2_pr_ir_04
  ]
}

benchmark "nist_csf_v2_pr_ir_01" {
  title       = "PR.IR-01"
  description = "Networks and environments are protected from unauthorized logical access and usage."
  children = [
    control.network_security_group_subnet_associated,
    control.network_watcher_enabled,
    control.storage_account_default_network_access_rule_denied
  ]
}

benchmark "nist_csf_v2_pr_ir_02" {
  title       = "PR.IR-02"
  description = "The organization's technology assets are protected from environmental threats."
  children = [
    control.compute_vm_system_updates_installed,
    control.monitor_log_profile_enabled_for_all_regions
  ]
}

benchmark "nist_csf_v2_pr_ir_03" {
  title       = "PR.IR-03"
  description = "Mechanisms are implemented to achieve resilience requirements in normal and adverse situations."
  children = [
    control.sql_database_long_term_geo_redundant_backup_enabled,
    control.storage_account_geo_redundant_enabled
  ]
}

benchmark "nist_csf_v2_pr_ir_04" {
  title       = "PR.IR-04"
  description = "Adequate resource capacity to ensure availability is maintained."
  children = [
    control.monitor_log_profile_enabled_for_all_regions
  ]
} 