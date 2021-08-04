select
  -- Required Columns
  redis.id as resource,
  case
    when enable_non_ssl_port then 'alarm'
    else 'ok'
  end as status,
  case
    when enable_non_ssl_port then redis.name || ' secure connections disabled.'
    else redis.name || ' secure connections enabled.'
  end as reason,
  -- Additional Dimensions
  redis.resource_group,
  sub.display_name as subscription
from
  azure_redis_cache as redis,
  azure_subscription as sub
where
  sub.subscription_id = redis.subscription_id;