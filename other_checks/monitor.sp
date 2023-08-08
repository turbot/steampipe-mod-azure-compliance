locals {
  other_monitor_common_tags = merge(local.azure_compliance_common_tags, {
    service = "Azure/Monitor"
  })
}

benchmark "other_monitor" {
  title = "Monitor"
  children = [
    control.monitor_log_profile_retention_365_days
  ]

  tags = merge(local.other_monitor_common_tags, {
    type = "Benchmark"
  })
}
