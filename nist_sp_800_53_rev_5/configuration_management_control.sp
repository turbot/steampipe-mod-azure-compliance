benchmark "nist_sp_800_53_rev_5_cm" {
  title       = "Configuration Management (CM)"
  description = "to do."
  children = [
    benchmark.nist_sp_800_53_rev_5_cm_6,
    benchmark.nist_sp_800_53_rev_5_cm_7,
    benchmark.nist_sp_800_53_rev_5_cm_10,
    benchmark.nist_sp_800_53_rev_5_cm_11
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}


benchmark "nist_sp_800_53_rev_5_cm_6" {
  title       = "Configuration Settings (CM-6)"
  description = "to  do"
  children = [
    control.appservice_api_app_client_certificates_on,
    control.appservice_api_app_cors_no_star,
    control.appservice_api_app_remote_debugging_disabled,
    control.appservice_function_app_client_certificates_on,
    control.appservice_function_app_cors_no_star,
    control.appservice_function_app_remote_debugging_disabled,
    control.appservice_web_app_client_certificates_on,
    control.appservice_web_app_cors_no_star,
    control.appservice_web_app_remote_debugging_disabled,
    control.kubernetes_cluster_add_on_azure_policy_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_cm_7" {
  title       = "Least Functionality (CM-7)"
  description = "to  do"
  children = [
    benchmark.nist_sp_800_53_rev_5_cm_7_2,
    benchmark.nist_sp_800_53_rev_5_cm_7_5,
    control.compute_vm_azure_defender_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_cm_7_2" {
  title       = "CM-7(2) Prevent Program Execution"
  description = "to  do"
  children = [
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_cm_7_5" {
  title       = "CM-7(5) Authorized Software ??? Allow-by-exception"
  description = "to  do"
  children = [
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_cm_10" {
  title       = "Software Usage Restrictions (CM-10)"
  description = "to  do"
  children = [
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_cm_11" {
  title       = "User-installed Software (CM-11)"
  description = "to  do"
  children = [
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}
