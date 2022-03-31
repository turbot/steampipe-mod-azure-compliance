locals {
  soc_2_cc_a_1_common_tags = merge(local.soc_2_common_tags, {
    soc_2_section_id = "cca1"
  })
}

benchmark "soc_2_cc_a_1" {
  title       = "CCA1.0 - Additional Criterial for Availability"
  description = "The availability category refers to the accessibility of information used by the entity’s systems, as well as the products or services provided to its customers."

  children = [
    benchmark.soc_2_cc_a_1_1,
    benchmark.soc_2_cc_a_1_2,
    control.keyvault_vault_recoverable,
    control.network_sg_flowlog_retention_period_greater_than_90,
    control.postgres_db_server_log_retention_days_3,
    control.sql_server_audting_retention_period_90,
    control.storage_account_soft_delete_enabled
  ]

  tags = local.soc_2_cc_a_1_common_tags
}

benchmark "soc_2_cc_a_1_1" {
  title         = "A1.1 The entity maintains, monitors, and evaluates current processing capacity and use of system components (infrastructure, data, and software) to manage capacity demand and to enable the implementation of additional capacity to help meet its objectives"
  documentation = file("./soc2/docs/cc_a_1_1.md")

  children = [
    control.network_sg_flowlog_retention_period_greater_than_90,
    control.postgres_db_server_log_retention_days_3,
    control.sql_server_audting_retention_period_90
  ]

  tags = merge(local.soc_2_cc_a_1_common_tags, {
    soc_2_item_id = "a1.1"
    soc_2_type    = "manual"
  })
}

benchmark "soc_2_cc_a_1_2" {
  title       = "A1.2 The entity authorizes, designs, develops or acquires, implements, operates, approves, maintains, and monitors environmental protections, software, data back-up processes, and recovery infrastructure to meet its objectives"
  documentation = file("./soc2/docs/cc_a_1_2.md")
  
  children = [
    control.keyvault_vault_recoverable,
    control.storage_account_soft_delete_enabled
  ]

  tags = merge(local.soc_2_cc_a_1_common_tags, {
    soc_2_item_id = "a1.2"
    soc_2_type    = "automated"
  })
}