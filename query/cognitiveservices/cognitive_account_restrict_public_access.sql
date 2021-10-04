cognitive_account_restrict_public_access.sql

with account_with_public_access_restricted as (
  select
    a.id
  from
    azure_cognitive_account as a,
    jsonb_array_elements(capabilities) as c
  where
    c ->> 'name' = 'VirtualNetworks' and network_acls ->> 'defaultAction' <> 'Deny'
)
select
  -- Required Columns
  distinct a.name as resource,
  case
    when b.id is not null then 'alarm'
    else 'ok'
  end as status,
  case
    when b.id is not null then a.name || ' publicly accessible.'
    else a.name || ' publicly not accessible.'
  end as reason,
  -- Additional Dimensions
  a.resource_group,
  sub.display_name as subscription
from
  azure_cognitive_account as a
  left join account_with_public_access_restricted as b on a.id = b.id,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;