benchmark "hipaa_hitrust_v92_information_exchange_policies_and_procedures" {
  title         = "Information Exchange Policies and Procedures"
  children = [
    benchmark.hipaa_hitrust_v92_0662_09scsporganizational_2_09_s,
    benchmark.hipaa_hitrust_v92_0912_09s1organizational_4_09_s,
    benchmark.hipaa_hitrust_v92_0915_09s2organizational_2_09_s,
    benchmark.hipaa_hitrust_v92_0913_09s1organizational_5_09_s,
    benchmark.hipaa_hitrust_v92_1325_09s1organizational_3_09_s,
    benchmark.hipaa_hitrust_v92_0914_09s1organizational_6_09_s
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0662_09scsporganizational_2_09_s" {
  title         = "0662.09sCSPOrganizational.2 - 09.s"
  description   = "Cloud service providers use an industry-recognized virtualization platform and standard virtualization formats (e.g., Open Virtualization Format, OVF) to help ensure interoperability, and has documented custom changes made to any hypervisor in use and all solution-specific virtualization hooks available for customer review."
  children = [
    control.appservice_web_app_incoming_client_cert_on,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0912_09s1organizational_4_09_s" {
  title         = "0912.09s1Organizational.4 - 09.s"
  description   = "Cloud service providers use an industry-recognized virtualization platform and standard virtualization formats (e.g., Open Virtualization Format, OVF) to help ensure interoperability, and has documented custom changes made to any hypervisor in use and all solution-specific virtualization hooks available for customer review."
  children = [
    control.appservice_web_app_remote_debugging_disabled,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0915_09s2organizational_2_09_s" {
  title         = "0915.09s2Organizational.2 - 09.s"
  description   = "Remote (external) access to the organization's information assets and access to external information assets (for which the organization has no control) is based on clearly defined terms and conditions."
  children = [
    control.appservice_web_app_incoming_client_cert_on,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0913_09s1organizational_5_09_s" {
  title         = "0913.09s1Organizational.5 - 09.s"
  description   = "Strong cryptography protocols are used to safeguard covered information during transmission over less trusted / open public networks."
  children = [
    control.appservice_function_app_remote_debugging_disabled,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0914_09s1organizational_6_09_s" {
  title         = "0914.09s1Organizational.6 - 09.s"
  description   = "The organization ensures that communication protection requirements, including the security of exchanges of information, is the subject of policy development and compliance audits."
  children = [
    control.appservice_api_app_remote_debugging_disabled,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1325_09s1organizational_3_09_s" {
  title         = "1325.09s1Organizational.3 - 09.s"
  description   = "Personnel are appropriately trained on leading principles and practices for all types of information exchange (oral, paper and electronic)."
  children = [
    control.appservice_function_app_remote_debugging_disabled,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}
