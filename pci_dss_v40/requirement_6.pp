benchmark "pci_dss_v40_requirement_6" {
  title       = "Requirement 6 - Develop and Maintain Secure Systems and Software"

  description = <<-MARKDOWN
    Actors with bad intentions can use security vulnerabilities to gain privileged access to systems. Many of these vulnerabilities are fixed by vendor
    provided security patches, which must be installed by the entities that manage the systems. All system components must have all appropriate
    software patches to protect against the exploitation and compromise of account data by malicious individuals and malicious software.
    Appropriate software patches are those patches that have been evaluated and tested sufficiently to determine that the patches do not conflict
    with existing security configurations. For bespoke and custom software, numerous vulnerabilities can be avoided by applying software lifecycle
    (SLC) processes and secure coding techniques.

    Code repositories that store application code, system configurations, or other configuration data that can impact the security of account data or
    the CDE are in scope for PCI DSS assessments.

    See Relationship between PCI DSS and PCI SSC Software Standards on page 7 for information about the use of PCI SSC-validated software
    and software vendors, and how use of PCI SSC’s software standards may help with meeting controls in Requirement 6.

    Refer to Appendix G for definitions of PCI DSS terms.

    **Note**: *Requirement 6 applies to all system components, except for section 6.2 for developing software securely, which applies only to bespoke
    and custom software used on any system component included in or connected to the CDE*
  MARKDOWN

  children = [
    benchmark.pci_dss_v40_requirement_6_2,
    benchmark.pci_dss_v40_requirement_6_3,
    benchmark.pci_dss_v40_requirement_6_4
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_6_2" {
  title       = "6.2 - Bespoke and custom software are developed securely"

  children = [
    benchmark.pci_dss_v40_requirement_6_2_4
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_6_2_4" {
  title       = "6.2.4 - Software engineering techniques or other methods are defined and in use by software development personnel to prevent or mitigate common software attacks and related vulnerabilities in bespoke and custom software"

  description = <<-MARKDOWN
    Software engineering techniques or other methods are defined and in use for bespoke and custom software by software development personnel to prevent or mitigate common software attacks and related vulnerabilities, including but not limited to the following:

    * Injection attacks, including SQL, LDAP, XPath, or other command, parameter, object, fault, or injection-type flaws.
    * Attacks on data and data structures, including attempts to manipulate buffers, pointers, input data, or shared data.
    * Attacks on cryptography usage, including attempts to exploit weak, insecure, or inappropriate cryptographic implementations, algorithms, cipher suites, or modes of operation.
    * Attacks on business logic, including attempts to abuse or bypass application features and functionalities through the manipulation of APIs, communication protocols and channels, clientside functionality, or other system/application functions and resources. This includes cross-site scripting (XSS) and cross-site request forgery (CSRF).
    * Attacks on access control mechanisms, including attempts to bypass or abuse identification, authentication, or authorization mechanisms, or attempts to exploit weaknesses in the implementation of such mechanisms.
    * Attacks via any "high-risk" vulnerabilities identified in the vulnerability identification process, as defined in Requirement 6.3.1.
  MARKDOWN

  children = [
    control.appservice_function_app_only_https_accessible,
    control.automation_account_variable_encryption_enabled,
    control.servicefabric_cluster_protection_level_as_encrypt_and_sign,
    control.sql_database_transparent_data_encryption_enabled,
    control.redis_cache_ssl_enabled,
    control.storage_account_secure_transfer_required_enabled,
    control.appservice_api_app_use_https
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_6_3" {
  title       = "6.3 - Security vulnerabilities are identified and addressed"
  children = [
    benchmark.pci_dss_v40_requirement_6_3_3
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_6_3_3" {
  title       = "6.3.3 - All system components are protected from known vulnerabilities by installing applicable security patches/updates"

  description = <<-MARKDOWN
    All system components are protected from known vulnerabilities by installing applicable security patches/updates as follows:

    * Critical or high-security patches/updates are identified according to the risk ranking process at Requirement 6.3.1.
    * Critical or high-security patches/updates are installed within one month of release.
    * All other applicable security patches/updates are installed within an appropriate time frame as determined by the entity (for example, within three months of release).
  MARKDOWN

  children = [
    # NOTE: split by Windows and Linux
    control.compute_vm_security_configuration_vulnerabilities_remediated,
    control.sql_database_vulnerability_findings_resolved,
    # NOTE: Missing "Machines should have vulnerability findings resolved"
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_6_4" {
  title       = "6.4 - Public-facing web applications are protected against attacks"
  children = [
    benchmark.pci_dss_v40_requirement_6_4_1
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_6_4_1" {
  title       = "6.4.1 - For public-facing web applications, new threats and vulnerabilities are addressed on an ongoing basis and these applications are protected against known attacks"
  description = <<-MARKDOWN
    For public-facing web applications, new threats and vulnerabilities are addressed on an ongoing basis and these applications are protected against known attacks as follows:

    * Reviewing public-facing web applications via manual or automated application vulnerability security assessment tools or methods as follows:
      * At least once every 12 months and after significant changes.
      * By an entity that specializes in application security.
      * Including, at a minimum, all common software attacks in Requirement 6.3.6.
      * All vulnerabilities are ranked in accordance with requirement 6.2.1.
      * All vulnerabilities are corrected.
      * The application is re-evaluated after the corrections

    **OR**

    * Installing an automated technical solution(s) that continually detects and prevents web-based attacks as follows:
      * Installed in front of public-facing web applications to detect and prevent webbased attacks.
      * Actively running and up to date as applicable.
      * Generating audit logs.
      * Configured to either block web-based attacks or generate an alert that is immediately investigated.
  MARKDOWN
  children = [
    # NOTE: split by Windows and Linux
    control.compute_vm_security_configuration_vulnerabilities_remediated,
    control.sql_database_vulnerability_findings_resolved,
    # NOTE: Missing "Machines should have vulnerability findings resolved"
  ]

  tags = local.pci_dss_v40_common_tags
}
