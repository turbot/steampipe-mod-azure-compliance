locals {
  all_controls_databricks_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/Databricks"
  })
}

benchmark "all_controls_databricks" {
  title       = "Databricks"
  description = "This section contains recommendations for configuring Databricks resources."
  children = [
    control.databricks_workspace_cmk_configured,
    control.databricks_workspace_deployed_in_custom_vnet,
    control.databricks_workspace_diagnostic_log_delivery_configured,
    control.databricks_workspace_subnet_with_nsg_configured
  ]

  tags = merge(local.all_controls_databoxedge_common_tags, {
    type = "Benchmark"
  })
}
