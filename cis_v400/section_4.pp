locals {
  cis_v400_4_common_tags = merge(local.cis_v400_4_common_tags, {
    cis_section_id = "4"
  })
}

locals {
  cis_v400_4_1_common_tags = merge(local.cis_v400_4_common_tags, {
    cis_section_id = "4.1"
  })
}

benchmark "cis_v400_4" {
  title         = "4 Compute Services"
  documentation = file("./cis_v400/docs/cis_v400_4.md")
  children = [
    benchmark.cis_v400_4_1
  ]

  tags = merge(local.cis_v400_4_common_tags, {
    type    = "Benchmark"
    service = "Azure/General"
  })
}

benchmark "cis_v400_4_1" {
  title         = "4.1 Virtual Machines"
  documentation = file("./cis_v400/docs/cis_v400_4_1.md")
  children = [
    control.cis_v400_4_1_1
  ]

  tags = merge(local.cis_v400_4_1_common_tags, {
    type    = "Benchmark"
    service = "Azure/Compute"
  })
}

control "cis_v400_4_1_1" {
  title         = "4.1.1 Ensure only MFA enabled identities can access privileged Virtual Machine"
  description   = "Verify identities without MFA that can log in to a privileged virtual machine using separate login credentials."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_4_1_1.md")

  tags = merge(local.cis_v400_4_1_common_tags, {
    cis_item_id = "4.1.1"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/Compute"
  })
}

