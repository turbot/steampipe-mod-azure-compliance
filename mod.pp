mod "azure_compliance" {
  # Hub metadata
  title         = "Azure Compliance"
  description   = "Run individual configuration, compliance and security controls or full compliance benchmarks for CIS, HIPAA HITRUST, NIST, PCI DSS across all your Azure subscriptions using Powerpipe and Steampipe."
  color         = "#0089D6"
  documentation = file("./docs/index.md")
  icon          = "/images/mods/turbot/azure-compliance.svg"
  categories    = ["azure", "cis", "compliance", "public cloud", "security"]
  database      = var.database

  opengraph {
    title       = "Powerpipe Mod for Azure Compliance"
    description = "Run individual configuration, compliance and security controls or full compliance benchmarks for CIS, HIPAA HITRUST, NIST, PCI DSS across all your Azure subscriptions using Powerpipe and Steampipe."
    image       = "/images/mods/turbot/azure-compliance-social-graphic.png"
  }

  require {
    plugin "azure" {
      min_version = "1.12.0"
    }
    plugin "azuread" {
      min_version = "1.8.0"
    }
  }
}
