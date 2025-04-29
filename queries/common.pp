query "automated" {
  sql = <<-EOQ
    select
      id as resource,
      'alarm' as status,
      'This control is not yet automated. Please check manually.' as reason,
      display_name as subscription
    from
      azure_subscription;
  EOQ
} 