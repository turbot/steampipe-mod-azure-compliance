// Benchmarks and controls for specific services should override the "service" tag
locals {
  azure_compliance_common_tags = {
    category = "Compliance"
    plugin   = "azure"
    service  = "Azure"
  }
}

mod "azure_compliance" {
  # hub metadata
  title         = "Azure Compliance"
  description   = "Run individual configuration, compliance and security controls or full compliance benchmarks for CIS, HIPAA HITRUST, NIST, PCI DSS across all your Azure subscriptions using Steampipe."
  color         = "#0089D6"
  documentation = file("./docs/index.md")
  icon          = "/images/mods/turbot/azure-compliance.svg"
  categories    = ["azure", "cis", "compliance", "public cloud", "security"]

  opengraph {
    title       = "Steampipe Mod for Azure Compliance"
    description = "Run individual configuration, compliance and security controls or full compliance benchmarks for CIS, HIPAA HITRUST, NIST, PCI DSS across all your Azure subscriptions using Steampipe."
    image       = "/images/mods/turbot/azure-compliance-social-graphic.png"
  }

  require {
    plugin "azure" {
      version = "0.38.0"
    }
    plugin "azuread" {
      version = "0.0.3"
    }
  }
}
