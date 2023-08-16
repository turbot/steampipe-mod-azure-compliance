locals {
  fundamental_security_machinelearning_common_tags = {
    service = "Azure/MachineLearning"
  }
}

benchmark "fundamental_security_machinelearning" {
  title       = "MachineLearning"
  description = "This section contains recommendations for configuring MachineLearning resources."
  children = [
    control.machine_learning_workspace_encrypted_with_cmk
  ]
}
