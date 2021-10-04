with app_service_environment as (
  select
    distinct id as id
  from
    azure_app_service_environment,
    jsonb_array_elements(cluster_settings ) as s
  where
    s ->> 'name' =  'InternalEncryption'
    and s ->> 'value' =  'true'
)
select
  -- Required Columns
  a.id as resource,
  case
    when b.id is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when b.id is not null then a.title || ' internal encryption enabled.'
    else a.name || ' internal encryption disabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_app_service_environment as a
  left join app_service_environment as b on a.id = b.id,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;