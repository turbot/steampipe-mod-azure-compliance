locals {
  cis_v500_3_common_tags = merge(local.cis_v500_common_tags, {
    cis_section_id = "3"
  })
}

locals {
  cis_v500_3_1_common_tags = merge(local.cis_v500_3_common_tags, {
    cis_section_id = "3.1"
  })
}

benchmark "cis_v500_3" {
  title         = "3 Compute Services"
  documentation = file("./cis_v500/docs/cis_v500_3.md")
  children = [
    benchmark.cis_v500_3_1
  ]

  tags = merge(local.cis_v500_3_common_tags, {
    type = "Benchmark"
  })
}

benchmark "cis_v500_3_1" {
  title         = "3.1 Virtual Machines"
  documentation = file("./cis_v500/docs/cis_v500_3_1.md")
  children = [
    control.cis_v500_3_1_1
  ]

  tags = merge(local.cis_v500_3_1_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v500_3_1_1" {
  title         = "3.1.1 Ensure only MFA enabled identities can access privileged Virtual Machine"
  description   = "Verify identities without MFA that can log in to a privileged virtual machine using separate login credentials. An adversary can leverage the access to move laterally and perform actions with the virtual machine's managed identity. Make sure the virtual machine only has necessary permissions, and revoke the admin-level permissions according to the principle of least privilege."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_3_1_1.md")

  tags = merge(local.cis_v500_3_1_common_tags, {
    cis_item_id = "3.1.1"
    cis_level   = "2"
    cis_type    = "manual"
  })
}

