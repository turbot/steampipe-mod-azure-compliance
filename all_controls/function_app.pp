locals {
  all_controls_function_app_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/Function App"
  })
}

benchmark "all_controls_function_app" {
  title       = "Function App"
  description = "This section contains recommendations for configuring Function App resources."
  children = [
    control.function_app_https_only
  ]

  tags = merge(local.all_controls_function_app_common_tags, {
    type = "Benchmark"
  })
}
