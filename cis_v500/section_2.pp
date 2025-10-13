locals {
  cis_v500_2_common_tags = merge(local.cis_v500_common_tags, {
    cis_section_id = "2"
  })
}

locals {
  cis_v500_2_1_common_tags = merge(local.cis_v500_2_common_tags, {
    cis_section_id = "2.1"
  })
}

benchmark "cis_v500_2" {
  title         = "2 Analytics Services"
  documentation = file("./cis_v500/docs/cis_v500_2.md")
  children = [
    benchmark.cis_v500_2_1
  ]

  tags = merge(local.cis_v500_2_common_tags, {
    type = "Benchmark"
  })
}

benchmark "cis_v500_2_1" {
  title         = "2.1 Azure Databricks"
  documentation = file("./cis_v500/docs/cis_v500_2_1.md")
  children = [
    control.cis_v500_2_1_1,
    control.cis_v500_2_1_2,
    control.cis_v500_2_1_3,
    control.cis_v500_2_1_4,
    control.cis_v500_2_1_5,
    control.cis_v500_2_1_6,
    control.cis_v500_2_1_7,
    control.cis_v500_2_1_8,
    control.cis_v500_2_1_9,
    control.cis_v500_2_1_10,
    control.cis_v500_2_1_11
  ]

  tags = merge(local.cis_v500_2_1_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v500_2_1_1" {
  title         = "2.1.1 Ensure that Azure Databricks is deployed in a customer-managed virtual network (VNet)"
  description   = "Networking for Azure Databricks can be set up in a few different ways. Using a customer-managed Virtual Network (VNet) (also known as VNet Injection) ensures that compute clusters and control planes are securely isolated within the organization’s network boundary. By default, Databricks creates a managed VNet, which provides limited control over network security policies, firewall configurations, and routing"
  query         = query.databricks_workspace_deployed_in_custom_vnet
  documentation = file("./cis_v500/docs/cis_v500_2_1_1.md")

  tags = merge(local.cis_v500_2_1_common_tags, {
    cis_item_id = "2.1.1"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

control "cis_v500_2_1_2" {
  title         = "2.1.2 Ensure that network security groups are configured for Databricks subnets"
  description   = "Network Security Groups (NSGs) should be implemented to control inbound and outbound traffic to Azure Databricks subnets, ensuring only authorized communication. NSGs operate using a rule-based model that includes both explicit allow/deny rules and an implicit deny at the end of the rule list. This means that any traffic not explicitly allowed is automatically denied. To ensure secure and predictable behavior, NSGs should be configured with explicit deny rules for known unwanted traffic, in addition to the default implicit deny, to improve visibility and auditability of blocked traffic. This approach helps enforce least privilege and minimizes the risk of unauthorized access to Databricks resources."
  query         = query.databricks_workspace_subnet_with_nsg_configured
  documentation = file("./cis_v500/docs/cis_v500_2_1_2.md")

  tags = merge(local.cis_v500_2_1_common_tags, {
    cis_item_id = "2.1.2"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

control "cis_v500_2_1_3" {
  title         = "2.1.3 Ensure that traffic is encrypted between cluster worker nodes"
  description   = "By default, data exchanged between worker nodes in an Azure Databricks cluster is not encrypted. To ensure that data is encrypted at all times, whether at rest or in transit, you can create an initialization script that configures your clusters to encrypt traffic between worker nodes using AES 256-bit encryption over a TLS 1.3 connection.."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_2_1_3.md")

  tags = merge(local.cis_v500_2_1_common_tags, {
    cis_item_id = "2.1.3"
    cis_level   = "2"
    cis_type    = "manual"
  })
}

control "cis_v500_2_1_4" {
  title         = "2.1.4 Ensure that users and groups are synced from Microsoft Entra ID to Azure Databricks"
  description   = "To ensure centralized identity and access management, users and groups from Microsoft Entra ID should be synchronized with Azure Databricks. This is achieved through SCIM provisioning, which automates the creation, update, and deactivation of users and groups in Databricks based on Entra ID assignments. Enabling this integration ensures that access controls in Databricks remain consistent with corporate identity governance policies, reducing the risk of orphaned accounts, stale permissions, and unauthorized access."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_2_1_4.md")

  tags = merge(local.cis_v500_2_1_common_tags, {
    cis_item_id = "2.1.4"
    cis_level   = "1"
    cis_type    = "manual"
  })
}

control "cis_v500_2_1_5" {
  title         = "2.1.5 Ensure that Unity Catalog is configured for Azure Databricks"
  description   = "Unity Catalog is a centralized governance model for managing and securing data in Azure Databricks. It provides fine-grained access control to databases, tables, and views using Microsoft Entra ID identities. Unity Catalog also enhances data lineage, audit logging, and compliance monitoring, making it a critical component for security and governance."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_2_1_5.md")

  tags = merge(local.cis_v500_2_1_common_tags, {
    cis_item_id = "2.1.5"
    cis_level   = "1"
    cis_type    = "manual"
  })
}

control "cis_v500_2_1_6" {
  title         = "2.1.6 Ensure that usage is restricted and expiry is enforced for Databricks personal access tokens"
  description   = "Databricks personal access tokens (PATs) provide API-based authentication for users and applications. By default, users can generate API tokens without expiration, leading to potential security risks if tokens are leaked, improperly stored, or not rotated regularly."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_2_1_6.md")

  tags = merge(local.cis_v500_2_1_common_tags, {
    cis_item_id = "2.1.6"
    cis_level   = "1"
    cis_type    = "manual"
  })
}

control "cis_v500_2_1_7" {
  title         = "2.1.7 Ensure that diagnostic log delivery is configured for Azure Databricks"
  description   = "Azure Databricks Diagnostic Logging provides insights into system operations, user activities, and security events within a Databricks workspace. Enabling diagnostic logs helps organizations: Detect security threats by logging access, job executions, and cluster activities, Ensure compliance with industry regulations such as SOC 2, HIPAA, and GDPR ,Monitor operational performance and troubleshoot issues proactively."
  query         = query.databricks_workspace_diagnostic_log_delivery_configured
  documentation = file("./cis_v500/docs/cis_v500_2_1_7.md")

  tags = merge(local.cis_v500_2_1_common_tags, {
    cis_item_id = "2.1.7"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

control "cis_v500_2_1_8" {
  title         = "2.1.8 Ensure critical data in Azure Databricks is encrypted with customer-managed keys (CMK)"
  description   = "Customer-managed keys introduce additional depth to security by providing a means to manage access control for encryption keys. Where compliance and security frameworks indicate the need, and organizational capacity allows, sensitive data at rest can be encrypted using customer-managed keys (CMK) rather than Microsoft-managed keys."
  query         = query.databricks_workspace_cmk_configured
  documentation = file("./cis_v500/docs/cis_v500_2_1_8.md")

  tags = merge(local.cis_v500_2_1_common_tags, {
    cis_item_id = "2.1.8"
    cis_level   = "2"
    cis_type    = "manual"
  })
}

control "cis_v500_2_1_9" {
  title         = "2.1.9 Ensure 'No Public IP' is set to 'Enabled'"
  description   = "Enable secure cluster connectivity (also known as no public IP) on Azure Databricks workspaces to ensure that clusters do not have public IP addresses and communicate with the control plane over a secure connection."
  query         = query.databricks_workspace_no_public_ip_enabled
  documentation = file("./cis_v500/docs/cis_v500_2_1_9.md")

  tags = merge(local.cis_v500_2_1_common_tags, {
    cis_item_id = "2.1.9"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

control "cis_v500_2_1_10" {
  title         = "2.1.10 Ensure 'Allow Public Network Access' is set to 'Disabled'"
  description   = "Disable public network access to prevent exposure to the internet and reduce the risk of unauthorized access. Use private endpoints to securely manage access within trusted networks."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_2_1_10.md")

  tags = merge(local.cis_v500_2_1_common_tags, {
    cis_item_id = "2.1.10"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

control "cis_v500_2_1_11" {
  title         = "2.1.11 Ensure private endpoints are used to access Azure Databricks workspaces"
  description   = "Use private endpoints for Azure Databricks workspaces to allow clients and services to securely access data located over a network via an encrypted Private Link. To do this, the private endpoint uses an IP address from the VNet for each service. Network traffic between disparate services securely traverses encrypted over the VNet. This VNet can also link addressing space, extending your network and accessing resources on it. Similarly, it can be a tunnel through public networks to connect remote infrastructures together. This creates further security through segmenting network traffic and preventing outside sources from accessing it."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_2_1_11.md")

  tags = merge(local.cis_v500_2_1_common_tags, {
    cis_item_id = "2.1.11"
    cis_level   = "2"
    cis_type    = "automated"
  })
}

