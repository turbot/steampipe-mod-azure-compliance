benchmark "rbi_itf_nbfc_v2016_authentication_framework_for_customers" {
  title = "Authentication Framework For Customers"
  children = [
    benchmark.rbi_itf_nbfc_v2016_authentication_framework_for_customers_9
  ]

  tags = local.rbi_itf_nbfc_v2016_common_tags
}

benchmark "rbi_itf_nbfc_v2016_authentication_framework_for_customers_9" {
  title = "Authentication Framework For Customers-9"
  children = [
    benchmark.rbi_itf_nbfc_v2016_authentication_framework_for_customers_9_1,
    benchmark.rbi_itf_nbfc_v2016_authentication_framework_for_customers_9_3,
  ]

  tags = local.rbi_itf_nbfc_v2016_common_tags
}

benchmark "rbi_itf_nbfc_v2016_authentication_framework_for_customers_9_1" {
  title = "Authentication Framework For Customers-9.1"
  children = [
    control.compute_vm_ssh_key_authentication_linux
  ]

  tags = local.rbi_itf_nbfc_v2016_common_tags
}

benchmark "rbi_itf_nbfc_v2016_authentication_framework_for_customers_9_3" {
  title = "Authentication Framework For Customers-9.3"
  children = [
    control.compute_vm_ssh_key_authentication_linux,
    control.iam_external_user_with_owner_role,
    control.iam_external_user_with_read_permission,
    control.iam_external_user_with_write_permission
  ]

  tags = local.rbi_itf_nbfc_v2016_common_tags
}