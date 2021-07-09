benchmark "hipaa_hitrust_v92_management_of_removable_media" {
  title         = "Management of Removable Media"
  children = [
    benchmark.hipaa_hitrust_v92_0301_09o1organizational_123_09_o,
    benchmark.hipaa_hitrust_v92_0302_09o2organizational_1_09_o,
    benchmark.hipaa_hitrust_v92_0303_09o2organizational_2_09_o
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0301_09o1organizational_123_09_o" {
  title         = "0301.09o1Organizational.123 - 09.o"
  description   = "The organization, based on the data classification level, registers media (including laptops) prior to use, places reasonable restrictions on how such media be used, and provides an appropriate level of physical and logical protection (including encryption) for media containing covered information until properly destroyed or sanitized."
  children = [
    control.hipaa_hitrust_v92_0301_09o1organizational_123_09_o_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0301_09o1organizational_123_09_o_1" {
  title         = "Transparent Data Encryption on SQL databases should be enabled"
  description   = "Transparent data encryption should be enabled to protect data-at-rest and meet compliance requirements."
  sql           = query.sql_server_transparent_data_encryption_enabled.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0302_09o2organizational_1_09_o" {
  title         = "0302.09o2Organizational.1 - 09.o"
  description   = "The organization protects and controls media containing sensitive information during transport outside of controlled areas."
  children = [
    control.hipaa_hitrust_v92_0302_09o2organizational_1_09_o_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0302_09o2organizational_1_09_o_1" {
  title         = "Disk encryption should be applied on virtual machines"
  description   = "Virtual machines without an enabled disk encryption will be monitored by Azure Security Center as recommendations."
  sql           = query.compute_os_and_data_disk_encrypted_with_cmk.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0303_09o2organizational_2_09_o" {
  title         = "0303.09o2Organizational.2 - 09.o"
  description   = "Formal agreements with external information system providers include specific obligations for security and privacy."
  children = [
    control.hipaa_hitrust_v92_0303_09o2organizational_2_09_o_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0303_09o2organizational_2_09_o_1" {
  title         = "Unattached disks should be encrypted"
  description   = "This policy audits any unattached disk without encryption enabled."
  sql           = query.compute_unattached_disk_encrypted_with_cmk.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}