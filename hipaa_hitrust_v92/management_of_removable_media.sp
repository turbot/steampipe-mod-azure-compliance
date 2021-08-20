benchmark "hipaa_hitrust_v92_management_of_removable_media" {
  title         = "Management of Removable Media"
  children = [
    benchmark.hipaa_hitrust_v92_0301_09o1organizational_123_09_o,
    benchmark.hipaa_hitrust_v92_0302_09o2organizational_1_09_o,
    benchmark.hipaa_hitrust_v92_0303_09o2organizational_2_09_o,
    benchmark.hipaa_hitrust_v92_0304_09o3organizational_1_09_o
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0301_09o1organizational_123_09_o" {
  title         = "0301.09o1Organizational.123 - 09.o"
  description   = "The organization, based on the data classification level, registers media (including laptops) prior to use, places reasonable restrictions on how such media be used, and provides an appropriate level of physical and logical protection (including encryption) for media containing covered information until properly destroyed or sanitized."
  children = [
    control.sql_server_transparent_data_encryption_enabled
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0302_09o2organizational_1_09_o" {
  title         = "0302.09o2Organizational.1 - 09.o"
  description   = "The organization protects and controls media containing sensitive information during transport outside of controlled areas."
  children = [
    control.compute_os_and_data_disk_encrypted_with_cmk
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0303_09o2organizational_2_09_o" {
  title         = "0303.09o2Organizational.2 - 09.o"
  description   = "Formal agreements with external information system providers include specific obligations for security and privacy."
  children = [
    control.compute_unattached_disk_encrypted_with_cmk
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0304_09o3organizational_1_09_o" {
  title         = "0304.09o3Organizational.1 - 09.o"
  description   = "The organization restricts the use of writable removable media and personally-owned removable media in organizational systems."
  children = [
    control.datalake_store_account_encryption_enabled,
    control.sql_server_tde_protector_cmk_encrypted
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}