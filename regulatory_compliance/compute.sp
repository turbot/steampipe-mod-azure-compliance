locals {
  conformance_pack_compute_common_tags = {
    service = "compute"
  }
}

control "compute_os_and_data_disk_encrypted_with_cmk" {
  title       = "Disk encryption should be applied on virtual machines"
  description   = "Virtual machines without an enabled disk encryption will be monitored by Azure Security Center as recommendations."
  sql         = query.compute_os_and_data_disk_encrypted_with_cmk.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_unattached_disk_encrypted_with_cmk" {
  title       = "Unattached disks should be encrypted"
  description   = "This policy audits any unattached disk without encryption enabled."
  sql         = query.compute_unattached_disk_encrypted_with_cmk.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_attached_with_network" {
  title       = "Virtual machines should be connected to an approved virtual network"
  description   = "This policy audits any virtual machine connected to a virtual network that is not approved."
  sql         = query.compute_vm_attached_with_network.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_remote_access_restricted" {
  title       = "Adaptive network hardening recommendations should be applied on internet facing virtual machines"
  description   = "Azure Security Center analyzes the traffic patterns of Internet facing virtual machines and provides Network Security Group rule recommendations that reduce the potential attack surface."
  sql         = query.compute_vm_remote_access_restricted.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_tcp_udp_access_restricted_internet" {
  title       = "Internet-facing virtual machines should be protected with network security groups"
  description = "Protect your virtual machines from potential threats by restricting access to them with network security groups (NSG)."
  sql         = query.compute_vm_tcp_udp_access_restricted_internet.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_jit_access_protected" {
  title       = "Management ports of virtual machines should be protected with just-in-time network access control."
  description = "Possible network Just In Time (JIT) access will be monitored by Azure Security Center as recommendations"
  sql         = query.compute_vm_jit_access_protected.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_log_analytics_agent_installed" {
  title       = "The Log Analytics agent should be installed on virtual machines"
  description = "This policy audits any Windows/Linux virtual machines if the Log Analytics agent is not installed."
  sql         = query.compute_vm_log_analytics_agent_installed.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_log_analytics_agent_installed_windows" {
  title       = "Audit Windows machines on which the Log Analytics agent is not connected as expected"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if the agent is not installed, or if it is installed but the COM object AgentConfigManager.MgmtSvcCfg returns that it is registered to a workspace other than the ID specified in the policy parameter."
  sql         = query.compute_vm_log_analytics_agent_installed_windows.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_malware_agent_installed" {
  title       = "Deploy default Microsoft IaaSAntimalware extension for Windows Server"
  description = "This policy deploys a Microsoft IaaSAntimalware extension with a default configuration when a VM is not configured with the antimalware extension."
  sql         = query.compute_vm_malware_agent_installed.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}