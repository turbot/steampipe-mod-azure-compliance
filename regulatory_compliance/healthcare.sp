locals {
  regulatory_compliance_healthcare_common_tags = {
    service = "Azure/HealthcareAPIs"
  }
}

control "healthcare_fhir_uses_private_link" {
  title       = "Azure API for FHIR should use private link"
  description = "Azure API for FHIR should have at least one approved private endpoint connection. Clients in a virtual network can securely access resources that have private endpoint connections through private links."
  query       = query.healthcare_fhir_uses_private_link

  tags = merge(local.regulatory_compliance_healthcare_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "healthcare_fhir_azure_api_encrypted_at_rest_with_cmk" {
  title       = "Azure API for FHIR should use a customer-managed key to encrypt data at rest"
  description = "Use a customer-managed key to control the encryption at rest of the data stored in Azure API for FHIR when this is a regulatory or compliance requirement. Customer-managed keys also deliver double encryption by adding a second layer of encryption on top of the default one done with service-managed keys."
  query       = query.healthcare_fhir_azure_api_encrypted_at_rest_with_cmk

  tags = merge(local.regulatory_compliance_healthcare_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

query "healthcare_fhir_azure_api_encrypted_at_rest_with_cmk" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when cosmos_db_configuration -> 'keyVaultKeyUri' is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when cosmos_db_configuration -> 'keyVaultKeyUri' is not null then a.name || ' encrypted with CMK.'
        else a.name || ' not encrypted with CMK.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_healthcare_service as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "healthcare_fhir_uses_private_link" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when private_endpoint_connections is null then 'info'
        when private_endpoint_connections @>  '[{"privateLinkServiceConnectionState": "Approved"}]'::jsonb then 'ok'
        else 'alarm'
      end as status,
      case
        when private_endpoint_connections is null then a.name || ' no private link exists.'
        when private_endpoint_connections @>  '[{"privateLinkServiceConnectionState": "Approved"}]'::jsonb then a.name || ' using private link.'
        else a.name || ' not using private link.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_healthcare_service a,
      azure_subscription sub;
  EOQ
}