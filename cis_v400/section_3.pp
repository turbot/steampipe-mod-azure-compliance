locals {
  cis_v400_3_common_tags = merge(local.cis_v400_3_common_tags, {
    cis_section_id = "3"
  })
}

locals {
  cis_v400_3_1_common_tags = merge(local.cis_v400_3_common_tags, {
    cis_section_id = "3.1"
  })
}

benchmark "cis_v400_3" {
  title         = "3 Analytics Services"
  documentation = file("./cis_v400/docs/cis_v400_3.md")
  children = [
    benchmark.cis_v400_3_1
  ]

  tags = merge(local.cis_v400_3_common_tags, {
    type    = "Benchmark"
    service = "Azure/General"
  })
}

benchmark "cis_v400_3_1" {
  title         = "3.1 Azure Databricks"
  documentation = file("./cis_v400/docs/cis_v400_3_1.md")
  children = [
    control.cis_v400_3_1_1,
    control.cis_v400_3_1_2,
    control.cis_v400_3_1_3,
    control.cis_v400_3_1_4,
    control.cis_v400_3_1_5,
    control.cis_v400_3_1_6,
    control.cis_v400_3_1_7,
    control.cis_v400_3_1_8
  ]

  tags = merge(local.cis_v400_3_1_common_tags, {
    type    = "Benchmark"
    service = "Azure/General"
  })
}

control "cis_v400_3_1_1" {
  title         = "3.1.1 Ensure that Azure Databricks is deployed in a customer-managed virtual network (VNet)"
  description   = "Networking for Azure Databricks can be set up in a few different ways."
  query         = query.databricks_workspace_deployed_in_custom_vnet
  documentation = file("./cis_v400/docs/cis_v400_3_1_1.md")

  tags = merge(local.cis_v400_3_1_common_tags, {
    cis_item_id = "3.1.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/General"
  })
}

control "cis_v400_3_1_2" {
  title         = "3.1.2 Ensure that network security groups are configured for Databricks subnets"
  description   = "Network Security Groups (NSGs) should be implemented to control inbound and outbound traffic to Azure Databricks subnets, ensuring only authorized communication."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_3_1_2.md")

  tags = merge(local.cis_v400_3_1_common_tags, {
    cis_item_id = "3.1.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/General"
  })
}

control "cis_v400_3_1_3" {
  title         = "3.1.3 Ensure that traffic is encrypted between cluster worker nodes"
  description   = "By default, data exchanged between worker nodes in an Azure Databricks cluster is not encrypted."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_3_1_3.md")

  tags = merge(local.cis_v400_3_1_common_tags, {
    cis_item_id = "3.1.3"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/General"
  })
}

control "cis_v400_3_1_4" {
  title         = "3.1.4 Ensure that users and groups are synced from Microsoft Entra ID to Azure Databricks"
  description   = "To ensure centralized identity and access management, users and groups from Microsoft Entra ID should be synchronized with Azure Databricks."
  query         = query.databricks_workspace_user_sync_configured
  documentation = file("./cis_v400/docs/cis_v400_3_1_4.md")

  tags = merge(local.cis_v400_3_1_common_tags, {
    cis_item_id = "3.1.4"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/General"
  })
}

control "cis_v400_3_1_5" {
  title         = "3.1.5 Ensure that Unity Catalog is configured for Azure Databricks"
  description   = "Unity Catalog is a centralized governance model for managing and securing data in Azure Databricks."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_3_1_5.md")

  tags = merge(local.cis_v400_3_1_common_tags, {
    cis_item_id = "3.1.5"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/General"
  })
}

control "cis_v400_3_1_6" {
  title         = "3.1.6 Ensure that usage is restricted and expiry is enforced for Databricks personal access tokens"
  description   = "Databricks personal access tokens (PATs) provide API-based authentication for users and applications."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_3_1_6.md")

  tags = merge(local.cis_v400_3_1_common_tags, {
    cis_item_id = "3.1.6"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/General"
  })
}

control "cis_v400_3_1_7" {
  title         = "3.1.7 Ensure that diagnostic log delivery is configured for Azure Databricks"
  description   = "Azure Databricks Diagnostic Logging provides insights into system operations, user activities, and security events within a Databricks workspace."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_3_1_7.md")

  tags = merge(local.cis_v400_3_1_common_tags, {
    cis_item_id = "3.1.7"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/General"
  })
}

control "cis_v400_3_1_8" {
  title         = "3.1.8 Ensure that data at rest and in transit is encrypted in Azure Databricks using customer managed keys (CMK)"
  description   = "Azure Databricks encrypts data in transit using TLS 1."
  query         = query.databricks_workspace_cmk_configured
  documentation = file("./cis_v400/docs/cis_v400_3_1_8.md")

  tags = merge(local.cis_v400_3_1_common_tags, {
    cis_item_id = "3.1.8"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/General"
  })
}
