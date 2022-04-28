locals {
  regulatory_compliance_containerregistry_common_tags = {
    service = "Azure/ContainerRegistry"
  }
}

control "container_registry_use_virtual_service_endpoint" {
  title       = "Container Registry should use a virtual network service endpoint"
  description = "This policy audits any Container Registry not configured to use a virtual network service endpoint."
  sql         = query.container_registry_use_virtual_service_endpoint.sql

  tags = merge(local.regulatory_compliance_containerregistry_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "container_registry_azure_defender_enabled" {
  title       = "Azure Defender for container registries should be enabled"
  description = "Azure Defender for container registries provides vulnerability scanning of any images pulled within the last 30 days, pushed to your registry, or imported, and exposes detailed findings per image."
  sql         = query.container_registry_azure_defender_enabled.sql

  tags = merge(local.regulatory_compliance_containerregistry_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "container_registry_restrict_public_access" {
  title       = "Container registries should not allow unrestricted network access"
  description = "Azure container registries by default accept connections over the internet from hosts on any network. To protect your registries from potential threats, allow access from only specific public IP addresses or address ranges. If your registry doesn't have an IP/firewall rule or a configured virtual network, it will appear in the unhealthy resources."
  sql         = query.container_registry_restrict_public_access.sql

  tags = merge(local.regulatory_compliance_containerregistry_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "container_registry_uses_private_link" {
  title       = "Container registries should use private link"
  description = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The private link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to your container registries instead of the entire service, you'll also be protected against data leakage risks."
  sql         = query.container_registry_uses_private_link.sql

  tags = merge(local.regulatory_compliance_containerregistry_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "container_registry_encrypted_with_cmk" {
  title       = "Container registries should be encrypted with a customer-managed key"
  description = "Use customer-managed keys to manage the encryption at rest of the contents of your registries. By default, the data is encrypted at rest with service-managed keys, but customer-managed keys are commonly required to meet regulatory compliance standards. Customer-managed keys enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management."
  sql         = query.container_registry_encrypted_with_cmk.sql

  tags = merge(local.regulatory_compliance_containerregistry_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "container_registry_vulnerabilities_remediated" {
  title       = "Vulnerabilities in Azure Container Registry images should be remediated"
  description = "Container image vulnerability assessment scans your registry for security vulnerabilities on each pushed container image and exposes detailed findings for each image (powered by Qualys). Resolving the vulnerabilities can greatly improve your containers' security posture and protect them from attacks."
  sql         = query.manual_control.sql

  tags = merge(local.regulatory_compliance_containerregistry_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}
