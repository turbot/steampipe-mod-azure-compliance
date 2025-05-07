benchmark "nist_csf_v2_gv" {
  title       = "Govern (GV)"
  description = "The organization's cybersecurity risk management strategy, expectations, and policy are established, communicated, and monitored."
  children = [
    benchmark.nist_csf_v2_gv_oc,
    benchmark.nist_csf_v2_gv_rm,
    benchmark.nist_csf_v2_gv_rr,
    benchmark.nist_csf_v2_gv_po,
    benchmark.nist_csf_v2_gv_ov,
    benchmark.nist_csf_v2_gv_sc
  ]
  tags = local.nist_csf_v2_common_tags
}

# Organizational Context (GV.OC)
benchmark "nist_csf_v2_gv_oc" {
  title       = "Organizational Context (GV.OC)"
  description = "The circumstances — mission, stakeholder expectations, dependencies, and legal, regulatory, and contractual requirements — surrounding the organization's cybersecurity risk management decisions are understood."
  children = [
    benchmark.nist_csf_v2_gv_oc_02,
    benchmark.nist_csf_v2_gv_oc_03,
    benchmark.nist_csf_v2_gv_oc_05
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_gv_oc_02" {
  title       = "GV.OC-02"
  description = "Internal and external stakeholders are understood, and their needs and expectations regarding cybersecurity risk management are understood and considered."
  children = [
    control.iam_no_custom_subscription_owner_roles_created,
    control.iam_subscription_owner_max_3,
    control.iam_external_user_with_owner_role,
    control.iam_external_user_with_read_permission,
    control.iam_external_user_with_write_permission,
    control.iam_subscription_owner_more_than_1
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_gv_oc_03" {
  title       = "GV.OC-03"
  description = "Legal, regulatory, and contractual requirements regarding cybersecurity — including privacy and civil liberties obligations — are understood and managed."
  children = [
    control.appservice_api_app_latest_tls_version,
    control.appservice_function_app_latest_tls_version,
    control.appservice_web_app_latest_tls_version,
    control.monitor_log_profile_enabled_for_all_regions,
    control.storage_account_secure_transfer_required_enabled,
    control.appservice_api_app_use_https,
    control.appservice_function_app_only_https_accessible,
    control.keyvault_secret_expiration_set
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_gv_oc_05" {
  title       = "GV.OC-05"
  description = "Outcomes, capabilities, and services that the organization depends on are understood and communicated."
  children    = []
  tags        = local.nist_csf_v2_common_tags
}

# Risk Management Strategy (GV.RM)
benchmark "nist_csf_v2_gv_rm" {
  title       = "Risk Management Strategy (GV.RM)"
  description = "The organization's priorities, constraints, risk tolerance and appetite statements, and assumptions are established, communicated, and used to support operational risk decisions."
  children = [
    benchmark.nist_csf_v2_gv_rm_03,
    benchmark.nist_csf_v2_gv_rm_04,
    benchmark.nist_csf_v2_gv_rm_05,
    benchmark.nist_csf_v2_gv_rm_06,
    benchmark.nist_csf_v2_gv_rm_07
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_gv_rm_03" {
  title       = "GV.RM-03"
  description = "Cybersecurity risk management activities and outcomes are included in enterprise risk management processes."
  children = [
    control.securitycenter_azure_defender_on_for_appservice,
    control.securitycenter_azure_defender_on_for_keyvault,
    control.securitycenter_azure_defender_on_for_server,
    control.securitycenter_azure_defender_on_for_sqldb,
    control.securitycenter_azure_defender_on_for_storage
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_gv_rm_04" {
  title       = "GV.RM-04"
  description = "Strategic direction that describes appropriate risk response options is established and communicated."
  children    = []
  tags        = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_gv_rm_05" {
  title       = "GV.RM-05"
  description = "Lines of communication across the organization are established for cybersecurity risks, including risks from suppliers and other third parties."
  children    = []
  tags        = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_gv_rm_06" {
  title       = "GV.RM-06"
  description = "A standardized method for calculating, documenting, categorizing, and prioritizing cybersecurity risks is established and communicated."
  children    = []
  tags        = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_gv_rm_07" {
  title       = "GV.RM-07"
  description = "Strategic opportunities (i.e., positive risks) are characterized and are included in organizational cybersecurity risk discussions."
  children    = []
  tags        = local.nist_csf_v2_common_tags
}

# Roles, Responsibilities, and Authorities (GV.RR)
benchmark "nist_csf_v2_gv_rr" {
  title       = "Roles, Responsibilities, and Authorities (GV.RR)"
  description = "Cybersecurity roles, responsibilities, and authorities to foster accountability, performance assessment, and continuous improvement are established and communicated."
  children = [
    benchmark.nist_csf_v2_gv_rr_01,
    benchmark.nist_csf_v2_gv_rr_02,
    benchmark.nist_csf_v2_gv_rr_04
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_gv_rr_01" {
  title       = "GV.RR-01"
  description = "Organizational leadership is responsible and accountable for cybersecurity risk and fosters a culture that is risk-aware, ethical, and continually improving."
  children = [
    control.iam_no_custom_subscription_owner_roles_created,
    control.iam_subscription_owner_max_3,
    control.iam_deprecated_account,
    control.iam_deprecated_account_with_owner_roles,
    control.iam_no_custom_role
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_gv_rr_02" {
  title       = "GV.RR-02"
  description = "Roles, responsibilities, and authorities related to cybersecurity risk management are established, communicated, understood, and enforced."
  children = [
    control.iam_no_custom_subscription_owner_roles_created,
    control.iam_subscription_owner_max_3,

  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_gv_rr_04" {
  title       = "GV.RR-04"
  description = "Cybersecurity is included in human resources practices."
  children = [
    control.iam_no_custom_subscription_owner_roles_created,
    control.iam_subscription_owner_max_3
  ]
  tags = local.nist_csf_v2_common_tags
}

# Policy (GV.PO)
benchmark "nist_csf_v2_gv_po" {
  title       = "Policy (GV.PO)"
  description = "Organizational cybersecurity policy is established, communicated, and enforced."
  children = [
    benchmark.nist_csf_v2_gv_po_02
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_gv_po_02" {
  title       = "GV.PO-02"
  description = "Policy for managing cybersecurity risks is reviewed, updated, communicated, and enforced to reflect changes in requirements, threats, technology, and organizational mission."
  children    = []
  tags        = local.nist_csf_v2_common_tags
}

# Oversight (GV.OV)
benchmark "nist_csf_v2_gv_ov" {
  title       = "Oversight (GV.OV)"
  description = "Results of organization-wide cybersecurity risk management activities and performance are used to inform, improve, and adjust the risk management strategy."
  children = [
    benchmark.nist_csf_v2_gv_ov_03
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_gv_ov_03" {
  title       = "GV.OV-03"
  description = "Organizational cybersecurity risk management performance is evaluated and reviewed for adjustments needed."
  children    = []
  tags        = local.nist_csf_v2_common_tags
}

# Cybersecurity Supply Chain Risk Management (GV.SC)
benchmark "nist_csf_v2_gv_sc" {
  title       = "Cybersecurity Supply Chain Risk Management (GV.SC)"
  description = "Cyber supply chain risk management processes are identified, established, managed, monitored, and improved by organizational stakeholders."
  children = [
    benchmark.nist_csf_v2_gv_sc_02,
    benchmark.nist_csf_v2_gv_sc_07
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_gv_sc_02" {
  title       = "GV.SC-02"
  description = "Cybersecurity roles and responsibilities for suppliers, customers, and partners are established, communicated, and coordinated internally and externally."
  children = [
    control.iam_no_custom_subscription_owner_roles_created,
    control.iam_subscription_owner_max_3,

  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_gv_sc_07" {
  title       = "GV.SC-07"
  description = "The risks posed by a supplier, their products and services, and other third parties are understood, recorded, prioritized, assessed, responded to, and monitored over the course of the relationship."
  children    = []
  tags        = local.nist_csf_v2_common_tags
} 