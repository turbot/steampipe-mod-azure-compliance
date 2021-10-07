locals {
  regulatory_compliance_healthcare_common_tags = {
    service = "healthcare"
  }
}

control "healthcare_fhir_uses_private_link" {
  title       = "Azure API for FHIR should use private link"
  description = "Azure API for FHIR should have at least one approved private endpoint connection. Clients in a virtual network can securely access resources that have private endpoint connections through private links."
  sql         = query.healthcare_fhir_uses_private_link.sql

  tags = merge(local.regulatory_compliance_healthcare_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}
