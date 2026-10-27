benchmark "pci_dss_v40_requirement_7" {
  title       = "Requirement 7 - Restrict Access to System Components and Cardholder Data by Business Need to Know"

  description = <<-MARKDOWN
    Unauthorized individuals may gain access to critical data or systems due to ineffective access control rules and definitions. To ensure critical
    data can only be accessed by authorized personnel, systems and processes must be in place to limit access based on need to know and
    according to job responsibilities.

    "Access" or "access rights" are created by rules that provide users access to systems, applications, and data, while "privileges" allow a user to
    perform a specific action or function in relation to that system, application, or data. For example, a user may have access rights to specific data,
    but whether they can only read that data, or can also change or delete the data is determined by the user’s assigned privileges.

    "Need to know" refers to providing access to only the least amount of data needed to perform a job.

    "Least privileges" refers to providing only the minimum level of privileges needed to perform a job.

    These requirements apply to user accounts and access for employees, contractors, consultants, and internal and external vendors and other
    third parties (for example, for providing support or maintenance services). Certain requirements also apply to application and system accounts
    used by the entity (also called "service accounts").

    **These requirements do not apply to consumers (cardholders).**

    Refer to Appendix G for definitions of PCI DSS terms.
  MARKDOWN

  children = [
    benchmark.pci_dss_v40_requirement_7_2,
    benchmark.pci_dss_v40_requirement_7_3
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_7_2" {
  title       = "7.2 - AcAccess to system components and data is appropriately defined and assigned"

  children = [
    benchmark.pci_dss_v40_requirement_7_2_1
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_7_2_1" {
  title       = "7.2.1 - Access requirements are established according to job functions following least-privilege and need-toknow principles"

  description = <<-MARKDOWN
    An access control model is defined and includes granting access as follows:

    * Appropriate access depending on the entity's business and access needs.
    * Access to system components and data resources that is based on users' job classification and functions.
    * The least privileges required (for example, user, administrator) to perform a job function.
  MARKDOWN

  children = [
    control.iam_subscription_owner_max_3,
    control.iam_subscription_owner_more_than_1
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_7_3" {
  title       = "7.3 - Access to system components and data is managed via an access control system(s)"
  children = [
    benchmark.pci_dss_v40_requirement_7_3_1
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_7_3_1" {
  title       = "7.3.1 - An access control system(s) is in place"

  description = <<-MARKDOWN
    An access control system(s) is in place that restricts access based on a user's need to know and covers all system components.
  MARKDOWN

  children = [
    control.iam_external_user_with_owner_role,
    control.iam_external_user_with_read_permission,
    control.iam_external_user_with_write_permission,
    control.sql_db_active_directory_admin_configured,
    control.iam_no_custom_role
  ]

  tags = local.pci_dss_v40_common_tags
}
