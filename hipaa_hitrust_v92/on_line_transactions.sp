benchmark "hipaa_hitrust_v92_on_line_transactions" {
  title    = "On-line Transactions"
  children = [
    benchmark.hipaa_hitrust_v92_0943_09y1organizational_1_09_y,
    benchmark.hipaa_hitrust_v92_0945_09y1organizational_3_09_y,
    benchmark.hipaa_hitrust_v92_0946_09y2organizational_14_09_y,
    benchmark.hipaa_hitrust_v92_0947_09y2organizational_2_09_y,
    benchmark.hipaa_hitrust_v92_0948_09y2organizational_3_09_y,
    benchmark.hipaa_hitrust_v92_0949_09y2organizational_5_09_y
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0943_09y1organizational_1_09_y" {
  title    = "The organization verifies every ninety (90) days for each extract of covered information recorded that the data is erased or its use is still required"
  children = [
    control.storage_account_secure_transfer_required_enabled,
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service       = "Azure/Storage"
  })
}

benchmark "hipaa_hitrust_v92_0946_09y2organizational_14_09_y" {
  title    = "The organization requires the use of encryption between, and the use of electronic signatures by, each of the parties involved in the transaction"
  children = [
    control.azure_redis_cache_ssl_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service       = "Azure/Redis"
  })
}

benchmark "hipaa_hitrust_v92_0947_09y2organizational_2_09_y" {
  title       = "The organization ensures the storage of the transaction details are located outside of any publicly accessible environment"
  description = "The organization ensures the storage of the transaction details are located outside of any publicly accessible environments (e.g., on a storage platform existing on the organization's intranet) and not retained and exposed on a storage medium directly accessible from the Internet."
  children = [
    control.postgres_sql_ssl_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service       = "Azure/PostgreSQL"
  })
}

benchmark "hipaa_hitrust_v92_0948_09y2organizational_3_09_y" {
  title    = "Where a trusted authority is used, security is integrated and embedded throughout the entire end-to-end certificate/signature management process"
  description = "Where a trusted authority is used (e.g., for the purposes of issuing and maintaining digital signatures and/or digital certificates), security is integrated and embedded throughout the entire end-to-end certificate/signature management process."
  children = [
    control.mysql_ssl_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service       = "Azure/MySQL"
  })
}

benchmark "hipaa_hitrust_v92_0949_09y2organizational_5_09_y" {
  title    = "The protocols used for communications are enhanced to address any new vulnerability, and the updated versions of the protocols are adopted as soon as possible"
  children = [
    control.appservice_api_app_latest_tls_version,
    control.appservice_api_app_use_https,
    control.appservice_function_app_latest_tls_version,
    control.appservice_function_app_only_https_accessible,
    control.appservice_web_app_latest_tls_version,
    control.appservice_web_app_use_https
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service       = "Azure/AppService"
  })
}

benchmark "hipaa_hitrust_v92_0945_09y1organizational_3_09_y" {
  title    = "Protocols used to communicate between all involved parties are secured using cryptographic techniques (e.g., SSL)"
  children = [
    control.compute_vm_with_no_specified_certificates_in_trusted_root_windows
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service       = "Azure/Compute"
  })
}