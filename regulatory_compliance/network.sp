locals {
  conformance_pack_network_common_tags = {
    service = "network"
  }
}

control "network_security_group_remote_access_restricted" {
  title       = "Management ports should be closed on your virtual machines"
  description = "Open remote management ports are exposing your VM to a high level of risk from Internet-based attacks. These attacks attempt to brute force credentials to gain admin access to the machine."
  sql         = query.network_security_group_remote_access_restricted.sql

  tags = merge(local.conformance_pack_network_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "network_security_group_rdp_access_restricted" {
  title       = "Windows machines should meet requirements for 'User Rights Assignment'"
  description = "Windows machines should have the specified Group Policy settings in the category 'User Rights Assignment' for allowing log on locally, RDP, access from the network, and many other user activities. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope."
  sql         = query.network_security_group_rdp_access_restricted.sql

  tags = merge(local.conformance_pack_network_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}


control "network_watcher_enabled" {
  title       = "Network Watcher should be enabled"
  description = "Network Watcher is a regional service that enables you to monitor and diagnose conditions at a network scenario level in, to, and from Azure. Scenario level monitoring enables you to diagnose problems at an end to end network level view. It is required to have a network watcher resource group to be created in every region where a virtual network is present. An alert is enabled if a network watcher resource group is not available in a particular region."
  sql         = query.network_watcher_enabled.sql

  tags = merge(local.conformance_pack_network_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "network_security_group_subnet_associated" {
  title       = "Subnets should be associated with a Network Security Group"
  description = "Protect your subnet from potential threats by restricting access to it with a Network Security Group (NSG). NSGs contain a list of Access Control List (ACL) rules that allow or deny network traffic to your subnet."
  sql         = query.network_security_group_subnet_associated.sql

  tags = merge(local.conformance_pack_network_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

