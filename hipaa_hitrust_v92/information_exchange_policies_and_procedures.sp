benchmark "hipaa_hitrust_v92_information_exchange_policies_and_procedures" {
  title         = "Information Exchange Policies and Procedures"
  children = [
    benchmark.hipaa_hitrust_v92_0662_09scsporganizational_2_09_s,
    benchmark.hipaa_hitrust_v92_0912_09s1organizational_4_09_s,
    benchmark.hipaa_hitrust_v92_0915_09s2organizational_2_09_s,
    benchmark.hipaa_hitrust_v92_0913_09s1organizational_5_09_s,
    benchmark.hipaa_hitrust_v92_1325_09s1organizational_3_09_s
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0662_09scsporganizational_2_09_s" {
  title         = "0662.09sCSPOrganizational.2 - 09.s"
  description   = "Cloud service providers use an industry-recognized virtualization platform and standard virtualization formats (e.g., Open Virtualization Format, OVF) to help ensure interoperability, and has documented custom changes made to any hypervisor in use and all solution-specific virtualization hooks available for customer review."
  children = [
    control.hipaa_hitrust_v92_0662_09scsporganizational_2_09_s_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0662_09scsporganizational_2_09_s_1" {
  title         = "Ensure WEB app has 'Client Certificates (Incoming client certificates)' set to 'On'"
  description   = "Client certificates allow for the app to request a certificate for incoming requests. Only clients that have a valid certificate will be able to reach the app."
  sql           = query.appservice_web_app_incoming_client_cert_on.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0912_09s1organizational_4_09_s" {
  title         = "0912.09s1Organizational.4 - 09.s"
  description   = "Cloud service providers use an industry-recognized virtualization platform and standard virtualization formats (e.g., Open Virtualization Format, OVF) to help ensure interoperability, and has documented custom changes made to any hypervisor in use and all solution-specific virtualization hooks available for customer review."
  children = [
    control.hipaa_hitrust_v92_0912_09s1organizational_4_09_s_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0912_09s1organizational_4_09_s_1" {
  title         = "Remote debugging should be turned off for Web Applications"
  description   = "Remote debugging requires inbound ports to be opened on a web application. Remote debugging should be turned off."
  sql           = query.appservice_web_app_remote_debugging_disabled.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0915_09s2organizational_2_09_s" {
  title         = "0915.09s2Organizational.2 - 09.s"
  description   = "Remote (external) access to the organization's information assets and access to external information assets (for which the organization has no control) is based on clearly defined terms and conditions."
  children = [
    control.hipaa_hitrust_v92_0915_09s2organizational_2_09_s_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0915_09s2organizational_2_09_s_1" {
  title         = "Ensure WEB app has 'Client Certificates (Incoming client certificates)' set to 'On'"
  description   = "Client certificates allow for the app to request a certificate for incoming requests. Only clients that have a valid certificate will be able to reach the app."
  sql           = query.appservice_web_app_incoming_client_cert_on.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0913_09s1organizational_5_09_s" {
  title         = "0913.09s1Organizational.5 - 09.s"
  description   = "Strong cryptography protocols are used to safeguard covered information during transmission over less trusted / open public networks."
  children = [
    control.hipaa_hitrust_v92_0913_09s1organizational_5_09_s_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0913_09s1organizational_5_09_s_1" {
  title         = "Remote debugging should be turned off for Function Apps"
  description   = "Remote debugging requires inbound ports to be opened on function apps. Remote debugging should be turned off."
  sql           = query.appservice_function_app_remote_debugging_disabled.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1325_09s1organizational_3_09_s" {
  title         = "1325.09s1Organizational.3 - 09.s"
  description   = "Personnel are appropriately trained on leading principles and practices for all types of information exchange (oral, paper and electronic)."
  children = [
    control.hipaa_hitrust_v92_1325_09s1organizational_3_09_s_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_1325_09s1organizational_3_09_s_1" {
  title         = "Remote debugging should be turned off for Function Apps"
  description   = "Remote debugging requires inbound ports to be opened on function apps. Remote debugging should be turned off."
  sql           = query.appservice_function_app_remote_debugging_disabled.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}