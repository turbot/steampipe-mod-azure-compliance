locals {
  controls_by_service_machinelearning_common_tags = merge(local.controls_by_service_common_tags, {
    service = "Azure/MachineLearning"
  })
}

benchmark "controls_by_service_machinelearning" {
  title       = "Machine Learning"
  description = "This section contains recommendations for configuring Machine Learning resources."
  children = [
    control.machine_learning_workspace_encrypted_with_cmk
  ]

  tags = merge(local.controls_by_service_machinelearning_common_tags, {
    type = "Benchmark"
  })
}
