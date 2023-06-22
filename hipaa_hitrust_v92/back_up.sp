benchmark "hipaa_hitrust_v92_back_up" {
  title = "Back-up"
  children = [
    benchmark.hipaa_hitrust_v92_1626_09l3organizational_5_09_l,
    benchmark.hipaa_hitrust_v92_1627_09l3organizational_6_09_l
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1626_09l3organizational_5_09_l" {
  title = "The organization ensures a current, retrievable copy of covered information is available before movement of servers"
  children = [
    control.postgres_db_server_geo_redundant_backup_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/PostgreSQL"
  })
}

benchmark "hipaa_hitrust_v92_1627_09l3organizational_6_09_l" {
  title = "The organization tests backup information following each backup to verify media reliability and information integrity, and at least annually thereafter"
  children = [
    control.mysql_db_server_geo_redundant_backup_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/MySQL"
  })
}