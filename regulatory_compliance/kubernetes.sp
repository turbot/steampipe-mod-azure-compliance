locals {
  regulatory_compliance_kubernetes_common_tags = {
    service = "Azure/KubernetesService"
  }
}

control "kubernetes_instance_rbac_enabled" {
  title       = "Role-Based Access Control (RBAC) should be used on Kubernetes Services"
  description = "To provide granular filtering on the actions that users can perform, use Role-Based Access Control (RBAC) to manage permissions in Kubernetes Service Clusters and configure relevant authorization policies."
  query       = query.kubernetes_instance_rbac_enabled

  tags = merge(local.regulatory_compliance_kubernetes_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "kubernetes_azure_defender_enabled" {
  title       = "Azure Defender for Kubernetes should be enabled"
  description = "Azure Defender for Kubernetes provides real-time threat protection for containerized environments and generates alerts for suspicious activities."
  query       = query.kubernetes_azure_defender_enabled

  tags = merge(local.regulatory_compliance_kubernetes_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "kubernetes_cluster_add_on_azure_policy_enabled" {
  title       = "Azure Policy Add-on for Kubernetes service (AKS) should be installed and enabled on your clusters"
  description = "Azure Policy Add-on for Kubernetes service (AKS) extends Gatekeeper v3, an admission controller webhook for Open Policy Agent (OPA), to apply at-scale enforcements and safeguards on your clusters in a centralized, consistent manner."
  query       = query.kubernetes_cluster_add_on_azure_policy_enabled

  tags = merge(local.regulatory_compliance_kubernetes_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "kubernetes_cluster_authorized_ip_range_defined" {
  title       = "Authorized IP ranges should be defined on Kubernetes Services"
  description = "ARestrict access to the Kubernetes Service Management API by granting API access only to IP addresses in specific ranges. It is recommended to limit access to authorized IP ranges to ensure that only applications from allowed networks can access the cluster."
  query       = query.kubernetes_cluster_authorized_ip_range_defined

  tags = merge(local.regulatory_compliance_kubernetes_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "kubernetes_cluster_os_and_data_disks_encrypted_with_cmk" {
  title       = "Both operating systems and data disks in Azure Kubernetes Service clusters should be encrypted by customer-managed keys"
  description = "Encrypting OS and data disks using customer-managed keys provides more control and greater flexibility in key management. This is a common requirement in many regulatory and industry compliance standards."
  query       = query.kubernetes_cluster_os_and_data_disks_encrypted_with_cmk

  tags = merge(local.regulatory_compliance_kubernetes_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "kubernetes_cluster_temp_disks_and_agent_node_pool_cache_encrypted_at_host" {
  title       = "Temp disks and cache for agent node pools in Azure Kubernetes Service clusters should be encrypted at host"
  description = "To enhance data security, the data stored on the virtual machine (VM) host of your Azure Kubernetes Service nodes VMs should be encrypted at rest. This is a common requirement in many regulatory and industry compliance standards."
  query       = query.kubernetes_cluster_temp_disks_and_agent_node_pool_cache_encrypted_at_host

  tags = merge(local.regulatory_compliance_kubernetes_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "kubernetes_cluster_upgraded_with_non_vulnerable_version" {
  title       = "Kubernetes Services should be upgraded to a non-vulnerable Kubernetes version"
  description = "Upgrade your Kubernetes service cluster to a later Kubernetes version to protect against known vulnerabilities in your current Kubernetes version. Vulnerability CVE-2019-9946 has been patched in Kubernetes versions 1.11.9+, 1.12.7+, 1.13.5+, and 1.14.0+."
  query       = query.kubernetes_cluster_upgraded_with_non_vulnerable_version

  tags = merge(local.regulatory_compliance_kubernetes_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "arc_kubernetes_cluster_azure_defender_extension_installed" {
  title       = "Azure Arc enabled Kubernetes clusters should have Azure Defender's extension installed"
  description = "Azure Defender's extension for Azure Arc provides threat protection for your Arc enabled Kubernetes clusters. The extension collects data from nodes in the cluster and sends it to the Azure Defender for Kubernetes backend in the cloud for further analysis."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_kubernetes_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "kubernetes_cluster_pods_and_containers_uses_approved_user_and_group_id" {
  title       = "Kubernetes cluster pods and containers should only run with approved user and group IDs"
  description = "Control the user, primary group, supplemental group and file system group IDs that pods and containers can use to run in a Kubernetes Cluster. This recommendation is part of Pod Security Policies which are intended to improve the security of your Kubernetes environments. This policy is generally available for Kubernetes Service (AKS), and preview for AKS Engine and Azure Arc enabled Kubernetes."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_kubernetes_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

query "kubernetes_instance_rbac_enabled" {
  sql = <<-EOQ
    select
      kc.id as resource,
      case
        when enable_rbac then 'ok'
        else 'alarm'
      end as status,
      case
        when enable_rbac then name || ' role based access control enabled.'
        else name || ' role based access control disabled.'
      end as reason,
      enable_rbac
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "kc.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_kubernetes_cluster kc,
      azure_subscription sub
    where
      sub.subscription_id = kc.subscription_id;
  EOQ
}

query "kubernetes_azure_defender_enabled" {
  sql = <<-EOQ
    select
      kc.id as resource,
      case
        when enable_rbac then 'ok'
        else 'alarm'
      end as status,
      case
        when enable_rbac then name || ' role based access control enabled.'
        else name || ' role based access control disabled.'
      end as reason,
      enable_rbac
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "kc.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_kubernetes_cluster kc,
      azure_subscription sub
    where
      sub.subscription_id = kc.subscription_id;
  EOQ
}

query "kubernetes_cluster_add_on_azure_policy_enabled" {
  sql = <<-EOQ
    select
      kc.id as resource,
      case
        when addon_profiles -> 'azurepolicy' ->> 'enabled' = 'true' then 'ok'
        else 'alarm'
      end as status,
      case
        when addon_profiles -> 'azurepolicy' ->> 'enabled' = 'true' then name || ' add on azure policy enabled.'
        else name || ' add on azure policy disabled.'
      end as reason,
      enable_rbac
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "kc.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_kubernetes_cluster kc,
      azure_subscription sub
    where
      sub.subscription_id = kc.subscription_id;
  EOQ
}

query "kubernetes_cluster_authorized_ip_range_defined" {
  sql = <<-EOQ
    select
      c.id as resource,
      case
        when api_server_access_profile -> 'AuthorizedIPRanges' is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when api_server_access_profile -> 'AuthorizedIPRanges' is not null then c.title || ' authorized IP ranges defined.'
        else c.title || ' authorized IP ranges not defined.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "c.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_kubernetes_cluster as c,
      azure_subscription as sub
    where
      sub.subscription_id = c.subscription_id;
  EOQ
}

query "kubernetes_cluster_os_and_data_disks_encrypted_with_cmk" {
  sql = <<-EOQ
    select
      c.id as resource,
      case
        when disk_encryption_set_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when disk_encryption_set_id is not null then c.name || ' os and data diska encrypted with CMK.'
        else c.name || ' os and data diska not encrypted with CMK.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "c.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_kubernetes_cluster c,
      azure_subscription sub
    where
      sub.subscription_id = c.subscription_id;
  EOQ
}

query "kubernetes_cluster_temp_disks_and_agent_node_pool_cache_encrypted_at_host" {
  sql = <<-EOQ
    with kubernetes_cluster as(
        select
        id,
        name,
        subscription_id,
        resource_group
      from
        azure_kubernetes_cluster,
        jsonb_array_elements(agent_pool_profiles) as p
      where
      p -> 'enableEncryptionAtHost' = 'true'
    )
    select
      a.id as resource,
      case
        when s.id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when s.id is not null then a.name || ' encrypted at host.'
        else a.name || ' not encrypted at host.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_kubernetes_cluster as a
      left join kubernetes_cluster as s on s.id = a.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "kubernetes_cluster_upgraded_with_non_vulnerable_version" {
  sql = <<-EOQ
    with kubernetes_cluster as(
        select
        id,
        name,
        subscription_id,
        resource_group
      from
        azure_kubernetes_cluster,
        jsonb_array_elements(agent_pool_profiles) as p
      where
      p -> 'enableEncryptionAtHost' = 'true'
    )
    select
      a.id as resource,
      case
        when s.id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when s.id is not null then a.name || ' encrypted at host.'
        else a.name || ' not encrypted at host.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_kubernetes_cluster as a
      left join kubernetes_cluster as s on s.id = a.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}