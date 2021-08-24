mod "azure_compliance" {
  # hub metadata
  title         = "Azure Compliance"
  description  = "Run individual configuration, compliance and security controls or full compliance benchmarks for CIS, HIPAA HITRUST across all your Azure subscriptions using Steampipe."
  color         = "#0089D6"
  documentation = file("./docs/index.md")
  icon          = "/images/mods/turbot/azure-compliance.svg"
  categories    = ["Azure", "CIS", "Compliance", "Public Cloud", "Security"]

  opengraph {
    title       = "Steampipe Mod for Azure Compliance"
    description = "Run individual configuration, compliance and security controls or full compliance benchmarks for CIS, HIPAA HITRUST across all your Azure subscriptions using Steampipe."
    image       = "/images/mods/turbot/azure-compliance-social-graphic.png"
  }
}
