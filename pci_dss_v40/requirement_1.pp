benchmark "pci_dss_v40_requirement_1" {
  title       = "Requirement 1 - Install and Maintain Network Security Controls"

  description = <<-MARKDOWN
    Network security controls (NSCs), such as firewalls and other network security technologies, are network policy enforcement points that
    typically control network traffic between two or more logical or physical network segments (or subnets) based on pre-defined policies or rules.

    NSCs examine all network traffic entering (ingress) and leaving (egress) a segment and decide, based on the policies defined, whether the
    network traffic is allowed to pass or whether it should be rejected. Typically, NSCs are placed between environments with different security
    needs or levels of trust, however in some environments NSCs control the traffic to individual devices irrespective of trust boundaries. Policy
    enforcement generally occurs at layer 3 of the OSI model, but data present in higher layers is also frequently used to determine policy
    decisions.

    Traditionally this function has been provided by physical firewalls; however, now this functionality may be provided by virtual devices, cloud
    access controls, virtualization/container systems, and other software-defined networking technology.

    NSCs are used to control traffic within an entity's own networks—for example, between highly sensitive and less sensitive areas—and also to
    protect the entity's resources from exposure to untrusted networks. The cardholder data environment (CDE) is an example of a more sensitive
    area within an entity's network. Often, seemingly insignificant paths to and from untrusted networks can provide unprotected pathways into
    sensitive systems. NSCs provide a key protection mechanism for any computer network.

    Common examples of untrusted networks include the Internet, dedicated connections such as business-to-business communication channels,
    wireless networks, carrier networks (such as cellular), third-party networks, and other sources outside the entity's ability to control. Furthermore,
    untrusted networks also include corporate networks that are considered out-of-scope for PCI DSS, because they are not assessed, and
    therefore must be treated as untrusted because the existence of security controls has not been verified. While an entity may consider an
    internal network to be trusted from an infrastructure perspective, if a network is out of scope for PCI DSS, that network must be considered
    untrusted for PCI DSS.

    Refer to Appendix G for definitions of PCI DSS terms.
  MARKDOWN

  children = [
    benchmark.pci_dss_v40_requirement_1_3,
    benchmark.pci_dss_v40_requirement_1_4
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_1_3" {
  title       = "1.3 - Network access to and from the cardholder data environment is restricted."

  children = [
    benchmark.pci_dss_v40_requirement_1_3_2
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_1_3_2" {
  title       = "1.3.2 - Outbound traffic from the CDE is restricted"

  description = <<-MARKDOWN
    Outbound traffic from the CDE is restricted as follows:

    * To only traffic that is necessary.
    * All other traffic is specifically denied.
  MARKDOWN

  children = [
    control.compute_vm_remote_access_restricted_all_ports,
    control.storage_account_default_network_access_rule_denied
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_1_4" {
  title       = "1.4 - Network connections between trusted and untrusted networks are controlled"
  children = [
    benchmark.pci_dss_v40_requirement_1_4_2
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_1_4_2" {
  title       = "1.4.2 - Inbound traffic from untrusted networks to trusted networks is restricted"

  description = <<-MARKDOWN
    Inbound traffic from untrusted networks to trusted networks is restricted to:

    * Communications with system components that are authorized to provide publicly accessible services, protocols, and ports.
    * Stateful responses to communications initiated by system components in a trusted network.
    * All other traffic is denied.
  MARKDOWN

  children = [
    control.compute_vm_remote_access_restricted_all_ports,
    control.storage_account_default_network_access_rule_denied
  ]

  tags = local.pci_dss_v40_common_tags
}
