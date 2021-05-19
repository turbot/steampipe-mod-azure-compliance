mod "azure_compliance" {
  # hub metadata
  title          = "Azure Compliance"
  description    = "Steampipe Mod for Azure Compliance"
  color          = "#0089D6"
  documentation  = file("./docs/index.md")
  icon           = "/images/plugins/turbot/azure.svg"
  categories     = ["Azure", "CIS", "Compliance", "Public Cloud", "Security"]

  opengraph {
    title         = "Steampipe Mod for Azure Compliance"
    description   = "Compliance and audit reports, queries, and actions for Azure. Open source CLI. No DB required."
  }
}
