locals {
  controls_by_service_automation_common_tags = merge(local.controls_by_service_common_tags, {
    service = "Azure/Automation"
  })
}

benchmark "controls_by_service_automation" {
  title       = "Automation"
  description = "This section contains recommendations for configuring Automation resources."
  children = [
    control.automation_account_variable_encryption_enabled
  ]

  tags = merge(local.controls_by_service_automation_common_tags, {
    type = "Benchmark"
  })
}
