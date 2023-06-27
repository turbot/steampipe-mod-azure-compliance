benchmark "hipaa_hitrust_v92_transmission_protection" {
  title       = "09 Transmission Protection"
  description = "The organization uses FIPS-validated cryptographic mechanisms during transmission to prevent unauthorized disclosure of information and detect changes to information unless otherwise protected by organization-defined alternative physical measures."
  children = [
    benchmark.hipaa_hitrust_v92_0901_09s1organizational,
    benchmark.hipaa_hitrust_v92_0902_09s2organizational,
    benchmark.hipaa_hitrust_v92_0912_09s1organizational,
    benchmark.hipaa_hitrust_v92_0913_09s1organizational,
    benchmark.hipaa_hitrust_v92_0915_09s2organizational,
    benchmark.hipaa_hitrust_v92_0916_09s2organizational,
    benchmark.hipaa_hitrust_v92_0943_09y1organizational,
    benchmark.hipaa_hitrust_v92_0945_09y1organizational,
    benchmark.hipaa_hitrust_v92_0947_09y2organizational,
    benchmark.hipaa_hitrust_v92_0948_09y2organizational,
    benchmark.hipaa_hitrust_v92_0949_09y2organizational,
    benchmark.hipaa_hitrust_v92_0960_09scsporganizational
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0901_09s1organizational" {
  title       = "0901.09s1Organizational.1-09.s 09.08 Exchange of Information"
  description = "The organization formally addresses multiple safeguards before allowing the use of information systems for information exchange"
  children = [
    control.appservice_api_app_cors_no_star
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/AppService"
  })
}

benchmark "hipaa_hitrust_v92_0902_09s2organizational" {
  title       = "0902.09s2Organizational.13-09.s 09.08 Exchange of Information"
  description = "Remote (external) access to the organization's information assets and access to external information assets (for which the organization has no control) is based on clearly defined terms and conditions"
  children = [
    control.appservice_function_app_cors_no_star
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/AppService"
  })
}

benchmark "hipaa_hitrust_v92_0912_09s1organizational" {
  title       = "0912.09s1Organizational.4-09.s 09.08 Exchange of Information"
  description = "Cryptography is used to protect the confidentiality and integrity of remote access sessions to the internal network and to external systems"
  children = [
    control.appservice_api_app_remote_debugging_disabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/AppService"
  })
}

benchmark "hipaa_hitrust_v92_0913_09s1organizational" {
  title       = "0913.09s1Organizational.5-09.s 09.08 Exchange of Information"
  description = "Strong cryptography protocols are used to safeguard covered information during transmission over less trusted / open public networks"
  children = [
    control.appservice_function_app_remote_debugging_disabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/AppService"
  })
}

benchmark "hipaa_hitrust_v92_0915_09s2organizational" {
  title       = "0915.09s2Organizational.2-09.s 09.08 Exchange of Information"
  description = "The organization limits the use of organization-controlled portable storage media by authorized individuals on external information systems"
  children = [
    control.appservice_api_app_client_certificates_on
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/AppService"
  })
}

benchmark "hipaa_hitrust_v92_0916_09s2organizational" {
  title       = "0916.09s2Organizational.4-09.s 09.08 Exchange of Information"
  description = "The information system prohibits remote activation of collaborative computing devices and provides an explicit indication of use to users physically present at the devices"
  children = [
    control.appservice_api_app_cors_no_star
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/AppService"
  })
}

benchmark "hipaa_hitrust_v92_0943_09y1organizational" {
  title       = "0943.09y1Organizational.1-09.y 09.09 Electronic Commerce Services"
  description = "The organization verifies every ninety (90) days for each extract of covered information recorded that the data is erased or its use is still required"
  children = [
    control.storage_account_secure_transfer_required_enabled,
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Storage"
  })
}

benchmark "hipaa_hitrust_v92_0945_09y1organizational" {
  title       = "0945.09y1Organizational.3-09.y 09.09 Electronic Commerce Services"
  description = "Protocols used to communicate between all involved parties are secured using cryptographic techniques (e.g., SSL)"
  children = [
    control.compute_vm_with_no_specified_certificates_in_trusted_root_windows
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_0947_09y2organizational" {
  title       = "0947.09y2Organizational.2-09.y 09.09 Electronic Commerce Services"
  description = "The organization ensures the storage of the transaction details are located outside of any publicly accessible environments (e.g., on a storage platform existing on the organization's intranet) and not retained and exposed on a storage medium directly accessible from the Internet."
  children = [
    control.postgres_sql_ssl_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/PostgreSQL"
  })
}

benchmark "hipaa_hitrust_v92_0948_09y2organizational" {
  title       = "0948.09y2Organizational.3-09.y 09.09 Electronic Commerce Services"
  description = "Where a trusted authority is used (e.g., for the purposes of issuing and maintaining digital signatures and/or digital certificates), security is integrated and embedded throughout the entire end-to-end certificate/signature management process."
  children = [
    control.mysql_ssl_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/MySQL"
  })
}

benchmark "hipaa_hitrust_v92_0949_09y2organizational" {
  title       = "0949.09y2Organizational.5-09.y 09.09 Electronic Commerce Services"
  description = "The protocols used for communications are enhanced to address any new vulnerability, and the updated versions of the protocols are adopted as soon as possible"
  children = [
    control.appservice_api_app_latest_tls_version,
    control.appservice_api_app_use_https,
    control.appservice_function_app_latest_tls_version,
    control.appservice_function_app_only_https_accessible
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/AppService"
  })
}

benchmark "hipaa_hitrust_v92_0960_09scsporganizational" {
  title       = "0960.09sCSPOrganizational.1-09.s 09.08 Exchange of Information"
  description = "Cloud service providers use secure (e.g., non-clear text and authenticated) standardized network protocols for the import and export of data and to manage the service, and make available a document to consumers (tenants) detailing the relevant interoperability and portability standards that are involved."
  children = [
    control.appservice_function_app_cors_no_star
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/AppService"
  })
}
