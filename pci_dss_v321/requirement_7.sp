benchmark "pci_dss_v321_requirement_7" {
  title       = "Requirement 7: Restrict access to cardholder data by business need-to-know"
  description = "To ensure critical data can only be accessed by authorized personnel, systems and processes must be in place to limit access based on need to know and according to job responsibilities. Need to know is when access rights are granted to only the least amount of data and privileges needed to perform a job."
  children = [
    benchmark.pci_dss_v321_requirement_7_1,
    benchmark.pci_dss_v321_requirement_7_2
  ]

  tags = local.pci_dss_v321_common_tags
}

benchmark "pci_dss_v321_requirement_7_1" {
  title = "Limit access to system components and cardholder data to only those individuals whose job requires such access"
  children = [
    benchmark.pci_dss_v321_requirement_7_1_1,
    benchmark.pci_dss_v321_requirement_7_1_2,
    benchmark.pci_dss_v321_requirement_7_1_3
  ]

  tags = local.pci_dss_v321_common_tags
}

benchmark "pci_dss_v321_requirement_7_1_1" {
  title = "Define access needs for each role, including: - System components and data resources that each role needs to access for their job function - Level of privilege required (for example, user, administrator, etc.) for accessing resources"
  children = [
    control.iam_subscription_owner_max_3,
    control.iam_subscription_owner_more_than_1
  ]

  tags = merge(local.pci_dss_v321_common_tags, {
    service = "Azure/ActiveDirectory"
  })
}

benchmark "pci_dss_v321_requirement_7_1_2" {
  title = "Restrict access to privileged user IDs to least privileges necessary to perform job responsibilities"
  children = [
    control.iam_subscription_owner_max_3,
    control.iam_subscription_owner_more_than_1
  ]

  tags = merge(local.pci_dss_v321_common_tags, {
    service = "Azure/ActiveDirectory"
  })
}

benchmark "pci_dss_v321_requirement_7_1_3" {
  title = "Assign access based on individual personnel's job classification and function"
  children = [
    control.iam_subscription_owner_max_3,
    control.iam_subscription_owner_more_than_1
  ]

  tags = merge(local.pci_dss_v321_common_tags, {
    service = "Azure/ActiveDirectory"
  })
}

benchmark "pci_dss_v321_requirement_7_2" {
  title = "Establish an access control system(s) for systems components that restricts access based on a user's need to know, and is set to “deny all” unless specifically allowed"
  children = [
    benchmark.pci_dss_v321_requirement_7_2_1
  ]

  tags = merge(local.pci_dss_v321_common_tags, {
    service = "Azure/Monitor"
  })
}

benchmark "pci_dss_v321_requirement_7_2_1" {
  title = "Coverage of all system components"
  children = [
    control.sql_server_azure_ad_authentication_enabled,
    control.iam_no_custom_role,
    control.iam_external_user_with_owner_role,
    control.iam_external_user_with_read_permission,
    control.iam_external_user_with_write_permission
    // control 6
    // control 7
  ]

  tags = local.pci_dss_v321_common_tags
}