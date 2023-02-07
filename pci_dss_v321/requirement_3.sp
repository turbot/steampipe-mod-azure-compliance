benchmark "pci_dss_v321_requirement_3" {
  title       = "Requirement 3: Protect stored cardholder data"
  description = "Cardholder data should not be stored unless it's necessary to meet the needs of the business. Sensitive data on the magnetic stripe or chip must never be stored after authorization. If your organization stores PAN, it is crucial to render it unreadable (see 3.4, and table below for guidelines) "
  children = [
    benchmark.pci_dss_v321_requirement_3_2
  ]

  tags = local.pci_dss_v321_common_tags
}

benchmark "pci_dss_v321_requirement_3_2" {
  title = "Do not store sensitive authentication data after authorization (even if it is encrypted). Render all sensitive authentication data unrecoverable upon completion of the authorization process. Issuers and related entities may store sensitive authentication data if there is a business justification, and the data is stored securely"
  children = [
    control.sql_server_azure_ad_authentication_enabled,
    control.iam_external_user_with_owner_role,
    control.iam_external_user_with_read_permission,
  ]

  tags = local.pci_dss_v321_common_tags
}
