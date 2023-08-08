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
  title       = "Azure Arc enabled Kubernetes clusters should have Microsoft Defender for Cloud extension installed"
  description = "Microsoft Defender for Cloud extension for Azure Arc provides threat protection for your Arc enabled Kubernetes clusters. The extension collects data from all nodes in the cluster and sends it to the Azure Defender for Kubernetes backend in the cloud for further analysis."
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

control "kubernetes_cluster_container_cpu_and_memory_resource_limit" {
  title       = "Kubernetes cluster containers CPU and memory resource limits should not exceed the specified limits"
  description = "Enforce container CPU and memory resource limits to prevent resource exhaustion attacks in a Kubernetes cluster. This policy is generally available for Kubernetes Service (AKS), and preview for Azure Arc enabled Kubernetes. For more information, see https://aka.ms/kubepolicydoc."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_kubernetes_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "kubernetes_cluster_container_host_process_id_not_shared" {
  title       = "Kubernetes cluster containers should not share host process ID or host IPC namespace"
  description = "Block pod containers from sharing the host process ID namespace and host IPC namespace in a Kubernetes cluster. This recommendation is part of CIS 5.2.2 and CIS 5.2.3 which are intended to improve the security of your Kubernetes environments. This policy is generally available for Kubernetes Service (AKS), and preview for Azure Arc enabled Kubernetes. For more information, see https://aka.ms/kubepolicydoc."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_kubernetes_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "kubernetes_cluster_container_use_allowed_apparmor_profile" {
  title       = "Kubernetes cluster containers should only use allowed AppArmor profiles"
  description = "Containers should only use allowed AppArmor profiles in a Kubernetes cluster. This policy is generally available for Kubernetes Service (AKS), and preview for Azure Arc enabled Kubernetes. For more information, see https://aka.ms/kubepolicydoc."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_kubernetes_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "kubernetes_cluster_container_use_allowed_capabilities" {
  title       = "Kubernetes cluster containers should only use allowed capabilities"
  description = "Restrict the capabilities to reduce the attack surface of containers in a Kubernetes cluster. This recommendation is part of CIS 5.2.8 and CIS 5.2.9 which are intended to improve the security of your Kubernetes environments. This policy is generally available for Kubernetes Service (AKS), and preview for Azure Arc enabled Kubernetes. For more information, see https://aka.ms/kubepolicydoc."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_kubernetes_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "kubernetes_cluster_container_use_allowed_images" {
  title       = "Kubernetes cluster containers should only use allowed images"
  description = "Use images from trusted registries to reduce the Kubernetes cluster's exposure risk to unknown vulnerabilities, security issues and malicious images. This policy is generally available for Kubernetes Service (AKS), and preview for Azure Arc enabled Kubernetes. For more information, see https://aka.ms/kubepolicydoc."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_kubernetes_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "kubernetes_cluster_container_with_read_only_root_file_system" {
  title       = "Kubernetes cluster containers should run with a read only root file system"
  description = "Run containers with a read only root file system to protect from changes at run-time with malicious binaries being added to PATH in a Kubernetes cluster. This policy is generally available for Kubernetes Service (AKS), and preview for Azure Arc enabled Kubernetes. For more information, see https://aka.ms/kubepolicydoc."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_kubernetes_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "kubernetes_cluster_pod_host_path_volume_use_allowed_host_path" {
  title       = "Kubernetes cluster pod hostPath volumes should only use allowed host paths"
  description = "Limit pod HostPath volume mounts to the allowed host paths in a Kubernetes Cluster. This policy is generally available for Kubernetes Service (AKS), and Azure Arc enabled Kubernetes. For more information, see https://aka.ms/kubepolicydoc."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_kubernetes_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "kubernetes_cluster_pod_use_approved_host_network_and_port_range" {
  title       = "Kubernetes cluster pods should only use approved host network and port range"
  description = "Restrict pod access to the host network and the allowable host port range in a Kubernetes cluster. This recommendation is part of CIS 5.2.4 which is intended to improve the security of your Kubernetes environments. This policy is generally available for Kubernetes Service (AKS), and preview for Azure Arc enabled Kubernetes. For more information, see https://aka.ms/kubepolicydoc."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_kubernetes_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "kubernetes_cluster_service_listen_to_allowed_ports" {
  title       = "Kubernetes cluster services should listen only on allowed ports"
  description = "Restrict services to listen only on allowed ports to secure access to the Kubernetes cluster. This policy is generally available for Kubernetes Service (AKS), and preview for Azure Arc enabled Kubernetes. For more information, see https://aka.ms/kubepolicydoc."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_kubernetes_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "kubernetes_cluster_privilege_containers_restricted" {
  title       = "Kubernetes cluster should not allow privileged containers"
  description = "Do not allow privileged containers creation in a Kubernetes cluster. This recommendation is part of CIS 5.2.1 which is intended to improve the security of your Kubernetes environments. This policy is generally available for Kubernetes Service (AKS), and preview for Azure Arc enabled Kubernetes. For more information, see https://aka.ms/kubepolicydoc."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_kubernetes_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "kubernetes_cluster_container_privilege_escalation_restricted" {
  title       = "Kubernetes clusters should not allow container privilege escalation"
  description = "Do not allow containers to run with privilege escalation to root in a Kubernetes cluster. This recommendation is part of CIS 5.2.5 which is intended to improve the security of your Kubernetes environments. This policy is generally available for Kubernetes Service (AKS), and preview for Azure Arc enabled Kubernetes. For more information, see https://aka.ms/kubepolicydoc."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_kubernetes_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "kubernetes_cluster_https_enabled" {
  title       = "Kubernetes clusters should be accessible only over HTTPS"
  description = "Use of HTTPS ensures authentication and protects data in transit from network layer eavesdropping attacks. This capability is currently generally available for Kubernetes Service (AKS), and in preview for Azure Arc enabled Kubernetes. For more info, visit https://aka.ms/kubepolicydoc"
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_kubernetes_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "kubernetes_cluster_restrict_public_access" {
  title       = "Kubernetes cluster should restrict public access"
  description = "Ensure that Kubernetes cluster enables private clusters to restrict public access."
  query       = query.kubernetes_cluster_restrict_public_access

  tags = merge(local.regulatory_compliance_kubernetes_common_tags, {
    other_checks = "true"
  })
}

control "kubernetes_cluster_addon_azure_policy_enabled" {
  title       = "Kubernetes cluster addon Azure policy should be enabled"
  description = "Ensure that Kubernetes cluster uses Azure Policies Add-on."
  query       = query.kubernetes_cluster_addon_azure_policy_enabled

  tags = merge(local.regulatory_compliance_kubernetes_common_tags, {
    other_checks = "true"
  })
}

control "kubernetes_cluster_node_restrict_public_access" {
  title       = "Kubernetes cluster nodes should prohibit public access"
  description = "Ensure Kubernetes cluster nodes do not have public IP addresses. This control is non-compliant if Kubernetes cluster nodes have a public IP address assigned."
  query       = query.kubernetes_cluster_node_restrict_public_access

  tags = merge(local.regulatory_compliance_kubernetes_common_tags, {
    other_checks = "true"
  })
}

control "kubernetes_cluster_sku_standard" {
  title       = "Kubernetes clusters should use standard SKU"
  description = "Ensure that Kubernetes clusters uses standard SKU tier for production workloads. This control is non-compliant if App Configuration does not use standard SKU."
  query       = query.kubernetes_cluster_sku_standard

  tags = merge(local.regulatory_compliance_kubernetes_common_tags, {
    other_checks = "true"
  })
}

control "kubernetes_cluster_upgrade_channel" {
  title       = "Kubernetes clusters upgrade channel should be configured"
  description = "Ensure Kubernetes clusters upgrade channel is configured. This control is non-compliant if Kubernetes clusters upgrade channel is set to none."
  query       = query.kubernetes_cluster_upgrade_channel

  tags = merge(local.regulatory_compliance_kubernetes_common_tags, {
    other_checks = "true"
  })
}

control "kubernetes_cluster_logging_enabled" {
  title       = "Kubernetes clusters should have logging enabled"
  description = "This control checks if OMS agent is enabled for Kubernetes cluster."
  query       = query.kubernetes_cluster_logging_enabled

  tags = merge(local.regulatory_compliance_kubernetes_common_tags, {
    other_checks = "true"
  })
}

control "kubernetes_cluster_key_vault_secret_rotation_enabled" {
  title       = "Kubernetes clusters key vault secret rotation should be enabled"
  description = "This control checks if key vault secret rotation should is enabled for Kubernetes cluster."
  query       = query.kubernetes_cluster_key_vault_secret_rotation_enabled

  tags = merge(local.regulatory_compliance_kubernetes_common_tags, {
    other_checks = "true"
  })
}

control "kubernetes_cluster_max_pod_50" {
  title       = "Kubernetes clusters should use a minimum number of 50 pods"
  description = "This control checks if Kubernetes clusters is using a minimum number of 50 pods."
  query       = query.kubernetes_cluster_max_pod_50

  tags = merge(local.regulatory_compliance_kubernetes_common_tags, {
    other_checks = "true"
  })
}

control "kubernetes_cluster_network_policy_enabled" {
  title       = "Kubernetes clusters should have network policy enabled"
  description = "This control checks if network policy is enabled for Kubernetes cluster."
  query       = query.kubernetes_cluster_network_policy_enabled

  tags = merge(local.regulatory_compliance_kubernetes_common_tags, {
    other_checks = "true"
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
      end as reason
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
    select
      a.id as resource,
      case
        when
          a.kubernetes_version ~ '1\.13\.[0-4]'
          or a.kubernetes_version ~ '1\.12\.[0-6]'
          or a.kubernetes_version ~ '1\.11\.[0-8]'
          or a.kubernetes_version ~ '1\.\d|10\.*' then 'alarm'
        else 'ok'
      end as status,
      case
        when
          a.kubernetes_version ~ '1\.13\.[0-4]'
          or a.kubernetes_version ~ '1\.12\.[0-6]'
          or a.kubernetes_version ~ '1\.11\.[0-8]'
          or a.kubernetes_version ~ '1\.\d|10\.*' then a.name || ' not upgraded to a non-vulnerable Kubernetes version.'
        else a.name || ' upgraded to a non-vulnerable Kubernetes version.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_kubernetes_cluster as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "kubernetes_cluster_restrict_public_access" {
  sql = <<-EOQ
    select
      c.id as resource,
      case
        when api_server_access_profile ->> 'enablePrivateCluster' = 'true' then 'ok'
        else 'alarm'
      end as status,
      case
        when api_server_access_profile ->> 'enablePrivateCluster' = 'true' then c.name || ' not publicly accessible.'
        else c.name || ' publicly accessibe.'
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

query "kubernetes_cluster_addon_azure_policy_enabled" {
  sql = <<-EOQ
    select
      c.id as resource,
      case
        when addon_profiles -> 'azurepolicy' ->> 'enabled' = 'true' then 'ok'
        else 'alarm'
      end as status,
      case
        when addon_profiles -> 'azurepolicy' ->> 'enabled' = 'true' then c.name || ' addon azure policy enabled .'
        else c.name || ' addon azure policy disabled .'
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

query "kubernetes_cluster_node_restrict_public_access" {
  sql = <<-EOQ
    with public_node as (
      select
        distinct id
      from
        azure_kubernetes_cluster,
        jsonb_array_elements(agent_pool_profiles) as p
      where
        p ->> 'enableNodePublicIP' = 'true'
      group by
        id
    )
    select
      c.id as resource,
      case
        when n.id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when n.id is null then c.name || ' has no public node.'
        else c.name || ' has public node.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "c.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_kubernetes_cluster c
      left join public_node as n on n.id = c.id,
      azure_subscription sub
    where
      sub.subscription_id = c.subscription_id;
  EOQ
}

query "kubernetes_cluster_sku_standard" {
  sql = <<-EOQ
    select
      c.id as resource,
      case
        when sku ->> 'tier' = 'Paid' then 'ok'
        else 'alarm'
      end as status,
      case
        when sku ->> 'tier' = 'Paid' then c.name || ' uses standard SKU tier.'
        else c.name || ' uses free SKU tier.'
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

query "kubernetes_cluster_upgrade_channel" {
  sql = <<-EOQ
    select
      c.id as resource,
      case
        when auto_upgrade_profile ->> 'upgradeChannel' = 'none' then 'alarm'
        else 'ok'
      end as status,
      case
        when auto_upgrade_profile ->> 'upgradeChannel' = 'none' then c.name || ' upgrade channel not configured.'
        else c.name || ' upgrade channel configured.'
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

query "kubernetes_cluster_logging_enabled" {
  sql = <<-EOQ
    select
      c.id as resource,
      case
        when addon_profiles -> 'omsAgent' ->> 'enabled' = 'true' and addon_profiles -> 'omsAgent' ->> 'config' is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when addon_profiles -> 'omsAgent' ->> 'enabled' = 'true' and addon_profiles -> 'omsAgent' ->> 'config' is not null  then c.name || ' logging enabled.'
        else c.name || ' logging disabled.'
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

query "kubernetes_cluster_key_vault_secret_rotation_enabled" {
  sql = <<-EOQ
    select
      c.id as resource,
      case
        when addon_profiles -> 'azureKeyvaultSecretsProvider' -> 'config' ->> 'enableSecretRotation' = 'true' then 'ok'
        else 'alarm'
      end as status,
      case
        when addon_profiles -> 'azureKeyvaultSecretsProvider' -> 'config' ->> 'enableSecretRotation' = 'true' then c.name || ' key vault secret rotation enabled.'
        else c.name || ' key vault secret rotation disabled.'
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

query "kubernetes_cluster_max_pod_50" {
  sql = <<-EOQ
    with max_node as (
      select
        distinct id
      from
        azure_kubernetes_cluster,
        jsonb_array_elements(agent_pool_profiles) as p
      where
        (p ->> 'maxPods')::int < 50
    )
    select
      c.id as resource,
      case
        when n.id is not null then 'alarm'
        else 'ok'
      end as status,
      case
        when n.id is not null then c.name || ' nodes have pods less than 50.'
        else c.name || ' nodes have pods greater than 50.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "c.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_kubernetes_cluster c
      left join max_node as n on n.id = c.id,
      azure_subscription sub
    where
      sub.subscription_id = c.subscription_id;
  EOQ
}

query "kubernetes_cluster_network_policy_enabled" {
  sql = <<-EOQ
    select
      c.id as resource,
      case
        when network_profile ->> 'networkPolicy' is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when network_profile ->> 'networkPolicy' is not null then c.name || ' network policy enabled.'
        else c.name || ' network policy disabled.'
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
