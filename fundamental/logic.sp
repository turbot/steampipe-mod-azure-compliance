locals {
  fundamental_security_logic_common_tags = {
    service = "Azure/Logic"
  }
}

benchmark "fundamental_security_logic" {
  title       = "Logic"
  description = "This section contains recommendations for configuring Logic resources."
  children = [
    control.logic_app_workflow_logging_enabled
  ]
}
