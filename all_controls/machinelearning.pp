locals {
  all_controls_machinelearning_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/MachineLearning"
  })
}

benchmark "all_controls_machinelearning" {
  title       = "Machine Learning"
  description = "This section contains recommendations for configuring Machine Learning resources."
  children = [
    control.machine_learning_workspace_encrypted_with_cmk
  ]

  tags = merge(local.all_controls_machinelearning_common_tags, {
    type = "Benchmark"
  })
}
