
select
  -- Required columns
  id as resource,
  'info' as status,
  'Manual verification required. Check control description for more details.' as reason,
  -- Additional Dimensions
  display_name as subscription
from
  azure_subscription;
