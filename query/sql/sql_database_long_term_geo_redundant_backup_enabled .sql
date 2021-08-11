select
  -- Required Columns
  s.database_id resource,
  case
    when retention_policy_property ->> 'monthlyRetention' <> 'PT0S'
      or retention_policy_property ->> 'weeklyRetention' <> 'PT0S'
      or retention_policy_property ->> 'yearlyRetention' <> 'PT0S'
      then 'ok'
      else 'alarm'
  end as status,
  case
    when retention_policy_property ->> 'monthlyRetention' <> 'PT0S'
      or retention_policy_property ->> 'weeklyRetention' <> 'PT0S'
      or retention_policy_property ->> 'yearlyRetention' <> 'PT0S'
      then s.title || ' long-term geo-redundant backup enabled.'
      else s.title || ' long-term geo-redundant backup disabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_sql_database s,
  azure_subscription sub
where
  sub.subscription_id = s.subscription_id
  and s.name <> 'master';