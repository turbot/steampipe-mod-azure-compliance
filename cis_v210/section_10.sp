locals {
  cis_v210_10_common_tags = merge(local.cis_v210_common_tags, {
    cis_section_id = "10"
  })
}

benchmark "cis_v210_10" {
  title         = "10 Miscellaneous"
  documentation = file("./cis_v210/docs/cis_v210_10.md")
  children = [
    control.cis_v210_10_1
  ]

  tags = merge(local.cis_v210_10_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v210_10_1" {
  title         = "10.1 Ensure that Resource Locks are set for Mission-Critical Azure Resources"
  description   = "Resource Manager Locks provide a way for administrators to lock down Azure resources to prevent deletion of, or modifications to, a resource. These locks sit outside of the Role Based Access Controls (RBAC) hierarchy and, when applied, will place restrictions on the resource for all users."
  query         = query.manual_control
  documentation = file("./cis_v210/docs/cis_v210_10_1.md")

  tags = merge(local.cis_v210_8_common_tags, {
    cis_item_id = "10.1"
    cis_level   = "2"
    cis_type    = "manual"
  })
}
