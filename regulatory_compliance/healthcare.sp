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

control "healthcare_fhir_azure_api_encrypted_at_rest_with_cmk" {
  title       = "Azure API for FHIR should use a customer-managed key to encrypt data at rest"
  description = "Use a customer-managed key to control the encryption at rest of the data stored in Azure API for FHIR when this is a regulatory or compliance requirement. Customer-managed keys also deliver double encryption by adding a second layer of encryption on top of the default one done with service-managed keys."
  sql         = query.healthcare_fhir_azure_api_encrypted_at_rest_with_cmk.sql

  tags = merge(local.regulatory_compliance_healthcare_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}
