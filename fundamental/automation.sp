locals {
  fundamental_security_automation_common_tags = {
    service = "Azure/Automation"
  }
}

benchmark "fundamental_security_automation" {
  title       = "Automation"
  description = "This section contains recommendations for configuring Automation resources."
  children = [
    control.automation_account_variable_encryption_enabled
  ]
}
