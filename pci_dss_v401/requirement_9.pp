
benchmark "pci_dss_v401_requirement_9" {
  title       = "9 - Restrict Physical Access to Cardholder Data"

  description = <<-MARKDOWN
    Any physical access to cardholder data or systems that store, process, or transmit cardholder data provides the opportunity for individuals to
    access and/or remove systems or hardcopies containing cardholder data; therefore, physical access should be appropriately restricted.
    There are three different areas mentioned in Requirement 9:

    1. Requirements that specifically refer to sensitive areas are intended to apply to those areas only. Each entity should identify the sensitive
      areas in its environments to ensure the appropriate physical controls are implemented.

    2. Requirements that specifically refer to the cardholder data environment (CDE) are intended to apply to the entire CDE, including any
      sensitive areas residing within the CDE.

    3. Requirements that specifically refer to the facility are referencing the types of controls that may be managed more broadly at the
      physical boundary of a business premise (such as a building) within which CDEs and sensitive areas reside. These controls often exist
      outside a CDE or sensitive area, for example a guard desk that identifies, badges, and logs visitors. The term "facility" is used to
      recognize that these controls may exist at different places within a facility, for instance, at building entry or at an internal entrance to a
      data center or office space.

      Refer to Appendix G for definitions of "media," "personnel," "sensitive areas," "visitors," and other PCI DSS terms.
  MARKDOWN

  children = [
    benchmark.pci_dss_v401_requirement_9_4,
    benchmark.pci_dss_v401_requirement_9_5,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_9_4" {
  title       = "9.4 - Media with cardholder data is securely stored, accessed, distributed, and destroyed."

  children = [
    benchmark.pci_dss_v401_requirement_9_4_1,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_9_4_1" {
  title       = "9.4.1 - All media with cardholder data is physically secured."

  children = [
    benchmark.pci_dss_v401_requirement_9_4_1_2,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_9_4_1_2" {
  title       = "9.4.1.2 - The security of the offline media backup location(s) with cardholder data is reviewed at least once every 12 months."

  children = [
    # Transfer backup information to an alternate storage site
    control.transfer_backup_information_to_an_alternate_storage_site,

    # Separately store backup information
    control.separately_store_backup_information,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_9_5" {
  title       = "9.5 - Point-of-interaction (POI) devices are protected from tampering and unauthorized substitution."

  children = [
    benchmark.pci_dss_v401_requirement_9_5_1,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_9_5_1" {
  title       = "9.5.1 - POI devices that capture payment card data via direct physical interaction with the payment card form factor are protected from tampering and unauthorized substitution"

  description = <<-MARKDOWN
    POI devices that capture payment card data via direct physical interaction with the payment card form factor are protected from tampering and
    unauthorized substitution, including the following:

    * Maintaining a list of POI devices.
    * Periodically inspecting POI devices to look for tampering or unauthorized substitution.
    * Training personnel to be aware of suspicious behavior and to report tampering or unauthorized substitution of devices.
  MARKDOWN

  children = [
    benchmark.pci_dss_v401_requirement_9_5_1_1,
    benchmark.pci_dss_v401_requirement_9_5_1_3,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_9_5_1_1" {
  title       = "9.5.1.1 - An up-to-date list of POI devices is maintained"

  description = <<-MARKDOWN
    An up-to-date list of POI devices is maintained, including:

    * Make and model of the device.
    * Location of device.
    * Device serial number or other methods of unique identification.
  MARKDOWN

  children = [
    # Dependency agent should be enabled for listed virtual machine images
    control.dependency_agent_should_be_enabled_for_listed_virtual_machine_images,

    # Azure Monitor log profile should collect logs for categories 'write,' 'delete,' and 'action'
    control.monitor_log_profile_enabled_for_all_categories,

    # Microsoft IaaSAntimalware extension should be deployed on Windows servers
    control.compute_vm_malware_agent_installed,

    # Virtual machines' Guest Configuration extension should be deployed with system-assigned managed identity
    control.compute_vm_guest_configuration_with_system_assigned_managed_identity,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_9_5_1_3" {
  title       = "9.5.1.3 - Training is provided for personnel in POI environments to be aware of attempted tampering or replacement of POI devices"

  description = <<-MARKDOWN
    Training is provided for personnel in POI environments to be aware of attempted tampering or replacement of POI devices, and includes:

    * Verifying the identity of any third-party persons claiming to be repair or maintenance personnel, before granting them access to modify or
      troubleshoot devices.
    * Procedures to ensure devices are not installed, replaced, or returned without verification.
    * Being aware of suspicious behavior around devices.
    * Reporting suspicious behavior and indications of device tampering or substitution to appropriate personnel.
  MARKDOWN

  children = [
    # Subscriptions should have a contact email address for security issues
    control.securitycenter_email_configured,

    # Email notification for high severity alerts should be enabled
    control.securitycenter_notify_alerts_configured,
  ]

  tags = local.pci_dss_v401_common_tags
}
