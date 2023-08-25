locals {
  controls_by_service_logic_common_tags = merge(local.controls_by_service_common_tags, {
    service = "Azure/Logic"
  })
}

benchmark "controls_by_service_logic" {
  title       = "Logic"
  description = "This section contains recommendations for configuring Logic resources."
  children = [
    control.logic_app_workflow_logging_enabled
  ]

  tags = merge(local.controls_by_service_logic_common_tags, {
    type = "Benchmark"
  })
}
