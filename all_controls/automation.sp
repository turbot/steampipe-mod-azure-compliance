locals {
  all_controls_automation_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/Automation"
  })
}

benchmark "all_controls_automation" {
  title       = "Automation"
  description = "This section contains recommendations for configuring Automation resources."
  children = [
    control.automation_account_variable_encryption_enabled
  ]

  tags = merge(local.all_controls_automation_common_tags, {
    type = "Benchmark"
  })
}
