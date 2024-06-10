benchmark "rbi_itf_nbfc_v2016_user_access_control_management" {
  title = "User Access Control / Management"
  
  children = [
    benchmark.rbi_itf_nbfc_v2016_user_access_control_management_8
  ]

  tags = local.rbi_itf_nbfc_v2016_common_tags
}

benchmark "rbi_itf_nbfc_v2016_user_access_control_management_8" {
  title = "User Access Control / Management-8"

  children = [
    benchmark.rbi_itf_nbfc_v2016_user_access_control_management_8_1,
    benchmark.rbi_itf_nbfc_v2016_user_access_control_management_8_2
  ]

  tags = local.rbi_itf_nbfc_v2016_common_tags
}

benchmark "rbi_itf_nbfc_v2016_user_access_control_management_8_1" {
  title = "User Access Control / Management-8.1"

  children = [
    control.iam_deprecated_account,
    control.iam_deprecated_account_with_owner_roles,
    control.iam_external_user_with_owner_role,
    control.iam_external_user_with_read_permission,
    control.iam_external_user_with_write_permission,
    control.iam_no_custom_role
  ]

  tags = local.rbi_itf_nbfc_v2016_common_tags
}

benchmark "rbi_itf_nbfc_v2016_user_access_control_management_8_2" {
  title = "User Access Control / Management-8.2"

  children = [
    control.iam_deprecated_account,
    control.iam_deprecated_account_with_owner_roles,
    control.iam_external_user_with_owner_role,
    control.iam_external_user_with_read_permission,
    control.iam_external_user_with_write_permission,
    control.servicefabric_cluster_active_directory_authentication_enabled,
    control.sql_server_azure_ad_authentication_enabled
  ]

  tags = local.rbi_itf_nbfc_v2016_common_tags
}