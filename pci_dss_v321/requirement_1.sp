benchmark "pci_dss_v321_requirement_1" {
  title       = "Requirement 1: Install and maintain a firewall configuration to protect cardholder data"
  description = "Firewalls are devices that control computer traffic allowed into and out of an organization's network, and into sensitive areas within its internal network. Firewall functionality can also appear in other system components. Routers are hardware or software that connects two or more networks. All such networking devices are in scope for assessment of Requirement 1 if used within the cardholder data environment."
  children = [
    benchmark.pci_dss_v321_requirement_1_3
  ]

  tags = local.pci_dss_v321_common_tags
}

benchmark "pci_dss_v321_requirement_1_3" {
  title = "Prohibit direct public access between the Internet and any system component in the cardholder data environment"
  children = [
    benchmark.pci_dss_v321_requirement_1_3_2,
    benchmark.pci_dss_v321_requirement_1_3_4
  ]

  tags = local.pci_dss_v321_common_tags
}

benchmark "pci_dss_v321_requirement_1_3_2" {
  title = "Limit inbound Internet traffic to IP addresses within the DMZ"
  children = [
    control.compute_vm_remote_access_restricted_all_ports,
    control.storage_account_default_network_access_rule_denied
  ]

  tags = local.pci_dss_v321_common_tags
}

benchmark "pci_dss_v321_requirement_1_3_4" {
  title = "Do not allow unauthorized outbound traffic from the cardholder data environment to the Internet"
  children = [
    control.compute_vm_remote_access_restricted_all_ports,
    control.storage_account_default_network_access_rule_denied
  ]

  tags = local.pci_dss_v321_common_tags
}
