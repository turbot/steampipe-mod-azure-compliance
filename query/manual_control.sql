
select
  -- Required columns
  id as resource,
  'info' as status,
  'This is a manual control, you must verify compliance manually.' as reason,
  -- Additional Dimensions
  display_name as subscription
from
  azure_subscription;