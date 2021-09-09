benchmark "nist_sp_800_53_rev_5_ia" {
  title       = "Identification and Authentication (IA)"
  description = "to do."
  children = [
    benchmark.nist_sp_800_53_rev_5_ia_2,
    benchmark.nist_sp_800_53_rev_5_ia_4,
    benchmark.nist_sp_800_53_rev_5_ia_5
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}


benchmark "nist_sp_800_53_rev_5_ia_2" {
  title       = "Identification and Authentication (organizational Users) (IA-2)"
  description = "to  do"
  children = [
    benchmark.nist_sp_800_53_rev_5_ia_2_2,
    control.appservice_api_app_uses_managed_identity,
    control.appservice_function_app_uses_managed_identity,
    control.appservice_web_app_uses_managed_identity
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ia_2_2" {
  title       = "IA-2(2) Multi-factor Authentication to Non-privileged Accounts"
  description = "to  do"
  children = [
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ia_4" {
  title       = "Identifier Management (IA-4)"
  description = "to  do"
  children = [
    control.appservice_api_app_uses_managed_identity,
    control.appservice_function_app_uses_managed_identity,
    controlappservice_web_app_uses_managed_identity,
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ia_5" {
  title       = "Authenticator Management (IA-5)"
  description = "to  do"
  children = [
    benchmark.nist_sp_800_53_rev_5_ia_5_1
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ia_5_1" {
  title       = "IA-5(1) Password-based Authentication"
  description = "to  do"
  children = [
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}
