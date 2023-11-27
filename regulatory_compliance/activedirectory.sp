locals {
  regulatory_compliance_activedirectory_common_tags = {
    service = "Azure/ActiveDirectory"
  }
}

control "ad_guest_user_reviewed_monthly" {
  title       = "Ensure guest users are reviewed on a monthly basis"
  description = "Guest users allow you to share your company's applications and services with users from any other organization, while maintaining control over your own corporate data. Guest users should be review on a monthly basis to ensure that inactive and unneeded accounts are removed."
  query       = query.ad_guest_user_reviewed_monthly

  tags = local.regulatory_compliance_activedirectory_common_tags
}

query "ad_guest_user_reviewed_monthly" {
  sql = <<-EOQ
    with distinct_tenant as (
      select
        distinct tenant_id
      from
        azure_tenant
    )
    select
      u.display_name as resource,
      case
        when not account_enabled then 'alarm'
        when u.created_date_time::timestamp <= (current_date - interval '30' day) then 'alarm'
        else 'ok'
      end as status,
      case
        when not account_enabled then 'Guest user ''' || u.display_name || ''' inactive.'
        else 'Guest user ''' || u.display_name || ''' was created ' || extract(day from current_timestamp - u.created_date_time::timestamp) || ' days ago.'
      end as reason,
      t.tenant_id
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      azuread_user as u
      left join distinct_tenant as t on t.tenant_id = u.tenant_id
    where
      u.user_type = 'Guest';
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
