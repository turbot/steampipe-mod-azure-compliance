locals {
  all_controls_logic_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/Logic"
  })
}

benchmark "all_controls_logic" {
  title       = "Logic"
  description = "This section contains recommendations for configuring Logic resources."
  children = [
    control.logic_app_workflow_logging_enabled
  ]

  tags = merge(local.all_controls_logic_common_tags, {
    type = "Benchmark"
  })
}
