locals {
  other_securitycenter_common_tags = merge(local.azure_compliance_common_tags, {
    service = "Azure/SecurityCenter"
  })
}

benchmark "other_securitycenter" {
  title = "Security Center"
  children = [
    control.securitycenter_azure_defender_on_for_containerregistry,
    control.securitycenter_azure_defender_on_for_k8s,
    control.securitycenter_pricing_standard
  ]

  tags = merge(local.other_securitycenter_common_tags, {
    type = "Benchmark"
  })
}
