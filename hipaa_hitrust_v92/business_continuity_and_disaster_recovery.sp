benchmark "hipaa_hitrust_v92_business_continuity_and_disaster_recovery" {
  title       = "16 Business Continuity & Disaster Recovery"
  description = "TO DO"
  children = [
    benchmark.hipaa_hitrust_v92_1616_09l1organizational_16_09_l,
    benchmark.hipaa_hitrust_v92_1617_09l1organizational_23_09_l,
    benchmark.hipaa_hitrust_v92_1618_09l1organizational_45_09_l,
    benchmark.hipaa_hitrust_v92_1634_12b1organizational_1_12_b,
    benchmark.hipaa_hitrust_v92_1635_12b1organizational_2_12_b,
    benchmark.hipaa_hitrust_v92_1638_12b2organizational_345_12_b
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1616_09l1organizational_16_09_l" {
  title = "1616.09l1Organizational.16-09.l 09.05 Information Back-Up"
  title = "Backup copies of information and software are made and tests of the media and restoration procedures are regularly performed at appropriate intervals"
  children = [
    control.sql_database_long_term_geo_redundant_backup_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/SQL"
  })
}

benchmark "hipaa_hitrust_v92_1617_09l1organizational_23_09_l" {
  title       = "1617.09l1Organizational.23-09.l 09.05 Information Back-Up"
  description = "A formal definition of the level of backup required for each system is defined and documented including how each system will be restored, the scope of data to be imaged, frequency of imaging, and duration of retention based on relevant contractual, legal, regulatory and business requirements."
  children = [
    control.mysql_db_server_geo_redundant_backup_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/MySQL"
  })
}

benchmark "hipaa_hitrust_v92_1618_09l1organizational_45_09_l" {
  title       = "1618.09l1Organizational.45-09.l 09.05 Information Back-Up"
  description = "The backups are stored in a physically secure remote location, at a sufficient distance to make them reasonably immune from damage to data at the primary site, and reasonable physical and environmental controls are in place to ensure their protection at the remote location"
  children = [
    control.postgres_db_server_geo_redundant_backup_enabled,
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/PostgreSQL"
  })
}

benchmark "hipaa_hitrust_v92_1635_12b1organizational_2_12_b" {
  title       = "Information security aspects of business continuity"
  description = "Information security aspects of business continuity are (i) based on identifying events (or sequence of events) that can cause interruptions to the organization's critical business processes (e.g., equipment failure, human errors, theft, fire, natural disasters acts of terrorism); (ii) followed by a risk assessment to determine the probability and impact of such interruptions, in terms of time, damage scale and recovery period; (iii) based on the results of the risk assessment, a business continuity strategy is developed to identify the overall approach to business continuity; and (iv) once this strategy has been created, endorsement is provided by management, and a plan created and endorsed to implement this strategy."
  children = [
    control.keyvault_managed_hms_purge_protection_enabled,
    control.keyvault_purge_protection_enabled,
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/KeyVault"
  })
}

benchmark "hipaa_hitrust_v92_1634_12b1organizational_1_12_b" {
  title = "The organization identifies the critical business processes requiring business continuity"
  children = [
    control.compute_vm_disaster_recovery_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_1638_12b2organizational_345_12_b" {
  title       = "Business continuity risk assessments"
  description = "Business continuity risk assessments (i) are carried out annually with full involvement from owners of business resources and processes; (ii) consider all business processes and is not limited to the information assets, but includes the results specific to information security; and (iii) identifies, quantifies, and prioritizes risks against key business objectives and criteria relevant to the organization, including critical resources, impacts of disruptions, allowable outage times, and recovery priorities."
  children = [
    control.compute_vm_disaster_recovery_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}