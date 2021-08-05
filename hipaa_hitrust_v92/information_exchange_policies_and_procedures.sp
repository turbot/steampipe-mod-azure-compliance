benchmark "hipaa_hitrust_v92_information_exchange_policies_and_procedures" {
  title         = "Information Exchange Policies and Procedures"
  children = [
    benchmark.hipaa_hitrust_v92_0662_09scsporganizational_2_09_s,
    benchmark.hipaa_hitrust_v92_0912_09s1organizational_4_09_s,
    benchmark.hipaa_hitrust_v92_0915_09s2organizational_2_09_s,
    benchmark.hipaa_hitrust_v92_0913_09s1organizational_5_09_s,
    benchmark.hipaa_hitrust_v92_1325_09s1organizational_3_09_s,
    benchmark.hipaa_hitrust_v92_0914_09s1organizational_6_09_s,
    benchmark.hipaa_hitrust_v92_0901_09s1organizational_1_09_s,
    benchmark.hipaa_hitrust_v92_0916_09s2organizational_4_09_s,
    benchmark.hipaa_hitrust_v92_0960_09scsporganizational_1_09_s,
    benchmark.hipaa_hitrust_v92_0902_09s2organizational_13_09_s,
    benchmark.hipaa_hitrust_v92_0911_09s1organizational_2_09_s

  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0662_09scsporganizational_2_09_s" {
  title         = "0662.09sCSPOrganizational.2 - 09.s"
  description   = "Cloud service providers use an industry-recognized virtualization platform and standard virtualization formats (e.g., Open Virtualization Format, OVF) to help ensure interoperability, and has documented custom changes made to any hypervisor in use and all solution-specific virtualization hooks available for customer review."
  children = [
    control.appservice_web_app_incoming_client_cert_on
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0912_09s1organizational_4_09_s" {
  title         = "0912.09s1Organizational.4 - 09.s"
  description   = "Cloud service providers use an industry-recognized virtualization platform and standard virtualization formats (e.g., Open Virtualization Format, OVF) to help ensure interoperability, and has documented custom changes made to any hypervisor in use and all solution-specific virtualization hooks available for customer review."
  children = [
    control.appservice_web_app_remote_debugging_disabled
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0915_09s2organizational_2_09_s" {
  title         = "0915.09s2Organizational.2 - 09.s"
  description   = "Remote (external) access to the organization's information assets and access to external information assets (for which the organization has no control) is based on clearly defined terms and conditions."
  children = [
    control.appservice_web_app_incoming_client_cert_on
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0913_09s1organizational_5_09_s" {
  title         = "0913.09s1Organizational.5 - 09.s"
  description   = "Strong cryptography protocols are used to safeguard covered information during transmission over less trusted / open public networks."
  children = [
    control.appservice_function_app_remote_debugging_disabled
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0914_09s1organizational_6_09_s" {
  title         = "0914.09s1Organizational.6 - 09.s"
  description   = "The organization ensures that communication protection requirements, including the security of exchanges of information, is the subject of policy development and compliance audits."
  children = [
    control.appservice_api_app_remote_debugging_disabled
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1325_09s1organizational_3_09_s" {
  title         = "1325.09s1Organizational.3 - 09.s"
  description   = "Personnel are appropriately trained on leading principles and practices for all types of information exchange (oral, paper and electronic)."
  children = [
    control.appservice_function_app_remote_debugging_disabled
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0901_09s1organizational_1_09_s" {
  title         = "0901.09s1Organizational.1 - 09.s"
  description   = "The organization formally addresses multiple safeguards before allowing the use of information systems for information exchange."
  children = [
    control.appservice_web_app_cors_no_star
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0916_09s2organizational_4_09_s" {
  title         = "0916.09s2Organizational.4 - 09.s"
  description   = "The information system prohibits remote activation of collaborative computing devices and provides an explicit indication of use to users physically present at the devices."
  children = [
    control.appservice_web_app_cors_no_star
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0960_09scsporganizational_1_09_s" {
  title         = "0960.09sCSPOrganizational.1 - 09.s"
  description   = "Cloud service providers use secure (e.g., non-clear text and authenticated) standardized network protocols for the import and export of data and to manage the service, and make available a document to consumers (tenants) detailing the relevant interoperability and portability standards that are involved."
  children = [
    control.appservice_function_app_cors_no_star
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0902_09s2organizational_13_09_s" {
  title         = "0902.09s2Organizational.13 - 09.s"
  description   = "Remote (external) access to the organization's information assets and access to external information assets (for which the organization has no control) is based on clearly defined terms and conditions."
  children = [
    control.appservice_function_app_cors_no_star
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0911_09s1organizational_2_09_s" {
  title         = "0911.09s1Organizational.2 - 09.s"
  description   = "The organization establishes terms and conditions, consistent with any trust relationship established with other organizations owning, operating, and/or maintaining external information systems, allowing authorized individuals to (i) access the information system from external information systems; and (ii) process, store or transmit organization-controlled information using external information systems."
  children = [
    control.appservice_api_app_cors_no_star
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}


