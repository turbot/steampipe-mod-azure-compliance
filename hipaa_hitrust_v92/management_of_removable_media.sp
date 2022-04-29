benchmark "hipaa_hitrust_v92_management_of_removable_media" {
  title    = "Management of Removable Media"
  children = [
    benchmark.hipaa_hitrust_v92_0301_09o1organizational_123_09_o,
    benchmark.hipaa_hitrust_v92_0302_09o2organizational_1_09_o,
    benchmark.hipaa_hitrust_v92_0303_09o2organizational_2_09_o,
    benchmark.hipaa_hitrust_v92_0304_09o3organizational_1_09_o
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0301_09o1organizational_123_09_o" {
  title       = "The organization media registration, restrictions and protection"
  description = "The organization, based on the data classification level, registers media (including laptops) prior to use, places reasonable restrictions on how such media be used, and provides an appropriate level of physical and logical protection (including encryption) for media containing covered information until properly destroyed or sanitized."
  children = [
    control.sql_server_transparent_data_encryption_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service       = "Azure/SQL"
  })
}

benchmark "hipaa_hitrust_v92_0302_09o2organizational_1_09_o" {
  title    = "The organization protects and controls media containing sensitive information during transport outside of controlled areas"
  children = [
    control.compute_os_and_data_disk_encrypted_with_cmk
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service       = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_0303_09o2organizational_2_09_o" {
  title    = "Digital and non-digital media requiring restricted use and the specific safeguards used to restrict their use are identified"
  children = [
    control.compute_unattached_disk_encrypted_with_cmk
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service       = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_0304_09o3organizational_1_09_o" {
  title    = "The organization restricts the use of writable removable media and personally-owned removable media in organizational systems"
  children = [
    control.datalake_store_account_encryption_enabled,
    control.sql_server_tde_protector_cmk_encrypted,
    control.mssql_managed_instance_encryption_at_rest_using_cmk
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}