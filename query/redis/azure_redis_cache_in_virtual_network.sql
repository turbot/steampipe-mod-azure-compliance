select
  -- Required Columns
  redis.id as resource,
  case
    when subnet_id is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when subnet_id is not null then redis.name || ' in virtual network.'
    else redis.name || ' not in virtual network.'
  end as reason,
  -- Additional Dimensions
  redis.resource_group,
  sub.display_name as subscription
from
  azure_redis_cache as redis,
  azure_subscription as sub
where
  sub.subscription_id = redis.subscription_id;