locals {
  fundamental_security_machinelearning_common_tags = merge(local.fundamental_security_common_tags, {
    service = "Azure/MachineLearning"
  })
}

benchmark "fundamental_security_machinelearning" {
  title       = "Machine Learning"
  description = "This section contains recommendations for configuring Machine Learning resources."
  children = [
    control.machine_learning_workspace_encrypted_with_cmk
  ]

  tags = merge(local.fundamental_security_machinelearning_common_tags, {
    type = "Benchmark"
  })
}
