locals {
  cis_v200_10_common_tags = merge(local.cis_v200_common_tags, {
    cis_section_id = "10"
  })
}

benchmark "cis_v200_10" {
  title         = "10 Miscellaneous"
  documentation = file("./cis_v200/docs/cis_v200_10.md")
  children = [
    control.v200
  ]

  tags = merge(local.cis_v200_10_common_tags, {
    type = "Benchmark"
  })
}

control "v200" {
  title         = "10.1 Ensure that Resource Locks are set for Mission-Critical Azure Resources"
  description   = "Resource Manager Locks provide a way for administrators to lock down Azure resources to prevent deletion of, or modifications to, a resource. These locks sit outside of the Role Based Access Controls (RBAC) hierarchy and, when applied, will place restrictions on the resource for all users. These locks are very useful when there is an important resource in a subscription that users should not be able to delete or change. Locks can help prevent accidental and malicious changes or deletion."
  query         = query.manual_control
  documentation = file("./cis_v200/docs/v200.md")

  tags = merge(local.cis_v200_8_common_tags, {
    cis_item_id = "10.1"
    cis_level   = "2"
    cis_type    = "manual"
  })
}
