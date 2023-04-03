# Non-Config rule query

query "ad_guest_user_reviewed_monthly" {
  sql = <<-EOQ
    select
      display_name as resource,
      case
        when not account_enabled then 'alarm'
        when created_date_time::timestamp <= (current_date - interval '30' day) then 'alarm'
        else 'ok'
      end as status,
      case
        when not account_enabled
          then 'Guest user ''' || display_name || ''' inactive.'
          else 'Guest user ''' || display_name || ''' was created ' || extract(day from current_timestamp - created_date_time::timestamp) || ' days ago.'
      end as reason,
      tenant_id
      ${local.common_dimensions_subscription_id_sql}
    from
      azuread_user
    where
      user_type = 'Guest';
  EOQ
}

query "ad_manual_control" {
  sql = <<-EOQ
    select
      'active_directory' as resource,
      'info' as status,
      'Manual verification required.' as reason;
  EOQ
}