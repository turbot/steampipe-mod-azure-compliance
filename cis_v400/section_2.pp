locals {
  cis_v400_2_common_tags = merge(local.cis_v400_2_common_tags, {
    cis_section_id = "2"
  })
}

locals {
  cis_v400_2_1_common_tags = merge(local.cis_v400_2_common_tags, {
    cis_section_id = "2.1"
  })
  cis_v400_2_1_1_common_tags = merge(local.cis_v400_2_common_tags, {
    cis_section_id = "2.1.1"
  })
  cis_v400_2_1_1_1_common_tags = merge(local.cis_v400_2_common_tags, {
    cis_section_id = "2.1.1.1"
  })
  cis_v400_2_1_1_2_common_tags = merge(local.cis_v400_2_common_tags, {
    cis_section_id = "2.1.1.2"
  })
  cis_v400_2_2_common_tags = merge(local.cis_v400_2_common_tags, {
    cis_section_id = "2.2"
  })
  cis_v400_2_2_1_common_tags = merge(local.cis_v400_2_common_tags, {
    cis_section_id = "2.2.1"
  })
  cis_v400_2_2_2_common_tags = merge(local.cis_v400_2_common_tags, {
    cis_section_id = "2.2.2"
  })
}

benchmark "cis_v400_2" {
  title         = "2 Common Reference Recommendations"
  documentation = file("./cis_v400/docs/cis_v400_2.md")
  children = [
    benchmark.cis_v400_2_1,
    benchmark.cis_v400_2_2
  ]

  tags = merge(local.cis_v400_2_common_tags, {
    type    = "Benchmark"
    service = "Azure/General"
  })
}

benchmark "cis_v400_2_1" {
  title         = "2.1 Secrets and Keys"
  documentation = file("./cis_v400/docs/cis_v400_2_1.md")
  children = [
    benchmark.cis_v400_2_1_1
  ]

  tags = merge(local.cis_v400_2_1_common_tags, {
    type    = "Benchmark"
    service = "Azure/General"
  })
}

benchmark "cis_v400_2_1_1" {
  title         = "2.1.1 Encryption Key Management"
  documentation = file("./cis_v400/docs/cis_v400_2_1_1.md")
  children = [
    benchmark.cis_v400_2_1_1_1,
    benchmark.cis_v400_2_1_1_2
  ]

  tags = merge(local.cis_v400_2_1_1_common_tags, {
    type    = "Benchmark"
    service = "Azure/General"
  })
}

benchmark "cis_v400_2_1_1_1" {
  title         = "2.1.1.1 Microsoft Managed Keys"
  documentation = file("./cis_v400/docs/cis_v400_2_1_1_1.md")
  children = [
    control.cis_v400_2_1_1_1_1
  ]

  tags = merge(local.cis_v400_2_1_1_1_common_tags, {
    type    = "Benchmark"
    service = "Azure/General"
  })
}

control "cis_v400_2_1_1_1_1" {
  title         = "2.1.1.1.1 Ensure Critical Data is Encrypted with Microsoft Managed Keys (MMK)"
  description   = "Microsoft Managed Keys (MMK) (also known as Platform-managed keys (PMK)) provides a very low overhead method of encrypting data at rest and implementing encryption key management."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_2_1_1_1_1.md")

  tags = merge(local.cis_v400_2_1_1_1_common_tags, {
    cis_item_id = "2.1.1.1.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/General"
  })
}

benchmark "cis_v400_2_1_1_2" {
  title         = "2.1.1.2 Customer Managed Keys"
  documentation = file("./cis_v400/docs/cis_v400_2_1_1_2.md")
  children = [
    control.cis_v400_2_1_1_2_1
  ]

  tags = merge(local.cis_v400_2_1_1_2_common_tags, {
    type    = "Benchmark"
    service = "Azure/General"
  })
}

control "cis_v400_2_1_1_2_1" {
  title         = "2.1.1.2.1 Ensure Critical Data is Encrypted with Customer Managed Keys (CMK)"
  description   = "Customer Managed Keys introduce additional depth to security by providing a means to manage access control for encryption keys."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_2_1_1_2_1.md")

  tags = merge(local.cis_v400_2_1_1_2_common_tags, {
    cis_item_id = "2.1.1.2.1"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/General"
  })
}



benchmark "cis_v400_2_2" {
  title         = "2.2 Networking"
  documentation = file("./cis_v400/docs/cis_v400_2_2.md")
  children = [
    benchmark.cis_v400_2_2_1,
    benchmark.cis_v400_2_2_2
  ]

  tags = merge(local.cis_v400_2_2_common_tags, {
    type    = "Benchmark"
    service = "Azure/VPC"
  })
}

benchmark "cis_v400_2_2_1" {
  title         = "2.2.1 Virtual Networks (VNets)"
  documentation = file("./cis_v400/docs/cis_v400_2_2_1.md")
  children = [
    control.cis_v400_2_2_1_1,
    control.cis_v400_2_2_1_2
  ]

  tags = merge(local.cis_v400_2_2_1_common_tags, {
    type    = "Benchmark"
    service = "Azure/General"
  })
}

control "cis_v400_2_2_1_1" {
  title         = "2.2.1.1 Ensure public network access is Disabled"
  description   = "Disable public network access to prevent exposure to the internet and reduce the risk of unauthorized access."
  query         = query.automated
  documentation = file("./cis_v400/docs/cis_v400_2_2_1_1.md")

  tags = merge(local.cis_v400_2_2_1_common_tags, {
    cis_item_id = "2.2.1.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/General"
  })
}

control "cis_v400_2_2_1_2" {
  title         = "2.2.1.2 Ensure Network Access Rules are set to Deny-by-default"
  description   = "Restricting default network access provides a foundational level of security to networked resources."
  query         = query.automated
  documentation = file("./cis_v400/docs/cis_v400_2_2_1_2.md")

  tags = merge(local.cis_v400_2_2_1_common_tags, {
    cis_item_id = "2.2.1.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/General"
  })
}

benchmark "cis_v400_2_2_2" {
  title         = "2.2.2 Private Endpoints"
  documentation = file("./cis_v400/docs/cis_v400_2_2_2.md")
  children = [
    control.cis_v400_2_2_2_1
  ]

  tags = merge(local.cis_v400_2_2_2_common_tags, {
    type    = "Benchmark"
    service = "Azure/General"
  })
}

control "cis_v400_2_2_2_1" {
  title         = "2.2.2.1 Ensure Private Endpoints are used to access {service}"
  description   = "Use private endpoints to allow clients and services to securely access data located over a network via an encrypted Private Link."
  query         = query.automated
  documentation = file("./cis_v400/docs/cis_v400_2_2_2_1.md")

  tags = merge(local.cis_v400_2_2_2_common_tags, {
    cis_item_id = "2.2.2.1"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/General"
  })
}


