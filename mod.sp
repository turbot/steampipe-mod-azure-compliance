mod "azure_compliance" {
  # hub metadata
  title         = "Azure Compliance"
  description   = "Run individual configuration, compliance and security controls or full compliance benchmarks for CIS, HIPAA HITRUST, NIST, SOC 2 across all your Azure subscriptions using Steampipe."
  color         = "#0089D6"
  documentation = file("./docs/index.md")
  icon          = "/images/mods/turbot/azure-compliance.svg"
  categories    = ["azure", "cis", "compliance", "public cloud", "security"]

  opengraph {
    title       = "Steampipe Mod for Azure Compliance"
    description = "Run individual configuration, compliance and security controls or full compliance benchmarks for CIS, HIPAA HITRUST, NIST, SOC 2 across all your Azure subscriptions using Steampipe."
    image       = "/images/mods/turbot/azure-compliance-social-graphic.png"
  }

  requires {
    plugin "azure" {
      version = "0.21.0"
    }
    plugin "azuread" {
      version = "0.0.3"
    }
  }
}
