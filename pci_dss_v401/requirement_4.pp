
benchmark "pci_dss_v401_requirement_4" {
  title       = "4 - Protect Cardholder Data with Strong Cryptography During Transmission Over Open, Public Networks"

  description = <<-MARKDOWN
    The use of strong cryptography provides greater assurance in preserving data confidentiality, integrity, and non-repudiation.
    To protect against compromise, PAN must be encrypted during transmission over networks that are easily accessed by malicious individuals,
    including untrusted and public networks. Misconfigured wireless networks and vulnerabilities in legacy encryption and authentication protocols
    continue to be targeted by malicious individuals aiming to exploit these vulnerabilities to gain privileged access to cardholder data environments
    (CDE). Any transmissions of cardholder data over an entity's internal network(s) will naturally bring that network into scope for PCI DSS since
    that network stores, processes, or transmits cardholder data. Any such networks must be evaluated and assessed against applicable PCI DSS
    requirements.

    Requirement 4 applies to transmissions of PAN unless specifically called out in an individual requirement.
    PAN transmissions can be protected by encrypting the data before it is transmitted, or by encrypting the session over which the data is
    transmitted, or both. While it is not required that strong cryptography be applied at both the data level and the session level, it is recommended.

    Refer to Appendix G for definitions of "strong cryptography" and other PCI DSS terms.
  MARKDOWN

  children = [
    benchmark.pci_dss_v401_requirement_4_2,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_4_2" {
  title       = "4.2 - PAN is protected with strong cryptography during transmission."

  children = [
    benchmark.pci_dss_v401_requirement_4_2_1,
    benchmark.pci_dss_v401_requirement_4_2_2,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_4_2_1" {
  title       = "4.2.1 - Strong cryptography and security protocols are implemented as follows to safeguard PAN during transmission over open, public networks."

  description = <<-MARKDOWN
    Strong cryptography and security protocols are implemented as follows to safeguard PAN during transmission over open, public networks:

    * Only trusted keys and certificates are accepted.
    * Certificates used to safeguard PAN during transmission over open, public networks are confirmed as valid and are not expired or
      revoked. This bullet is a best practice until its effective date; refer to applicability notes below for details.
    * The protocol in use supports only secure versions or configurations and does not support fallback to, or use of insecure versions,
      algorithms, key sizes, or implementations.
    * The encryption strength is appropriate for the encryption methodology in use.
  MARKDOWN

  children = [
    benchmark.pci_dss_v401_requirement_4_2_1_2,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_4_2_1_2" {
  title       = "4.2.1.2 - Wireless networks transmitting PAN or connected to the CDE use industry best practices to implement strong cryptography for authentication and transmission."

  children = [
    # App Service apps should have Client Certificates (Incoming client certificates) enabled
    control.appservice_api_app_client_certificates_on,

    # Managed identity should be used in API apps
    control.managed_identity_should_be_used_in_api_apps,

    # Identical Authentication Credentials
    control.identical_authentication_credentials,

    # Windows machines should meet requirements for 'Security Settings - Account Policies'
    control.compute_vm_restrict_previous_24_passwords_resuse_windows,
    control.compute_vm_max_password_age_70_days_windows,
    control.compute_vm_min_password_age_1_day_windows,
    control.compute_vm_min_password_length_14_windows,
    control.compute_vm_password_complexity_setting_enabled_windows,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_4_2_2" {
  title       = "4.2.2 - PAN is secured with strong cryptography whenever it is sent via end-user messaging technologies."

  children = [
    # App Service apps should have Client Certificates (Incoming client certificates) enabled
    control.appservice_api_app_client_certificates_on,

    # Managed identity should be used in API apps
    control.managed_identity_should_be_used_in_api_apps,

    # Identical Authentication Credentials
    control.identical_authentication_credentials,

    # Windows machines should meet requirements for 'Security Settings - Account Policies'
    control.compute_vm_restrict_previous_24_passwords_resuse_windows,
    control.compute_vm_max_password_age_70_days_windows,
    control.compute_vm_min_password_age_1_day_windows,
    control.compute_vm_min_password_length_14_windows,
    control.compute_vm_password_complexity_setting_enabled_windows,
  ]

  tags = local.pci_dss_v401_common_tags
}
