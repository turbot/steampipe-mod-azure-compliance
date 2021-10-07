locals {
  regulatory_compliance_dns_common_tags = {
    service = "dns"
  }
}

control "dns_azure_defender_enabled" {
  title       = "Azure Defender for DNS should be enabled"
  description = "Azure Defender for DNS provides an additional layer of protection for your cloud resources by continuously monitoring all DNS queries from your Azure resources. Azure Defender alerts you about suspicious activity at the DNS layer."
  sql         = query.dns_azure_defender_enabled.sql

  tags = merge(local.regulatory_compliance_dns_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}
