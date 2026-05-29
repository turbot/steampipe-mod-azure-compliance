
control "unimplemented_control" {
  title = "Unimplemented control"
  query = query.unimplemented_control
}

query "unimplemented_control" {
  sql = <<-EOQ
    select
      id as resource,
      'info' as status,
      'Control not yet implemented.' as reason,
      display_name as subscription
    from
      azure_subscription;
  EOQ
}
