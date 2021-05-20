
select
  -- Required columns
  id as resource,
  'info' as status,
  'This is a manual control, you must verify compliance manually.' as reason,
  -- Additional Dimensions
  coalesce(display_name, split_part(subscription_id, '-', 5)) as subscription
from
  azure_subscription;