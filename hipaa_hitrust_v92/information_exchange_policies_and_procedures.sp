benchmark "hipaa_hitrust_v92_information_exchange_policies_and_procedures" {
  title         = "Information Exchange Policies and Procedures"
  children = [
    benchmark.hipaa_hitrust_v92_0662_09scsporganizational_2_09_s ,
    benchmark.hipaa_hitrust_v92_0915_09s2organizational_2_09_s,

    benchmark.hipaa_hitrust_v92_1276_09c2organizational_2_09_c,
    benchmark.hipaa_hitrust_v92_1278_09c2organizational_56_09_c
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0662_09scsporganizational_2_09_s" {
  title         = "0662.09sCSPOrganizational.2 - 09.s "
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
